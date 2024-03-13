import 'package:cleanup_template/cleanup_template.dart';
import 'package:cleanup_template/src/file_system.dart';
import 'package:cleanup_template/src/models/exit_status.dart';
import 'package:cleanup_template/src/services/cleanup_service.dart';
import 'package:cleanup_template/src/services/flutter_sdk_service.dart';
import 'package:file/memory.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/test.dart';

import 'fakes/services/fake_cleanup_service.dart';
import 'fakes/services/fake_flutter_sdk_service.dart';

void main() {
  test('cleanupTemplate', () async {
    final fileSystem = MemoryFileSystem();

    final container = ProviderContainer(
      overrides: [
        fileSystemProvider.overrideWithValue(fileSystem),
        flutterSdkServiceProvider.overrideWithValue(FakeFlutterSdkService()),
        cleanupServiceProvider.overrideWithValue(FakeCleanupService()),
      ],
    );
    addTearDown(container.dispose);

    final status = await cleanupTemplate(container);

    expect(status, ExitStatus.success);
  });
}
