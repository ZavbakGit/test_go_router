import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/coffe_item/cofee_item_page.dart';
import 'features/login/login_page.dart';
import 'features/page1/page1.dart';
import 'features/page2/page2.dart';

void main() {
  runApp(MyApp());
}

final loginInfo = LoginInfo();

class LoginInfo extends ChangeNotifier {
  var _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    redirect: (state) {
      final loggedIn = loginInfo._isLoggedIn;
      final isLogging = state.location == '/login';

      if (!loggedIn && !isLogging) return '/login';
      if (loggedIn && isLogging) return '/';

      return null;
    },
    refreshListenable: loginInfo,
    urlPathStrategy: UrlPathStrategy.path,
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
    routes: <GoRoute>[
      GoRoute(
        name: 'login',
        path: '/login',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: LoginPage(),
        ),
      ),
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const Page1(),
        ),
      ),
      GoRoute(
          name: 'menu',
          path: '/page2',
          builder: (BuildContext context, GoRouterState state) => Page2(),
          routes: [
            GoRoute(
              name: 'details',
              path: ':id', //menu/id
              pageBuilder: (context, state) {
                final id = int.parse(state.params['id']!);
                return MaterialPage(
                  key: state.pageKey,
                  child: CoffeItemPage(id: id),
                );
              },
            )
          ]),
    ],
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'GoRouter Example',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
      );
}
