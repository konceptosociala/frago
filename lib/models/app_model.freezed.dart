// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppModel {

 List<PostDescr> get loadedPosts; Option<LoggedUser> get loggedUser; bool get checkedLogin; bool get logged; bool get online; PageId get currentPage; bool get postSelectionMode; PostSorting get postSorting; Option<String> get currentWorkspace; List<String> get availableWorkspaces;
/// Create a copy of AppModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppModelCopyWith<AppModel> get copyWith => _$AppModelCopyWithImpl<AppModel>(this as AppModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppModel&&const DeepCollectionEquality().equals(other.loadedPosts, loadedPosts)&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.checkedLogin, checkedLogin) || other.checkedLogin == checkedLogin)&&(identical(other.logged, logged) || other.logged == logged)&&(identical(other.online, online) || other.online == online)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.postSelectionMode, postSelectionMode) || other.postSelectionMode == postSelectionMode)&&(identical(other.postSorting, postSorting) || other.postSorting == postSorting)&&(identical(other.currentWorkspace, currentWorkspace) || other.currentWorkspace == currentWorkspace)&&const DeepCollectionEquality().equals(other.availableWorkspaces, availableWorkspaces));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(loadedPosts),loggedUser,checkedLogin,logged,online,currentPage,postSelectionMode,postSorting,currentWorkspace,const DeepCollectionEquality().hash(availableWorkspaces));

@override
String toString() {
  return 'AppModel(loadedPosts: $loadedPosts, loggedUser: $loggedUser, checkedLogin: $checkedLogin, logged: $logged, online: $online, currentPage: $currentPage, postSelectionMode: $postSelectionMode, postSorting: $postSorting, currentWorkspace: $currentWorkspace, availableWorkspaces: $availableWorkspaces)';
}


}

/// @nodoc
abstract mixin class $AppModelCopyWith<$Res>  {
  factory $AppModelCopyWith(AppModel value, $Res Function(AppModel) _then) = _$AppModelCopyWithImpl;
@useResult
$Res call({
 List<PostDescr> loadedPosts, Option<LoggedUser> loggedUser, bool checkedLogin, bool logged, bool online, PageId currentPage, bool postSelectionMode, PostSorting postSorting, Option<String> currentWorkspace, List<String> availableWorkspaces
});




}
/// @nodoc
class _$AppModelCopyWithImpl<$Res>
    implements $AppModelCopyWith<$Res> {
  _$AppModelCopyWithImpl(this._self, this._then);

  final AppModel _self;
  final $Res Function(AppModel) _then;

/// Create a copy of AppModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadedPosts = null,Object? loggedUser = null,Object? checkedLogin = null,Object? logged = null,Object? online = null,Object? currentPage = null,Object? postSelectionMode = null,Object? postSorting = null,Object? currentWorkspace = null,Object? availableWorkspaces = null,}) {
  return _then(_self.copyWith(
loadedPosts: null == loadedPosts ? _self.loadedPosts : loadedPosts // ignore: cast_nullable_to_non_nullable
as List<PostDescr>,loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as Option<LoggedUser>,checkedLogin: null == checkedLogin ? _self.checkedLogin : checkedLogin // ignore: cast_nullable_to_non_nullable
as bool,logged: null == logged ? _self.logged : logged // ignore: cast_nullable_to_non_nullable
as bool,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as PageId,postSelectionMode: null == postSelectionMode ? _self.postSelectionMode : postSelectionMode // ignore: cast_nullable_to_non_nullable
as bool,postSorting: null == postSorting ? _self.postSorting : postSorting // ignore: cast_nullable_to_non_nullable
as PostSorting,currentWorkspace: null == currentWorkspace ? _self.currentWorkspace : currentWorkspace // ignore: cast_nullable_to_non_nullable
as Option<String>,availableWorkspaces: null == availableWorkspaces ? _self.availableWorkspaces : availableWorkspaces // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AppModel].
extension AppModelPatterns on AppModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppModel value)  $default,){
final _that = this;
switch (_that) {
case _AppModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PostDescr> loadedPosts,  Option<LoggedUser> loggedUser,  bool checkedLogin,  bool logged,  bool online,  PageId currentPage,  bool postSelectionMode,  PostSorting postSorting,  Option<String> currentWorkspace,  List<String> availableWorkspaces)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppModel() when $default != null:
return $default(_that.loadedPosts,_that.loggedUser,_that.checkedLogin,_that.logged,_that.online,_that.currentPage,_that.postSelectionMode,_that.postSorting,_that.currentWorkspace,_that.availableWorkspaces);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PostDescr> loadedPosts,  Option<LoggedUser> loggedUser,  bool checkedLogin,  bool logged,  bool online,  PageId currentPage,  bool postSelectionMode,  PostSorting postSorting,  Option<String> currentWorkspace,  List<String> availableWorkspaces)  $default,) {final _that = this;
switch (_that) {
case _AppModel():
return $default(_that.loadedPosts,_that.loggedUser,_that.checkedLogin,_that.logged,_that.online,_that.currentPage,_that.postSelectionMode,_that.postSorting,_that.currentWorkspace,_that.availableWorkspaces);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PostDescr> loadedPosts,  Option<LoggedUser> loggedUser,  bool checkedLogin,  bool logged,  bool online,  PageId currentPage,  bool postSelectionMode,  PostSorting postSorting,  Option<String> currentWorkspace,  List<String> availableWorkspaces)?  $default,) {final _that = this;
switch (_that) {
case _AppModel() when $default != null:
return $default(_that.loadedPosts,_that.loggedUser,_that.checkedLogin,_that.logged,_that.online,_that.currentPage,_that.postSelectionMode,_that.postSorting,_that.currentWorkspace,_that.availableWorkspaces);case _:
  return null;

}
}

}

