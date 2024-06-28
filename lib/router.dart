import 'package:go_router/go_router.dart';
import 'package:twitter_auth_clone/features/auth/create_account_screen.dart';
import 'package:twitter_auth_clone/features/auth/login_screen.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/activity_screen.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/home_screen.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/main_navigation_screen.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/search_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: MainNavigationScreen.routeUrl,
      builder: (context, state) => const MainNavigationScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/createaccount",
      builder: (context, state) => const CreateAccountScreen(),
    ),
    GoRoute(
      path: SearchScreen.routeUrl,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: ActivityScreen.routeUrl,
      builder: (context, state) => const ActivityScreen(),
    ),
  ],
);
