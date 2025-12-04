// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_token_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccessTokenInfo {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccessTokenInfo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccessTokenInfo()';
}


}

/// @nodoc
class $AccessTokenInfoCopyWith<$Res>  {
$AccessTokenInfoCopyWith(AccessTokenInfo _, $Res Function(AccessTokenInfo) __);
}


/// Adds pattern-matching-related methods to [AccessTokenInfo].
extension AccessTokenInfoPatterns on AccessTokenInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Token value)?  token,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Token() when token != null:
return token(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Token value)  token,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Token():
return token(_that);case Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Token value)?  token,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Token() when token != null:
return token(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String token)?  token,TResult Function( AccessTokenError err)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Token() when token != null:
return token(_that.token);case Error() when error != null:
return error(_that.err);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String token)  token,required TResult Function( AccessTokenError err)  error,}) {final _that = this;
switch (_that) {
case Token():
return token(_that.token);case Error():
return error(_that.err);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String token)?  token,TResult? Function( AccessTokenError err)?  error,}) {final _that = this;
switch (_that) {
case Token() when token != null:
return token(_that.token);case Error() when error != null:
return error(_that.err);case _:
  return null;

}
}

}

/// @nodoc


class Token implements AccessTokenInfo {
  const Token(this.token);
  

 final  String token;

/// Create a copy of AccessTokenInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenCopyWith<Token> get copyWith => _$TokenCopyWithImpl<Token>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Token&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'AccessTokenInfo.token(token: $token)';
}


}

/// @nodoc
abstract mixin class $TokenCopyWith<$Res> implements $AccessTokenInfoCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) _then) = _$TokenCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class _$TokenCopyWithImpl<$Res>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._self, this._then);

  final Token _self;
  final $Res Function(Token) _then;

/// Create a copy of AccessTokenInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(Token(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Error implements AccessTokenInfo {
  const Error(this.err);
  

 final  AccessTokenError err;

/// Create a copy of AccessTokenInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.err, err) || other.err == err));
}


@override
int get hashCode => Object.hash(runtimeType,err);

@override
String toString() {
  return 'AccessTokenInfo.error(err: $err)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $AccessTokenInfoCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 AccessTokenError err
});


$AccessTokenErrorCopyWith<$Res> get err;

}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of AccessTokenInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? err = null,}) {
  return _then(Error(
null == err ? _self.err : err // ignore: cast_nullable_to_non_nullable
as AccessTokenError,
  ));
}

/// Create a copy of AccessTokenInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccessTokenErrorCopyWith<$Res> get err {
  
  return $AccessTokenErrorCopyWith<$Res>(_self.err, (value) {
    return _then(_self.copyWith(err: value));
  });
}
}

/// @nodoc
mixin _$AccessTokenError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccessTokenError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccessTokenError()';
}


}

/// @nodoc
class $AccessTokenErrorCopyWith<$Res>  {
$AccessTokenErrorCopyWith(AccessTokenError _, $Res Function(AccessTokenError) __);
}


