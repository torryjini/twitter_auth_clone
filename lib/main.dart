import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_auth_clone/features/main_navigation/repos/dark_mode_config_repo.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkModeConfigRepo(preferences);

  runApp(
    ProviderScope(
      overrides: [
        darkModeConfigProvider.overrideWith(
          () => DarkModeConfigVm(repository),
        ),
      ],
      child: const TwitterAuth(),
    ),
  );
}

class TwitterAuth extends ConsumerWidget {
  const TwitterAuth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: "Twitter Auth",
      themeMode: ref.watch(darkModeConfigProvider).darkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: Typography.blackMountainView,
        appBarTheme: const AppBarTheme(
          foregroundColor: Color(0xff1D9BF0),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          scrolledUnderElevation: 0.0,
        ),
        primaryColor: const Color(0xff1D9BF0),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: Typography.whiteMountainView,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.grey.shade900,
        ),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xff1D9BF0),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
