import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: context.watch<DarkModeConfigVm>().darkMode
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
            value: context.watch<DarkModeConfigVm>().darkMode,
            onChanged: (value) =>
                context.read<DarkModeConfigVm>().setDarkMode(value),
            title: const Text("Dark mode"),
            subtitle: const Text("App will be dark mode by default."),
          ),
        ],
      ),
    );
  }
}
