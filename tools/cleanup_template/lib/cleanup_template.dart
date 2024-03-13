import 'dart:io';

import 'package:cleanup_template/src/models/exit_status.dart';

Future<ExitStatus> run() async {
  // setup fvm
  final result = Process.runSync('dart', ['pub', 'global', 'activate', 'fvm']);
  final exitStatus = ExitStatus.fromCode(result.exitCode);
  if (exitStatus != ExitStatus.success) {
    print(result.stdout);
    return exitStatus;
  }

  return ExitStatus.success;
}
