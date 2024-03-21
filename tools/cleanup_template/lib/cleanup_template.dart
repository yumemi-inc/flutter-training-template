import 'package:cleanup_template/src/models/exit_status.dart';
import 'package:cleanup_template/src/services/cleanup_service.dart';
import 'package:cleanup_template/src/services/flutter_sdk_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

Future<ExitStatus> run() async {
  final container = ProviderContainer();

  try {
    final exitStatus = await cleanupTemplate(container);
    return exitStatus;
  } finally {
    container.dispose();
  }
}

Future<ExitStatus> cleanupTemplate(ProviderContainer container) async {
  final flutterSdkService = container.read(flutterSdkServiceProvider);
  final cleanupService = container.read(cleanupServiceProvider);

  try {
    final flutterVersion = await flutterSdkService.getLatestFlutterSdkVersion();
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
