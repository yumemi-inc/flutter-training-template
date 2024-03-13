// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flutter_sdk_release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlutterSdkRelease _$FlutterSdkReleaseFromJson(Map<String, dynamic> json) {
  return _FlutterSdkRelease.fromJson(json);
}

/// @nodoc
mixin _$FlutterSdkRelease {
  FlutterChannel get channel => throw _privateConstructorUsedError;
  @_VersionJsonConverter()
  Version get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlutterSdkReleaseCopyWith<FlutterSdkRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlutterSdkReleaseCopyWith<$Res> {
  factory $FlutterSdkReleaseCopyWith(
          FlutterSdkRelease value, $Res Function(FlutterSdkRelease) then) =
      _$FlutterSdkReleaseCopyWithImpl<$Res, FlutterSdkRelease>;
  @useResult
  $Res call({FlutterChannel channel, @_VersionJsonConverter() Version version});
}

/// @nodoc
class _$FlutterSdkReleaseCopyWithImpl<$Res, $Val extends FlutterSdkRelease>
    implements $FlutterSdkReleaseCopyWith<$Res> {
  _$FlutterSdkReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FlutterChannel,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlutterSdkReleaseImplCopyWith<$Res>
    implements $FlutterSdkReleaseCopyWith<$Res> {
  factory _$$FlutterSdkReleaseImplCopyWith(_$FlutterSdkReleaseImpl value,
          $Res Function(_$FlutterSdkReleaseImpl) then) =
      __$$FlutterSdkReleaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FlutterChannel channel, @_VersionJsonConverter() Version version});
}

/// @nodoc
class __$$FlutterSdkReleaseImplCopyWithImpl<$Res>
    extends _$FlutterSdkReleaseCopyWithImpl<$Res, _$FlutterSdkReleaseImpl>
    implements _$$FlutterSdkReleaseImplCopyWith<$Res> {
  __$$FlutterSdkReleaseImplCopyWithImpl(_$FlutterSdkReleaseImpl _value,
      $Res Function(_$FlutterSdkReleaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? version = null,
  }) {
    return _then(_$FlutterSdkReleaseImpl(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as FlutterChannel,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as Version,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlutterSdkReleaseImpl implements _FlutterSdkRelease {
  _$FlutterSdkReleaseImpl(
      {required this.channel, @_VersionJsonConverter() required this.version});

  factory _$FlutterSdkReleaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlutterSdkReleaseImplFromJson(json);

  @override
  final FlutterChannel channel;
  @override
  @_VersionJsonConverter()
  final Version version;

  @override
  String toString() {
    return 'FlutterSdkRelease(channel: $channel, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlutterSdkReleaseImpl &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, channel, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlutterSdkReleaseImplCopyWith<_$FlutterSdkReleaseImpl> get copyWith =>
      __$$FlutterSdkReleaseImplCopyWithImpl<_$FlutterSdkReleaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlutterSdkReleaseImplToJson(
      this,
    );
  }
}

abstract class _FlutterSdkRelease implements FlutterSdkRelease {
  factory _FlutterSdkRelease(
          {required final FlutterChannel channel,
          @_VersionJsonConverter() required final Version version}) =
      _$FlutterSdkReleaseImpl;

  factory _FlutterSdkRelease.fromJson(Map<String, dynamic> json) =
      _$FlutterSdkReleaseImpl.fromJson;

  @override
  FlutterChannel get channel;
  @override
  @_VersionJsonConverter()
  Version get version;
  @override
  @JsonKey(ignore: true)
  _$$FlutterSdkReleaseImplCopyWith<_$FlutterSdkReleaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
