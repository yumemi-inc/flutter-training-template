// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'flutter_sdk_release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlutterSdkReleaseImpl _$$FlutterSdkReleaseImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$FlutterSdkReleaseImpl',
      json,
      ($checkedConvert) {
        final val = _$FlutterSdkReleaseImpl(
          channel: $checkedConvert(
              'channel', (v) => $enumDecode(_$FlutterChannelEnumMap, v)),
          version: $checkedConvert('version',
              (v) => const _VersionJsonConverter().fromJson(v as String)),
        );
        return val;
      },
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
