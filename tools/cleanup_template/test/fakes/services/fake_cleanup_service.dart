import 'package:cleanup_template/src/models/exit_status.dart';
import 'package:cleanup_template/src/services/cleanup_service.dart';
import 'package:pub_semver/src/version.dart';

class FakeCleanupService implements CleanupService {
  @override
  ExitStatus call(Version flutterVersion) {
    return ExitStatus.success;
  }
}
