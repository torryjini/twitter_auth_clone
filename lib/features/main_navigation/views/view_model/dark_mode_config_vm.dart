import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_auth_clone/features/main_navigation/repos/dark_mode_config_repo.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/models/dark_mode_config.dart';

class DarkModeConfigVm extends Notifier<DarkModeConfig> {
  final DarkModeConfigRepo _repo;

  DarkModeConfigVm(this._repo);

  void setDarkMode(bool value) {
    _repo.setDarkMode(value);
    state = DarkModeConfig(darkMode: value);
  }

  @override
  DarkModeConfig build() {
    return DarkModeConfig(
      darkMode: _repo.isDarkMode(),
    );
  }
}

final darkModeConfigProvider =
    NotifierProvider<DarkModeConfigVm, DarkModeConfig>(
  () => throw UnimplementedError(),
);
