import 'package:shared_preferences/shared_preferences.dart';

class DarkModeConfigRepo {
  static const String _darkMode = "darkMode";

  final SharedPreferences _preferences;

  DarkModeConfigRepo(
    this._preferences,
  );

  Future<void> setDarkMode(bool value) async {
    _preferences.setBool(_darkMode, value);
  }

  bool isDarkMode() {
    return _preferences.getBool(_darkMode) ?? false;
  }
}
