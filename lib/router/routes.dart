import 'package:go_router/go_router.dart';
import 'package:neonadeuli_front_flutter/pages/login/login_page.dart';
import 'package:neonadeuli_front_flutter/pages/main/main_page.dart';

class Routes {
  static final GoRouter routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
        routes: <RouteBase>[
          GoRoute(
            path: 'main',
            builder: (context, state) => const MainPage(),
          ),
        ],
      ),
    ],
  );
}
