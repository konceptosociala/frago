// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationInfo {

 String get deviceCode; String get userCode; String get verificationUri;
/// Create a copy of VerificationInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationInfoCopyWith<VerificationInfo> get copyWith => _$VerificationInfoCopyWithImpl<VerificationInfo>(this as VerificationInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationInfo&&(identical(other.deviceCode, deviceCode) || other.deviceCode == deviceCode)&&(identical(other.userCode, userCode) || other.userCode == userCode)&&(identical(other.verificationUri, verificationUri) || other.verificationUri == verificationUri));
}


@override
int get hashCode => Object.hash(runtimeType,deviceCode,userCode,verificationUri);

@override
String toString() {
  return 'VerificationInfo(deviceCode: $deviceCode, userCode: $userCode, verificationUri: $verificationUri)';
}


}

/// @nodoc
abstract mixin class $VerificationInfoCopyWith<$Res>  {
  factory $VerificationInfoCopyWith(VerificationInfo value, $Res Function(VerificationInfo) _then) = _$VerificationInfoCopyWithImpl;
@useResult
$Res call({
 String deviceCode, String userCode, String verificationUri
});




}
/// @nodoc
class _$VerificationInfoCopyWithImpl<$Res>
    implements $VerificationInfoCopyWith<$Res> {
  _$VerificationInfoCopyWithImpl(this._self, this._then);

  final VerificationInfo _self;
  final $Res Function(VerificationInfo) _then;

/// Create a copy of VerificationInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceCode = null,Object? userCode = null,Object? verificationUri = null,}) {
  return _then(_self.copyWith(
deviceCode: null == deviceCode ? _self.deviceCode : deviceCode // ignore: cast_nullable_to_non_nullable
as String,userCode: null == userCode ? _self.userCode : userCode // ignore: cast_nullable_to_non_nullable
as String,verificationUri: null == verificationUri ? _self.verificationUri : verificationUri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerificationInfo].
extension VerificationInfoPatterns on VerificationInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VertificationInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VertificationInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VertificationInfo value)  $default,){
final _that = this;
switch (_that) {
case _VertificationInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VertificationInfo value)?  $default,){
final _that = this;
switch (_that) {
case _VertificationInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceCode,  String userCode,  String verificationUri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VertificationInfo() when $default != null:
return $default(_that.deviceCode,_that.userCode,_that.verificationUri);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceCode,  String userCode,  String verificationUri)  $default,) {final _that = this;
switch (_that) {
case _VertificationInfo():
return $default(_that.deviceCode,_that.userCode,_that.verificationUri);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceCode,  String userCode,  String verificationUri)?  $default,) {final _that = this;
switch (_that) {
case _VertificationInfo() when $default != null:
return $default(_that.deviceCode,_that.userCode,_that.verificationUri);case _:
  return null;

}
}

}

/// @nodoc


class _VertificationInfo extends VerificationInfo {
  const _VertificationInfo({required this.deviceCode, required this.userCode, required this.verificationUri}): super._();
  

@override final  String deviceCode;
@override final  String userCode;
@override final  String verificationUri;

/// Create a copy of VerificationInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VertificationInfoCopyWith<_VertificationInfo> get copyWith => __$VertificationInfoCopyWithImpl<_VertificationInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VertificationInfo&&(identical(other.deviceCode, deviceCode) || other.deviceCode == deviceCode)&&(identical(other.userCode, userCode) || other.userCode == userCode)&&(identical(other.verificationUri, verificationUri) || other.verificationUri == verificationUri));
}


@override
int get hashCode => Object.hash(runtimeType,deviceCode,userCode,verificationUri);

@override
String toString() {
  return 'VerificationInfo(deviceCode: $deviceCode, userCode: $userCode, verificationUri: $verificationUri)';
}


}

/// @nodoc
abstract mixin class _$VertificationInfoCopyWith<$Res> implements $VerificationInfoCopyWith<$Res> {
  factory _$VertificationInfoCopyWith(_VertificationInfo value, $Res Function(_VertificationInfo) _then) = __$VertificationInfoCopyWithImpl;
@override @useResult
$Res call({
 String deviceCode, String userCode, String verificationUri
});




}
/// @nodoc
class __$VertificationInfoCopyWithImpl<$Res>
    implements _$VertificationInfoCopyWith<$Res> {
  __$VertificationInfoCopyWithImpl(this._self, this._then);

  final _VertificationInfo _self;
  final $Res Function(_VertificationInfo) _then;

/// Create a copy of VerificationInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceCode = null,Object? userCode = null,Object? verificationUri = null,}) {
  return _then(_VertificationInfo(
deviceCode: null == deviceCode ? _self.deviceCode : deviceCode // ignore: cast_nullable_to_non_nullable
as String,userCode: null == userCode ? _self.userCode : userCode // ignore: cast_nullable_to_non_nullable
as String,verificationUri: null == verificationUri ? _self.verificationUri : verificationUri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
