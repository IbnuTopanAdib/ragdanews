import 'package:go_router/go_router.dart';
import 'package:ragdanews/router/router_names.dart';
import 'package:ragdanews/screens/login/login_screen.dart';
import 'package:ragdanews/screens/splash/splash_screen.dart';

class AppRouter {
  static final AppRouter shared = AppRouter._internal();

  factory AppRouter() => shared;

  AppRouter._internal();

  final router = GoRouter(
    initialLocation: RouterName.splashScreen,
    routes: [
      GoRoute(
        path: RouterName.splashScreen,
        name: RouterName.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouterName.loginScreen,
        name: RouterName.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      // GoRoute(
      //   path: RouterName.mainScreen,
      //   name: RouterName.mainScreen,
      //   builder: (context, state) => const MainScreen(),
      //   routes: [
      //     GoRoute(
      //       path: RouterName.detailScreen,
      //       name: RouterName.detailScreen,
      //       builder: (context, state) {
      //         final id = state.pathParameters['id']!;
      //         return DetailScreen(id: id);
      //       },
      //     ),
      //   ],
      // ),
    ],
  );
}
