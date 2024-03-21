// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'flutter_sdk_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flutterSdkServiceHash() => r'c61c0af1623cd0a26fd30cfe776a142bc95f5919';

/// See also [flutterSdkService].
@ProviderFor(flutterSdkService)
final flutterSdkServiceProvider =
    AutoDisposeProvider<FlutterSdkService>.internal(
  flutterSdkService,
  name: r'flutterSdkServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterSdkServiceHash,
  dependencies: <ProviderOrFamily>[appClientProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    appClientProvider,
    ...?appClientProvider.allTransitiveDependencies
  },
);

typedef FlutterSdkServiceRef = AutoDisposeProviderRef<FlutterSdkService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
