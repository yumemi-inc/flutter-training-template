// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'cleanup_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cleanupServiceHash() => r'071521002621dcfd0d94392783785c7d4b5ab56e';

/// See also [cleanupService].
@ProviderFor(cleanupService)
final cleanupServiceProvider = AutoDisposeProvider<CleanupService>.internal(
  cleanupService,
  name: r'cleanupServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cleanupServiceHash,
  dependencies: <ProviderOrFamily>[fileSystemProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    fileSystemProvider,
    ...?fileSystemProvider.allTransitiveDependencies
  },
);

typedef CleanupServiceRef = AutoDisposeProviderRef<CleanupService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
