import 'package:fpdart/fpdart.dart';
import 'package:frago/core/page_id.dart';
import 'package:frago/models/post.dart';
import 'package:frago/models/workspace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simplegit/simplegit.dart';

part 'app_model.freezed.dart';

@freezed
abstract class AppModel with _$AppModel {
  const AppModel._();

  const factory AppModel({
    required List<PostDesc> loadedPosts,
    required Option<LoggedUser> loggedUser,
    required bool checkedLogin,
    required bool logged,
    required bool online,
    required PageId currentPage,
    required bool postSelectionMode,
    required PostSorting postSorting,
    required Option<Workspace> currentWorkspace,
    required String createPostTitle,
  }) = _AppModel;

  factory AppModel.initial() => AppModel(
    loadedPosts: [],
    checkedLogin: false,
    loggedUser: none(),
    logged: false,
    online: true,
    currentPage: PageId.posts,
    postSelectionMode: false,
    postSorting: PostSorting.dateDescending,
    currentWorkspace: None(),
    createPostTitle: '',
  );
}
