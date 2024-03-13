import 'dart:io';

import 'package:cleanup_template/src/file_system.dart';
import 'package:cleanup_template/src/models/exit_status.dart';
import 'package:cleanup_template/src/utils/process_run_exception.dart';
import 'package:file/file.dart';
import 'package:path/path.dart' as path;
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cleanup_service.g.dart';

@Riverpod(dependencies: [fileSystem])
CleanupService cleanupService(CleanupServiceRef ref) {
  final fileSystem = ref.watch(fileSystemProvider);

  return CleanupService(
    fileSystem: fileSystem,
  );
}

class CleanupService {
  CleanupService({
    required FileSystem fileSystem,
  }) : _fileSystem = fileSystem;

  final FileSystem _fileSystem;

  ExitStatus call(Version flutterVersion) {
    // flutter-training-practice-template/
    final rootDir = _fileSystem.directory(
      path.normalize(
        path.join(_fileSystem.currentDirectory.path, '../../'),
      ),
    );

    // flutter-training-practice-template/tmp
    final tmpDir = _fileSystem.directory('${rootDir.path}/tmp')..createSync();

    try {
      // install latest flutter sdk and setup
      Process.runSync(
        'fvm',
        ['install', flutterVersion.toString(), '-s'],
      ).throwExceptionIfFailed();

      // create .fvm/
      Process.runSync(
        'fvm',
        ['use', flutterVersion.toString(), '-f'],
        workingDirectory: tmpDir.path,
      ).throwExceptionIfFailed();

      // remove .gitignore
      final gitignoreFile =
          _fileSystem.file(path.join(tmpDir.path, '.gitignore'));
      gitignoreFile.deleteSync();

      // create flutter project
      Process.runSync(
        'fvm',
        [
          'flutter',
          'create',
          '-t',
          'app',
          '--empty',
          '-i',
          'swift',
          '-a',
          'kotlin',
          '--platforms',
          'ios,android',
          '--org',
          'jp.co.yumemi',
          '--project-name',
          'flutter_training',
          '.',
        ],
        workingDirectory: tmpDir.path,
      ).throwExceptionIfFailed();

      // add .fvm/ to gitignore
      gitignoreFile.writeAsStringSync(
        '''

# FVM Version Cache
.fvm/
''',
        mode: FileMode.append,
      );

      // add yumemi_lints
      Process.runSync(
        'fvm',
        [
          'flutter',
          'pub',
          'add',
          '--dev',
          'yumemi_lints',
        ],
        workingDirectory: tmpDir.path,
      ).throwExceptionIfFailed();

      // delete flutter_lints
      Process.runSync(
        'fvm',
        [
          'flutter',
          'pub',
          'remove',
          'flutter_lints',
        ],
        workingDirectory: tmpDir.path,
      ).throwExceptionIfFailed();

      // override analysis_options.yaml
      final analysisOptionsPath = path.join(
        tmpDir.path,
        'analysis_options.yaml',
      );
      _fileSystem.file(analysisOptionsPath).writeAsStringSync('''
# https://pub.dev/packages/yumemi_lints
include: package:yumemi_lints/flutter/$flutterVersion/recommended.yaml
''');

      // copy templates contents to tmpDir
      final rootDirPath = rootDir.path;
      final githubTemplatesPath = path.join(rootDirPath, '.github/templates');
      Process.runSync(
        'cp',
        ['-R', '$githubTemplatesPath/.', tmpDir.path],
      ).throwExceptionIfFailed();

      // Delete anything except tmpDir
      Process.runSync('rm', [
        '-rf',
        path.join(rootDir.path, '.gitignore'),
        path.join(rootDirPath, '.github/'),
        path.join(rootDirPath, 'docs/'),
        path.join(rootDirPath, 'packages/'),
        path.join(rootDirPath, 'LICENSE'),
        path.join(rootDirPath, 'README.md'),
      ]).throwExceptionIfFailed();

      // copy tmpDir contents to rootDirPath
      Process.runSync(
        'cp',
        ['-R', '${tmpDir.path}/.', rootDirPath],
      ).throwExceptionIfFailed();

      // delete tmpDir
      _fileSystem.directory(tmpDir.path).deleteSync(recursive: true);
      return ExitStatus.success;
    } on ProcessRunException catch (e) {
      print(e.message);
      return e.exitStatus;
    } on FileSystemException catch (e) {
      print(e.message);
      return ExitStatus.errors;
    }
  }
}

extension _ProcessResultExt on ProcessResult {
  void throwExceptionIfFailed() {
    final exitStatus = ExitStatus.fromCode(exitCode);
    if (exitStatus != ExitStatus.success) {
      throw ProcessRunException(exitStatus, stdout.toString());
    }
  }
}
