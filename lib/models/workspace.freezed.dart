// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Workspace {

 Option<String> get postsFolder; Option<String> get imagesFolder; bool get cloned;
/// Create a copy of Workspace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceCopyWith<Workspace> get copyWith => _$WorkspaceCopyWithImpl<Workspace>(this as Workspace, _$identity);

  /// Serializes this Workspace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Workspace&&(identical(other.postsFolder, postsFolder) || other.postsFolder == postsFolder)&&(identical(other.imagesFolder, imagesFolder) || other.imagesFolder == imagesFolder)&&(identical(other.cloned, cloned) || other.cloned == cloned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postsFolder,imagesFolder,cloned);

@override
String toString() {
  return 'Workspace(postsFolder: $postsFolder, imagesFolder: $imagesFolder, cloned: $cloned)';
}


}

/// @nodoc
abstract mixin class $WorkspaceCopyWith<$Res>  {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) _then) = _$WorkspaceCopyWithImpl;
@useResult
$Res call({
 Option<String> postsFolder, Option<String> imagesFolder, bool cloned
});




}
/// @nodoc
class _$WorkspaceCopyWithImpl<$Res>
    implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._self, this._then);

  final Workspace _self;
  final $Res Function(Workspace) _then;

/// Create a copy of Workspace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postsFolder = null,Object? imagesFolder = null,Object? cloned = null,}) {
  return _then(_self.copyWith(
postsFolder: null == postsFolder ? _self.postsFolder : postsFolder // ignore: cast_nullable_to_non_nullable
as Option<String>,imagesFolder: null == imagesFolder ? _self.imagesFolder : imagesFolder // ignore: cast_nullable_to_non_nullable
as Option<String>,cloned: null == cloned ? _self.cloned : cloned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Workspace].
extension WorkspacePatterns on Workspace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Workspace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Workspace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Workspace value)  $default,){
final _that = this;
switch (_that) {
case _Workspace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Workspace value)?  $default,){
final _that = this;
switch (_that) {
case _Workspace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Option<String> postsFolder,  Option<String> imagesFolder,  bool cloned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Workspace() when $default != null:
return $default(_that.postsFolder,_that.imagesFolder,_that.cloned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Option<String> postsFolder,  Option<String> imagesFolder,  bool cloned)  $default,) {final _that = this;
switch (_that) {
case _Workspace():
return $default(_that.postsFolder,_that.imagesFolder,_that.cloned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Option<String> postsFolder,  Option<String> imagesFolder,  bool cloned)?  $default,) {final _that = this;
switch (_that) {
case _Workspace() when $default != null:
return $default(_that.postsFolder,_that.imagesFolder,_that.cloned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Workspace extends Workspace {
  const _Workspace({required this.postsFolder, required this.imagesFolder, required this.cloned}): super._();
  factory _Workspace.fromJson(Map<String, dynamic> json) => _$WorkspaceFromJson(json);

@override final  Option<String> postsFolder;
@override final  Option<String> imagesFolder;
@override final  bool cloned;

/// Create a copy of Workspace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceCopyWith<_Workspace> get copyWith => __$WorkspaceCopyWithImpl<_Workspace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkspaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Workspace&&(identical(other.postsFolder, postsFolder) || other.postsFolder == postsFolder)&&(identical(other.imagesFolder, imagesFolder) || other.imagesFolder == imagesFolder)&&(identical(other.cloned, cloned) || other.cloned == cloned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postsFolder,imagesFolder,cloned);

@override
String toString() {
  return 'Workspace(postsFolder: $postsFolder, imagesFolder: $imagesFolder, cloned: $cloned)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceCopyWith<$Res> implements $WorkspaceCopyWith<$Res> {
  factory _$WorkspaceCopyWith(_Workspace value, $Res Function(_Workspace) _then) = __$WorkspaceCopyWithImpl;
@override @useResult
$Res call({
 Option<String> postsFolder, Option<String> imagesFolder, bool cloned
});




}
/// @nodoc
class __$WorkspaceCopyWithImpl<$Res>
    implements _$WorkspaceCopyWith<$Res> {
  __$WorkspaceCopyWithImpl(this._self, this._then);

  final _Workspace _self;
  final $Res Function(_Workspace) _then;

/// Create a copy of Workspace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postsFolder = null,Object? imagesFolder = null,Object? cloned = null,}) {
  return _then(_Workspace(
postsFolder: null == postsFolder ? _self.postsFolder : postsFolder // ignore: cast_nullable_to_non_nullable
as Option<String>,imagesFolder: null == imagesFolder ? _self.imagesFolder : imagesFolder // ignore: cast_nullable_to_non_nullable
as Option<String>,cloned: null == cloned ? _self.cloned : cloned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