/// @nodoc


class _AppModel extends AppModel {
  const _AppModel({required final  List<PostDescr> loadedPosts, required this.loggedUser, required this.checkedLogin, required this.logged, required this.online, required this.currentPage, required this.postSelectionMode, required this.postSorting, required this.currentWorkspace, required final  List<String> availableWorkspaces}): _loadedPosts = loadedPosts,_availableWorkspaces = availableWorkspaces,super._();
  

 final  List<PostDescr> _loadedPosts;
@override List<PostDescr> get loadedPosts {
  if (_loadedPosts is EqualUnmodifiableListView) return _loadedPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_loadedPosts);
}

@override final  Option<LoggedUser> loggedUser;
@override final  bool checkedLogin;
@override final  bool logged;
@override final  bool online;
@override final  PageId currentPage;
@override final  bool postSelectionMode;
@override final  PostSorting postSorting;
@override final  Option<String> currentWorkspace;
 final  List<String> _availableWorkspaces;
@override List<String> get availableWorkspaces {
  if (_availableWorkspaces is EqualUnmodifiableListView) return _availableWorkspaces;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableWorkspaces);
}


/// Create a copy of AppModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppModelCopyWith<_AppModel> get copyWith => __$AppModelCopyWithImpl<_AppModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppModel&&const DeepCollectionEquality().equals(other._loadedPosts, _loadedPosts)&&(identical(other.loggedUser, loggedUser) || other.loggedUser == loggedUser)&&(identical(other.checkedLogin, checkedLogin) || other.checkedLogin == checkedLogin)&&(identical(other.logged, logged) || other.logged == logged)&&(identical(other.online, online) || other.online == online)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.postSelectionMode, postSelectionMode) || other.postSelectionMode == postSelectionMode)&&(identical(other.postSorting, postSorting) || other.postSorting == postSorting)&&(identical(other.currentWorkspace, currentWorkspace) || other.currentWorkspace == currentWorkspace)&&const DeepCollectionEquality().equals(other._availableWorkspaces, _availableWorkspaces));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_loadedPosts),loggedUser,checkedLogin,logged,online,currentPage,postSelectionMode,postSorting,currentWorkspace,const DeepCollectionEquality().hash(_availableWorkspaces));

@override
String toString() {
  return 'AppModel(loadedPosts: $loadedPosts, loggedUser: $loggedUser, checkedLogin: $checkedLogin, logged: $logged, online: $online, currentPage: $currentPage, postSelectionMode: $postSelectionMode, postSorting: $postSorting, currentWorkspace: $currentWorkspace, availableWorkspaces: $availableWorkspaces)';
}


}

/// @nodoc
abstract mixin class _$AppModelCopyWith<$Res> implements $AppModelCopyWith<$Res> {
  factory _$AppModelCopyWith(_AppModel value, $Res Function(_AppModel) _then) = __$AppModelCopyWithImpl;
@override @useResult
$Res call({
 List<PostDescr> loadedPosts, Option<LoggedUser> loggedUser, bool checkedLogin, bool logged, bool online, PageId currentPage, bool postSelectionMode, PostSorting postSorting, Option<String> currentWorkspace, List<String> availableWorkspaces
});




}
/// @nodoc
class __$AppModelCopyWithImpl<$Res>
    implements _$AppModelCopyWith<$Res> {
  __$AppModelCopyWithImpl(this._self, this._then);

  final _AppModel _self;
  final $Res Function(_AppModel) _then;

/// Create a copy of AppModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadedPosts = null,Object? loggedUser = null,Object? checkedLogin = null,Object? logged = null,Object? online = null,Object? currentPage = null,Object? postSelectionMode = null,Object? postSorting = null,Object? currentWorkspace = null,Object? availableWorkspaces = null,}) {
  return _then(_AppModel(
loadedPosts: null == loadedPosts ? _self._loadedPosts : loadedPosts // ignore: cast_nullable_to_non_nullable
as List<PostDescr>,loggedUser: null == loggedUser ? _self.loggedUser : loggedUser // ignore: cast_nullable_to_non_nullable
as Option<LoggedUser>,checkedLogin: null == checkedLogin ? _self.checkedLogin : checkedLogin // ignore: cast_nullable_to_non_nullable
as bool,logged: null == logged ? _self.logged : logged // ignore: cast_nullable_to_non_nullable
as bool,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as PageId,postSelectionMode: null == postSelectionMode ? _self.postSelectionMode : postSelectionMode // ignore: cast_nullable_to_non_nullable
as bool,postSorting: null == postSorting ? _self.postSorting : postSorting // ignore: cast_nullable_to_non_nullable
as PostSorting,currentWorkspace: null == currentWorkspace ? _self.currentWorkspace : currentWorkspace // ignore: cast_nullable_to_non_nullable
as Option<String>,availableWorkspaces: null == availableWorkspaces ? _self._availableWorkspaces : availableWorkspaces // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
