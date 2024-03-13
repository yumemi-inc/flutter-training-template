import 'package:cleanup_template/src/models/exit_status.dart';

class ProcessRunException implements Exception {
  const ProcessRunException(this.exitStatus, this.message);
  final ExitStatus exitStatus;
  final String message;
}
