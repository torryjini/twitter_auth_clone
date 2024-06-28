import 'package:flutter/material.dart';
import 'package:twitter_auth_clone/features/main_navigation/repos/dark_mode_config_repo.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/models/dark_mode_config.dart';

class DarkModeConfigVm extends ChangeNotifier {
  final DarkModeConfigRepo _repo;

  late final DarkModeConfig _model = DarkModeConfig(
    darkMode: _repo.isDarkMode(),
  );

  DarkModeConfigVm(this._repo);

  bool get darkMode => _model.darkMode;

  void setDarkMode(bool value) {
    _repo.setDarkMode(value);
    _model.darkMode = value;
    notifyListeners();
  }
}
