import 'package:fpdart/fpdart.dart';
import 'package:frago/core/screen_id.dart';
import 'package:frago/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simplegit/simplegit.dart';

part 'app_model.freezed.dart';

@freezed
abstract class AppModel with _$AppModel {
  const AppModel._();

  const factory AppModel({
    required List<PostDescr> loadedPosts,
    required Option<LoggedUser> loggedUser,
    required bool checkedLogin,
    required bool logged,
    required ScreenId currentScreen,
    required bool postSelectionMode,
    required PostSorting postSorting,
  }) = _AppModel;

  factory AppModel.initial() => AppModel(
    loadedPosts: [],
    checkedLogin: false,
    loggedUser: none(),
    logged: false,
    currentScreen: ScreenId.posts,
    postSelectionMode: false,
    postSorting: PostSorting.dateDescending,
  );
}
