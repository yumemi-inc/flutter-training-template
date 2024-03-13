import 'dart:io';

import 'package:cleanup_template/src/file_system.dart';
import 'package:cleanup_template/src/models/exit_status.dart';
import 'package:cleanup_template/src/services/cleanup_service.dart';
import 'package:cleanup_template/src/services/flutter_sdk_service.dart';
import 'package:file/local.dart';
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

  final flutterVersion = await sdkService.getLatestFlutterSdkVersion();
  return  cleanupService.call(flutterVersion);
}
