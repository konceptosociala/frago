import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frago/core/screen_id.dart';
import 'package:frago/models/post.dart';
import 'package:simplegit/simplegit.dart';

part 'event.freezed.dart';

@freezed
sealed class Msg with _$Msg {
  const factory Msg.checkLoginStatus()                   = CheckLoginStatus;
  const factory Msg.loginSuccess(LoggedUser user)        = LoginSuccess;
  const factory Msg.loginFailure()                       = LoginFailure;
  const factory Msg.logout()                             = Logout;
  const factory Msg.changeScreen(ScreenId screen)        = ChangeScreen;
  const factory Msg.loadPosts(List<PostDescr> posts)     = LoadPosts;
  const factory Msg.togglePostSelection(int index)       = TogglePostSelection;
  const factory Msg.enterSelectionMode(int initialIndex) = EnterSelectionMode;
  const factory Msg.exitSelectionMode()                  = ExitSelectionMode;
  const factory Msg.selectAllPosts()                     = SelectAllPosts;
  const factory Msg.deleteSelectedPosts()                = DeleteSelectedPosts;
  const factory Msg.changeSorting(PostSorting sorting)   = ChangeSorting;
}
