import 'dart:convert';

import 'package:cleanup_template/src/clients/app_client.dart';
import 'package:cleanup_template/src/models/flutter_sdk_release.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_sdk_service.g.dart';

@Riverpod(dependencies: [appClient])
FlutterSdkService flutterSdkService(FlutterSdkServiceRef ref) {
  final appClient = ref.watch(appClientProvider);
  return FlutterSdkService(
    appClient: appClient,
  );
}

class FlutterSdkService {
  const FlutterSdkService({
    required AppClient appClient,
  }) : _appClient = appClient;

  final AppClient _appClient;

  Future<FlutterSdkRelease> getLatestFlutterSdkRelease() async {
    final url = Uri.https(
      'storage.googleapis.com',
      '/flutter_infra_release/releases/releases_linux.json',
    );

    final responseBody = await _appClient.read(url);

    final json = jsonDecode(responseBody);
    if (json is! Map<String, dynamic>) {
      throw FormatException(
        'The type of `json` should be `Map<String, dynamic>`.',
      );
    }
    final releases = json['releases'];
    if (releases is! List<dynamic>) {
      throw FormatException(
        'The type of `releases` should be `List<dynamic>`.',
      );
    }

    return releases.map((release) {
      if (release is! Map<String, dynamic>) {
        throw FormatException(
          'The type of `release` should be `Map<String, dynamic>`.',
        );
      }
      return FlutterSdkRelease.fromJson(release);
    }).firstWhere((release) => release.channel == FlutterChannel.stable);
  }

  Future<Version> getLatestFlutterSdkVersion() async {
    final latestFlutterSdkRelease = await getLatestFlutterSdkRelease();
    return latestFlutterSdkRelease.version;
  }
}
