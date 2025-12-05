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
mixin _$PostDescr {

 String get title; String get description; bool get selected;
/// Create a copy of PostDescr
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDescrCopyWith<PostDescr> get copyWith => _$PostDescrCopyWithImpl<PostDescr>(this as PostDescr, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDescr&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.selected, selected) || other.selected == selected));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,selected);

@override
String toString() {
  return 'PostDescr(title: $title, description: $description, selected: $selected)';
}


}

/// @nodoc
abstract mixin class $PostDescrCopyWith<$Res>  {
  factory $PostDescrCopyWith(PostDescr value, $Res Function(PostDescr) _then) = _$PostDescrCopyWithImpl;
@useResult
$Res call({
 String title, String description, bool selected
});




}
/// @nodoc
class _$PostDescrCopyWithImpl<$Res>
    implements $PostDescrCopyWith<$Res> {
  _$PostDescrCopyWithImpl(this._self, this._then);

  final PostDescr _self;
  final $Res Function(PostDescr) _then;

/// Create a copy of PostDescr
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


/// Adds pattern-matching-related methods to [PostDescr].
extension PostDescrPatterns on PostDescr {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostDescr value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDescr() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostDescr value)  $default,){
final _that = this;
switch (_that) {
case _PostDescr():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostDescr value)?  $default,){
final _that = this;
switch (_that) {
case _PostDescr() when $default != null:
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
case _PostDescr() when $default != null:
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
case _PostDescr():
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
case _PostDescr() when $default != null:
return $default(_that.title,_that.description,_that.selected);case _:
  return null;

}
}

}

/// @nodoc


class _PostDescr extends PostDescr {
  const _PostDescr({required this.title, required this.description, this.selected = false}): super._();
  

@override final  String title;
@override final  String description;
@override@JsonKey() final  bool selected;

/// Create a copy of PostDescr
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDescrCopyWith<_PostDescr> get copyWith => __$PostDescrCopyWithImpl<_PostDescr>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDescr&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.selected, selected) || other.selected == selected));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,selected);

@override
String toString() {
  return 'PostDescr(title: $title, description: $description, selected: $selected)';
}


}

/// @nodoc
abstract mixin class _$PostDescrCopyWith<$Res> implements $PostDescrCopyWith<$Res> {
  factory _$PostDescrCopyWith(_PostDescr value, $Res Function(_PostDescr) _then) = __$PostDescrCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, bool selected
});




}
/// @nodoc
class __$PostDescrCopyWithImpl<$Res>
    implements _$PostDescrCopyWith<$Res> {
  __$PostDescrCopyWithImpl(this._self, this._then);

  final _PostDescr _self;
  final $Res Function(_PostDescr) _then;

/// Create a copy of PostDescr
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? selected = null,}) {
  return _then(_PostDescr(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
