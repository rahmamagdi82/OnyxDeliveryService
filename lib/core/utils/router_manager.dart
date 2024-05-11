import 'package:go_router/go_router.dart';
import 'package:ony_x_delivery_service/features/home/views/home_view.dart';

import '../../features/login/views/login_view.dart';
import '../../features/splash/views/splash_view.dart';


abstract class AppRouter {
  static const loginViewPath = '/loginView';
  static const homeViewPath = '/homeView';


  static final router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginViewPath,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: homeViewPath,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
