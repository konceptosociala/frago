import 'package:flutter/material.dart';
import 'package:frago/core/event.dart';
import 'package:frago/core/mvu.dart';
import 'package:frago/core/theme_data.dart';
import 'package:frago/core/utils.dart';
import 'package:frago/models/app_model.dart';
import 'package:frago/widgets/general/gaps.dart';
import 'package:frago/widgets/homepage.dart';
import 'package:frago/widgets/login/misc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simplegit/simplegit.dart';
import 'package:window_size/window_size.dart';
import 'package:fpdart/fpdart.dart' 
  show 
    Left, None, Option, Right, Some, TaskEither, Task;

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

Task<AppModel> update(AppModel model, Msg msg) {
  return switch (msg) {
    LoadWorkspace() => Task.Do(
      ($) async {
        final prefs = await SharedPreferences.getInstance();
        final workSpace = prefs.getString('frago_current_workspace');

        return model.copyWith(
          currentWorkspace: Option.fromNullable(workSpace),
        );
      }
    ),

    LoginSuccess(:final user, :final online) => Task.Do(
      ($) async {
        final AppModel newModel;
        if (online) {
          newModel = await $(update(model, FetchUserData(user)));
        } else {
          newModel = model;
        }

        return newModel.copyWith(
          loggedUser: Some(user),
          logged: true,
          checkedLogin: true,
          online: online,
        );
      }
    ),

    FetchUserData(:final user) => Task.of(model),

    LoginFailure() => Task.Do(
      ($) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('frago_logged_user');

        return model.copyWith(
          logged: false, 
          checkedLogin: true,
        );
      }
    ),

    Logout() => Task.Do(
      ($) async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('frago_logged_user');

        return model.copyWith(loggedUser: None(), logged: false);
      }
    ),

    ChangePage(:final page) => Task.of(model.copyWith(currentPage: page)),

    LoadPosts(:final posts) => Task.of(model.copyWith(loadedPosts: posts)),

    TogglePostSelection(:final index) => Task.of(model.copyWith(
      loadedPosts: List.of(model.loadedPosts)
        ..[index] = model.loadedPosts[index].copyWith(
          selected: !model.loadedPosts[index].selected,
        ),
    )),

    EnterSelectionMode(:final initialIndex) => Task.of(model.copyWith(
      postSelectionMode: true,
      loadedPosts: List.of(model.loadedPosts)
        ..[initialIndex] = model.loadedPosts[initialIndex].copyWith(
          selected: true,
        ),
    )),

    ExitSelectionMode() => Task.of(model.copyWith(
      postSelectionMode: false,
      loadedPosts:
          model.loadedPosts.map((p) => p.copyWith(selected: false)).toList(),
    )),

    SelectAllPosts() => Task.of(model.copyWith(
      loadedPosts:
        model.loadedPosts.any((p) => !p.selected)
          ? model.loadedPosts
            .map((p) => p.copyWith(selected: true))
            .toList()
          : model.loadedPosts
            .map((p) => p.copyWith(selected: false))
            .toList(),
    )),

    DeleteSelectedPosts() => Task.of(model.copyWith(
      loadedPosts: model.loadedPosts.where((p) => !p.selected).toList(),
      postSelectionMode: false,
    )),

    ChangeSorting(:final sorting) => Task.of(model.copyWith(
      postSorting: sorting,
    )),

    CheckLoginStatus() => Task.Do(
      ($) async {
        final prefs = await SharedPreferences.getInstance();
        final userJson = prefs.getString('frago_logged_user');

        if (userJson == null) {
          return await $(update(model, LoginFailure()));
        }

        final user = LoggedUser.fromJson(userJson);
        final result = await verifyToken(user.token).run();

        return switch (result) {
          Right() => await $(update(model, LoginSuccess(user, true))),

          Left(value: LoginError(
            kind: LoginErrorKind.cannotResolve,
          )) => await $(update(model, LoginSuccess(user, false))),
              
          _ => await $(update(model, (LoginFailure()))),
        };
      }
    ),
  };
}

Widget view(AppModel model, void Function(Msg) dispatch) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Frago',
    theme: darkTheme(),
    home: Builder(builder: (context) {
      if (!model.checkedLogin) {
        dispatch(CheckLoginStatus());

        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      dispatch(LoadWorkspace());

      if (!model.logged) {
        return LoginPage(
          onLogin: Some((user) => dispatch(LoginSuccess(user, true))),
        );
      }

      return HomePage(
        model: model,
        onPageChange: (page) => dispatch(ChangePage(page)),
        onLogout: () => dispatch(Logout()),
        onTogglePostSelection: (i) => dispatch(TogglePostSelection(i)),
        onEnterSelectionMode: (i) => dispatch(EnterSelectionMode(i)),
        onExitSelectionMode: () => dispatch(ExitSelectionMode()),
        onSelectAllPosts: () => dispatch(SelectAllPosts()),
        onDeleteSelectedPosts: () => dispatch(DeleteSelectedPosts()),
        onChangeSorting: (sorting) => dispatch(ChangeSorting(sorting)),
      );
    }),
  );
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
