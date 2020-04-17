import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService() {
    init();
  }
  SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  final String _keyUserLoggedIn = 'USER_LOGGED_IN';

  set isUserLoggedIn(bool loggedIn) {
    _sharedPreferences.setBool(_keyUserLoggedIn, loggedIn);
  }

  bool get isUserLoggedIn =>
      _sharedPreferences.getBool(_keyUserLoggedIn) ?? false;

  Future<void> clearPref() async {
    await _sharedPreferences.clear();
  }
}
