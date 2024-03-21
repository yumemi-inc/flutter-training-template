import 'package:cleanup_template/src/models/flutter_sdk_release.dart';
import 'package:cleanup_template/src/services/flutter_sdk_service.dart';
import 'package:pub_semver/pub_semver.dart';

class FakeFlutterSdkService implements FlutterSdkService {
  @override
  Future<FlutterSdkRelease> getLatestFlutterSdkRelease() async {
    return FlutterSdkRelease(
      channel: FlutterChannel.stable,
      version: Version(3, 19, 0),
    );
  }

  @override
  Future<Version> getLatestFlutterSdkVersion() async {
    return Version(3, 19, 0);
  }
}