/// Adds pattern-matching-related methods to [AccessTokenError].
extension AccessTokenErrorPatterns on AccessTokenError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthPending value)?  authPending,TResult Function( SlowDown value)?  slowDown,TResult Function( ExpiredToken value)?  expired,TResult Function( InvalidError value)?  invalid,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthPending() when authPending != null:
return authPending(_that);case SlowDown() when slowDown != null:
return slowDown(_that);case ExpiredToken() when expired != null:
return expired(_that);case InvalidError() when invalid != null:
return invalid(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthPending value)  authPending,required TResult Function( SlowDown value)  slowDown,required TResult Function( ExpiredToken value)  expired,required TResult Function( InvalidError value)  invalid,}){
final _that = this;
switch (_that) {
case AuthPending():
return authPending(_that);case SlowDown():
return slowDown(_that);case ExpiredToken():
return expired(_that);case InvalidError():
return invalid(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthPending value)?  authPending,TResult? Function( SlowDown value)?  slowDown,TResult? Function( ExpiredToken value)?  expired,TResult? Function( InvalidError value)?  invalid,}){
final _that = this;
switch (_that) {
case AuthPending() when authPending != null:
return authPending(_that);case SlowDown() when slowDown != null:
return slowDown(_that);case ExpiredToken() when expired != null:
return expired(_that);case InvalidError() when invalid != null:
return invalid(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authPending,TResult Function( int interval)?  slowDown,TResult Function()?  expired,TResult Function( String err)?  invalid,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthPending() when authPending != null:
return authPending();case SlowDown() when slowDown != null:
return slowDown(_that.interval);case ExpiredToken() when expired != null:
return expired();case InvalidError() when invalid != null:
return invalid(_that.err);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authPending,required TResult Function( int interval)  slowDown,required TResult Function()  expired,required TResult Function( String err)  invalid,}) {final _that = this;
switch (_that) {
case AuthPending():
return authPending();case SlowDown():
return slowDown(_that.interval);case ExpiredToken():
return expired();case InvalidError():
return invalid(_that.err);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authPending,TResult? Function( int interval)?  slowDown,TResult? Function()?  expired,TResult? Function( String err)?  invalid,}) {final _that = this;
switch (_that) {
case AuthPending() when authPending != null:
return authPending();case SlowDown() when slowDown != null:
return slowDown(_that.interval);case ExpiredToken() when expired != null:
return expired();case InvalidError() when invalid != null:
return invalid(_that.err);case _:
  return null;

}
}

}

/// @nodoc


class AuthPending implements AccessTokenError {
  const AuthPending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccessTokenError.authPending()';
}


}




/// @nodoc


class SlowDown implements AccessTokenError {
  const SlowDown(this.interval);
  

 final  int interval;

/// Create a copy of AccessTokenError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlowDownCopyWith<SlowDown> get copyWith => _$SlowDownCopyWithImpl<SlowDown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlowDown&&(identical(other.interval, interval) || other.interval == interval));
}


@override
int get hashCode => Object.hash(runtimeType,interval);

@override
String toString() {
  return 'AccessTokenError.slowDown(interval: $interval)';
}


}

/// @nodoc
abstract mixin class $SlowDownCopyWith<$Res> implements $AccessTokenErrorCopyWith<$Res> {
  factory $SlowDownCopyWith(SlowDown value, $Res Function(SlowDown) _then) = _$SlowDownCopyWithImpl;
@useResult
$Res call({
 int interval
});




}
/// @nodoc
class _$SlowDownCopyWithImpl<$Res>
    implements $SlowDownCopyWith<$Res> {
  _$SlowDownCopyWithImpl(this._self, this._then);

  final SlowDown _self;
  final $Res Function(SlowDown) _then;

/// Create a copy of AccessTokenError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? interval = null,}) {
  return _then(SlowDown(
null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ExpiredToken implements AccessTokenError {
  const ExpiredToken();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpiredToken);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccessTokenError.expired()';
}


}




/// @nodoc


class InvalidError implements AccessTokenError {
  const InvalidError(this.err);
  

 final  String err;

/// Create a copy of AccessTokenError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidErrorCopyWith<InvalidError> get copyWith => _$InvalidErrorCopyWithImpl<InvalidError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidError&&(identical(other.err, err) || other.err == err));
}


@override
int get hashCode => Object.hash(runtimeType,err);

@override
String toString() {
  return 'AccessTokenError.invalid(err: $err)';
}


}

/// @nodoc
abstract mixin class $InvalidErrorCopyWith<$Res> implements $AccessTokenErrorCopyWith<$Res> {
  factory $InvalidErrorCopyWith(InvalidError value, $Res Function(InvalidError) _then) = _$InvalidErrorCopyWithImpl;
@useResult
$Res call({
 String err
});




}
/// @nodoc
class _$InvalidErrorCopyWithImpl<$Res>
    implements $InvalidErrorCopyWith<$Res> {
  _$InvalidErrorCopyWithImpl(this._self, this._then);

  final InvalidError _self;
  final $Res Function(InvalidError) _then;

/// Create a copy of AccessTokenError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? err = null,}) {
  return _then(InvalidError(
null == err ? _self.err : err // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
