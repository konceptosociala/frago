import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show Left, None, Right, Some, TaskEither;
import 'package:frago/core/event.dart';
import 'package:frago/core/mvu.dart';
import 'package:frago/core/theme_data.dart';
import 'package:frago/core/utils.dart';
import 'package:frago/models/app_model.dart';
import 'package:frago/models/post.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:frago/widgets/homepage.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplegit/simplegit.dart';
import 'package:window_size/window_size.dart';

void main() {
  Git.init();
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktop()) {
    setWindowTitle('Frago Debug');
    setWindowMinSize(debugPhoneSize);
    setWindowMaxSize(debugPhoneSize);
  }

  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) => MVU<AppModel, Msg>(
    initialModel: AppModel.initial(),
    update: update,
    view: view,
  );
}

AppModel update(AppModel model, Msg msg) {
  return switch (msg) {
    LoginSuccess(:final user) => model.copyWith(
      loggedUser: Some(user),
      logged: true,
      checkedLogin: true,
    ),

    LoginFailure() => model.copyWith(logged: false, checkedLogin: true),

    Logout() => model.copyWith(loggedUser: None(), logged: false),

    ChangeScreen(:final screen) => model.copyWith(currentScreen: screen),

    LoadPosts(:final posts) => model.copyWith(loadedPosts: posts),

    TogglePostSelection(:final index) => model.copyWith(
      loadedPosts: List.of(model.loadedPosts)
        ..[index] = model.loadedPosts[index].copyWith(
          selected: !model.loadedPosts[index].selected,
        ),
    ),

    EnterSelectionMode(:final initialIndex) => model.copyWith(
      postSelectionMode: true,
      loadedPosts: List.of(model.loadedPosts)
        ..[initialIndex] = model.loadedPosts[initialIndex].copyWith(
          selected: true,
        ),
    ),

    ExitSelectionMode() => model.copyWith(
      postSelectionMode: false,
      loadedPosts:
          model.loadedPosts.map((p) => p.copyWith(selected: false)).toList(),
    ),

    SelectAllPosts() => model.copyWith(
      loadedPosts:
        model.loadedPosts.any((p) => !p.selected)
          ? model.loadedPosts
            .map((p) => p.copyWith(selected: true))
            .toList()
          : model.loadedPosts
            .map((p) => p.copyWith(selected: false))
            .toList(),
    ),

    DeleteSelectedPosts() => model.copyWith(
      loadedPosts: model.loadedPosts.where((p) => !p.selected).toList(),
      postSelectionMode: false,
    ),

    ChangeSorting(:final sorting) => model.copyWith(postSorting: sorting),

    CheckLoginStatus() => model,
  };
}

Widget view(AppModel model, void Function(Msg) dispatch) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Frago',
    theme: darkTheme(),
    home: Builder(
      builder: (context) {
        if (!model.checkedLogin) {
          postFrame(() => _checkLoginStatus(dispatch));

          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!model.logged) {
          return LoginPage(
            onLogin: Some((user) => dispatch(LoginSuccess(user))),
          );
        }

        if (model.loadedPosts.isEmpty) {
          postFrame(() => _loadPosts(dispatch));
        }

        return HomePage(
          user: model.loggedUser.toNullable()!,
          currentScreen: model.currentScreen,
          posts: model.loadedPosts,
          postSelectionMode: model.postSelectionMode,
          postSorting: model.postSorting,
          onScreenChange: (screen) => dispatch(ChangeScreen(screen)),
          onLogout: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.remove('frago_logged_user');
            dispatch(Logout());
          },
          onTogglePostSelection: (i) => dispatch(TogglePostSelection(i)),
          onEnterSelectionMode: (i) => dispatch(EnterSelectionMode(i)),
          onExitSelectionMode: () => dispatch(ExitSelectionMode()),
          onSelectAllPosts: () => dispatch(SelectAllPosts()),
          onDeleteSelectedPosts: () => dispatch(DeleteSelectedPosts()),
          onChangeSorting: (sorting) => dispatch(ChangeSorting(sorting)),
        );
      },
    ),
  );
}

void _loadPosts(void Function(Msg) dispatch) async {
  // TODO: retrieve posts from repository
  final tempPosts = [
    PostDescr(
      title: 'Making a Static Blog in Elm: Why and How?',
      description:
          'Warning: this post is more like a cheat sheet than a full tutorial, so you should acquaint yourself with some basics of functional programming, or at least read the official Elm guide first.',
    ),
    PostDescr(
      title: 'Loading 3D texture in Bevy',
      description:
          'To load an image into our app Bevy provides us with a custom Image type. However, AssetServer in Bevy (as of version 0.15) only supports 2D image loading for now, so we need to perhaps implement a custom 3D image asset loader. For our tutorial we will use png and jpeg raster image types, but you can also try to implement importing of raw MagicaVoxel data, e.g. using dot_vox crate.',
    ),
    PostDescr(
      title: 'Anguloj inter vektoroj',
      description:
          'La punkto en la supro de la unuopa vektoro, komencanta de la origino, kiu havas angulon φ al la X-akso, estas:',
    ),
    PostDescr(
      title: 'Anguloj inter vektoroj',
      description:
          'La punkto en la supro de la unuopa vektoro, komencanta de la origino, kiu havas angulon φ al la X-akso, estas:',
    ),
  ];

  dispatch(LoadPosts(tempPosts));
}

void _checkLoginStatus(void Function(Msg) dispatch) async {
  final prefs = await SharedPreferences.getInstance();
  final userJson = prefs.getString('frago_logged_user');

  if (userJson == null) {
    dispatch(LoginFailure());
    return;
  }

  final user = LoggedUser.fromJson(userJson);

  final result = await verifyToken(user.token).run();
  switch (result) {
    case Right():
      dispatch(LoginSuccess(user));
      break;

    case Left(value: final error):
      if (error.kind == LoginErrorKind.cannotResolve) {
        dispatch(LoginSuccess(user));
      } else {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('frago_logged_user');
        dispatch(LoginFailure());
      }
      break;
  }
}

TaskEither<LoginError, void> verifyToken(String token) => TaskEither.Do(
  ($) async {
    final response = await $(
      TaskEither.tryCatch(
        () async => await http.get(
          Uri.parse('https://api.github.com/user'),
          headers: {
            'Authorization': 'token $token',
            'Accept': 'application/vnd.github.v3+json',
          },
        ),
        (_, __) => LoginError(kind: LoginErrorKind.cannotResolve),
      ),
    );

    return switch (response.statusCode) {
      200 => ok(),

      401 => $(TaskEither.left(LoginError(kind: LoginErrorKind.expiredToken))),

      _ => $(
        TaskEither.left(
          LoginError(
            kind: LoginErrorKind.githubError,
            message: 'Status code: ${response.statusCode}',
          ),
        ),
      ),
    };
  }
);

class NoInternetPage extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetPage(this.onRetry, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginHeading(label: 'No internet connection'),

            GapV(16),

            LoginButton(onPressed: onRetry, label: 'Retry'),
          ],
        ),
      ),
    );
  }
}
