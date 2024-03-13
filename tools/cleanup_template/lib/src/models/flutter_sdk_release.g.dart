// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'flutter_sdk_release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlutterSdkReleaseImpl _$$FlutterSdkReleaseImplFromJson(
        Map<String, dynamic> json) =>
    _$FlutterSdkReleaseImpl(
      channel: $enumDecode(_$FlutterChannelEnumMap, json['channel']),
      version:
          const _VersionJsonConverter().fromJson(json['version'] as String),
    );

Map<String, dynamic> _$$FlutterSdkReleaseImplToJson(
        _$FlutterSdkReleaseImpl instance) =>
    <String, dynamic>{
      'channel': _$FlutterChannelEnumMap[instance.channel]!,
      'version': const _VersionJsonConverter().toJson(instance.version),
    };

const _$FlutterChannelEnumMap = {
  FlutterChannel.dev: 'dev',
  FlutterChannel.beta: 'beta',
  FlutterChannel.stable: 'stable',
};
