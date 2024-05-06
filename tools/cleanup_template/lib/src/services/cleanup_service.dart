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
    // setup fvm
    Process.runSync(
      'dart',
      ['pub', 'global', 'activate', 'fvm'],
    ).throwExceptionIfFailed();

    // flutter-training-practice-template/
    final rootDir = _fileSystem.directory(
      path.normalize(
        path.join(_fileSystem.currentDirectory.path, '../../'),
      ),
    );

    final tempDir = _fileSystem.systemTempDirectory;

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
        workingDirectory: tempDir.path,
      ).throwExceptionIfFailed();

      // remove .gitignore
      final gitignoreFile =
          _fileSystem.file(path.join(tempDir.path, '.gitignore'));
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
        workingDirectory: tempDir.path,
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
        workingDirectory: tempDir.path,
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
        workingDirectory: tempDir.path,
      ).throwExceptionIfFailed();

      // add constraints for the Flutter SDK
      final pubspecPath = path.join(tempDir.path, 'pubspec.yaml');
      final pubspecFlie = _fileSystem.file(pubspecPath);
      final pubspecFileContent = pubspecFlie.readAsStringSync();
      final pubspecFileNewContent = pubspecFileContent.replaceFirstMapped(
        RegExp(r'environment:\n  sdk:.+\n'),
        (match) {
          final all = match.group(0)!;
          return '$all  flutter: ^$flutterVersion\n';
        },
      );
      pubspecFlie.writeAsStringSync(pubspecFileNewContent);

      // override analysis_options.yaml
      Process.runSync(
        'fvm',
        [
          'dart',
          'run',
          'yumemi_lints',
          'update',
        ],
        workingDirectory: tempDir.path,
      ).throwExceptionIfFailed();

      // setting dart.flutterSdkPath
      final githubTemplatesPath = path.join(rootDir.path, '.github/templates');
      final settingsJson = _fileSystem.file(
        path.join(githubTemplatesPath, '.vscode/settings.json'),
      );
      final replacedContent = settingsJson.readAsStringSync().replaceFirst(
            RegExp('{{flutterVersion}}'),
            flutterVersion.toString(),
          );
      settingsJson.writeAsStringSync(replacedContent);

      // copy templates contents to tempDir
      Process.runSync(
        'cp',
        ['-R', '$githubTemplatesPath/.', tempDir.path],
      ).throwExceptionIfFailed();

      // delete anything except tempDir and toolsDir
      Process.runSync(
        'rm',
        [
          '-rf',
          ...[
            '.gitignore',
            '.github/',
            'docs/',
            'packages/',
            'LICENSE',
            'README.md',
          ].map((e) => path.join(rootDir.path, e)),
        ],
      ).throwExceptionIfFailed();

      // copy tempDir contents to rootDir
      Process.runSync(
        'cp',
        ['-R', '${tempDir.path}/.', rootDir.path],
      ).throwExceptionIfFailed();

      // delete tools directory
      final toolsDir = _fileSystem.directory(
        path.join(
          rootDir.path,
          'tools',
        ),
      );
      toolsDir.deleteSync(recursive: true);

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
