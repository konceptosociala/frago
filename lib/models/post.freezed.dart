// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostDesc {

 String get title; String get description; bool get selected;
/// Create a copy of PostDesc
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDescCopyWith<PostDesc> get copyWith => _$PostDescCopyWithImpl<PostDesc>(this as PostDesc, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDesc&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.selected, selected) || other.selected == selected));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,selected);

@override
String toString() {
  return 'PostDesc(title: $title, description: $description, selected: $selected)';
}


}

/// @nodoc
abstract mixin class $PostDescCopyWith<$Res>  {
  factory $PostDescCopyWith(PostDesc value, $Res Function(PostDesc) _then) = _$PostDescCopyWithImpl;
@useResult
$Res call({
 String title, String description, bool selected
});




}
/// @nodoc
class _$PostDescCopyWithImpl<$Res>
    implements $PostDescCopyWith<$Res> {
  _$PostDescCopyWithImpl(this._self, this._then);

  final PostDesc _self;
  final $Res Function(PostDesc) _then;

/// Create a copy of PostDesc
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? selected = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostDesc].
extension PostDescPatterns on PostDesc {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostDesc value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDesc() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostDesc value)  $default,){
final _that = this;
switch (_that) {
case _PostDesc():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostDesc value)?  $default,){
final _that = this;
switch (_that) {
case _PostDesc() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  bool selected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostDesc() when $default != null:
return $default(_that.title,_that.description,_that.selected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  bool selected)  $default,) {final _that = this;
switch (_that) {
case _PostDesc():
return $default(_that.title,_that.description,_that.selected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  bool selected)?  $default,) {final _that = this;
switch (_that) {
case _PostDesc() when $default != null:
return $default(_that.title,_that.description,_that.selected);case _:
  return null;

}
}

}

/// @nodoc


class _PostDesc extends PostDesc {
  const _PostDesc({required this.title, required this.description, this.selected = false}): super._();
  

@override final  String title;
@override final  String description;
@override@JsonKey() final  bool selected;

/// Create a copy of PostDesc
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDescCopyWith<_PostDesc> get copyWith => __$PostDescCopyWithImpl<_PostDesc>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDesc&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.selected, selected) || other.selected == selected));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,selected);

@override
String toString() {
  return 'PostDesc(title: $title, description: $description, selected: $selected)';
}


}

/// @nodoc
abstract mixin class _$PostDescCopyWith<$Res> implements $PostDescCopyWith<$Res> {
  factory _$PostDescCopyWith(_PostDesc value, $Res Function(_PostDesc) _then) = __$PostDescCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, bool selected
});




}
/// @nodoc
class __$PostDescCopyWithImpl<$Res>
    implements _$PostDescCopyWith<$Res> {
  __$PostDescCopyWithImpl(this._self, this._then);

  final _PostDesc _self;
  final $Res Function(_PostDesc) _then;

/// Create a copy of PostDesc
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? selected = null,}) {
  return _then(_PostDesc(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
