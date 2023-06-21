import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_dd360/core/helper/preferences_helper.dart';
import 'package:test_dd360/core/services/db.dart';
import 'package:test_dd360/core/services/image_quality.dart';

class LoginStore {
  LoginStore._internal();

  static final LoginStore _instance = LoginStore._internal();

  static LoginStore get instance => _instance;
  int _currentStore = 0;
  String _accessToken = "";
  String _refreshToken = "";
  String _imageQuality = 'medium';

  int get currentStore => _currentStore;

  String get accessToken => _accessToken;

  String get refreshToken => _refreshToken;

  String get imageQuality => _imageQuality;

  final SharedPreferences _sharedPreferences = DB.instance.prefs;

  Future<void> init() async {
    _currentStore =
        _sharedPreferences.getInt(PreferencesHelper.currentStore) ?? 0;
    _accessToken = _sharedPreferences.getString(PreferencesHelper.token) ?? "";
    _refreshToken =
        _sharedPreferences.getString(PreferencesHelper.refreshToken) ?? "";

    _imageQuality =
        _sharedPreferences.getString(PreferencesHelper.imageQuality) ??
            ImageQuality.medium.name;
  }

  Future<void> logOutSession() async {
    _currentStore = 0;
    await _sharedPreferences.setInt(PreferencesHelper.currentStore, 0);
    _accessToken = "";
    await _sharedPreferences.setString(PreferencesHelper.token, "");
    _refreshToken = "";
    await _sharedPreferences.setString(PreferencesHelper.refreshToken, "");

    await _sharedPreferences.setString(
        PreferencesHelper.imageQuality, ImageQuality.medium.name);
  }

  Future<void> setImageQuality(ImageQuality imageQuality) async {
    _imageQuality = imageQuality.name;
    await _sharedPreferences.setString(
        PreferencesHelper.imageQuality, imageQuality.name);
  }

  Future<void> logInSession(
      {required int currentStore,
      required String accessToken,
      required String refreshToken}) async {
    _currentStore = currentStore;
    await _sharedPreferences.setInt(
        PreferencesHelper.currentStore, currentStore);
    _accessToken = accessToken;
    await _sharedPreferences.setString(PreferencesHelper.token, accessToken);
    _refreshToken = refreshToken;
    await _sharedPreferences.setString(
        PreferencesHelper.refreshToken, refreshToken);
  }

  Future<void> setAccessToken(String accessToken) async {
    _accessToken = accessToken;
    await _sharedPreferences.setString(PreferencesHelper.token, accessToken);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    _refreshToken = refreshToken;
    await _sharedPreferences.setString(
        PreferencesHelper.refreshToken, refreshToken);
  }
}
