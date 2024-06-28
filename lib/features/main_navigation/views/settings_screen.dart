import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ref.watch(darkModeConfigProvider).darkMode
            ? Colors.white
            : Colors.black,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: ref.watch(darkModeConfigProvider).darkMode,
            onChanged: (value) =>
                ref.read(darkModeConfigProvider.notifier).setDarkMode(value),
            title: const Text("Dark mode"),
            subtitle: const Text("App will be dark mode by default."),
          ),
        ],
      ),
    );
  }
}
