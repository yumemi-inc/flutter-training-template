import 'dart:io';

import 'package:cleanup_template/src/file_system.dart';
import 'package:cleanup_template/src/models/exit_status.dart';
import 'package:cleanup_template/src/services/cleanup_service.dart';
import 'package:cleanup_template/src/services/flutter_sdk_service.dart';
import 'package:file/local.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

Future<ExitStatus> run() async {
  // setup fvm
  final result = Process.runSync('dart', ['pub', 'global', 'activate', 'fvm']);
  final exitStatus = ExitStatus.fromCode(result.exitCode);
  if (exitStatus != ExitStatus.success) {
    print(result.stdout);
    return exitStatus;
  }

  final fileSystem = LocalFileSystem();

  final container = ProviderContainer(
    overrides: [
      fileSystemProvider.overrideWithValue(fileSystem),
    ],
  );

  try {
    final exitStatus = await cleanupTemplate(container);
    return exitStatus;
  } finally {
    container.dispose();
  }
}

Future<ExitStatus> cleanupTemplate(ProviderContainer container) async {
  final sdkService = container.read(flutterSdkServiceProvider);
  final cleanupService = container.read(cleanupServiceProvider);

  try {
    final flutterVersion = await sdkService.getLatestFlutterSdkVersion();
    final exitStatus = cleanupService.call(flutterVersion);

    return exitStatus;
  } on CheckedFromJsonException catch (e) {
    print(e.message);
    return ExitStatus.errors;
  } on FormatException catch (e) {
    print(e.message);
    return ExitStatus.errors;
  } on Exception catch (e) {
    print(e);
    return ExitStatus.errors;
  }
}
