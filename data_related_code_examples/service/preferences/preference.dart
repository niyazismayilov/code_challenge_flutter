import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static PreferencesService? _instance;
  static SharedPreferences? _preferences;

  PreferencesService._internal();

  static Future<PreferencesService> get instance async {
    _instance ??= PreferencesService._internal();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  final String _appFirstTimeOpened = "app-first-time-opened";
  final String _accessToken = "access-token";
  final String _loginState = "login-state";
  final String _mobile = "mobile-number";
  final String _userAcceptedTermsForActivity = "user-accepted-terms-for-activity";

  persistAppFirstTimeOpened(bool value) async => await _preferences?.setBool(_appFirstTimeOpened, value);
  persistAccessToken(String value) async => await _preferences?.setString(_accessToken, "Bearer $value");
  persistLoginState(bool value) async => await _preferences?.setBool(_loginState, value);
  persistUserAcceptTermsState(bool value) async => await _preferences?.setBool(_userAcceptedTermsForActivity, value);
  persistMobile(String value) async => await _preferences?.setString(_mobile, value);

  bool get isAppFirstTimeOpening => _preferences?.getBool(_appFirstTimeOpened) ?? true;
  bool get isUserLoggedIn => _preferences?.getBool(_loginState) ?? false;
  bool get isUserAcceptedTermsForActivity => _preferences?.getBool(_userAcceptedTermsForActivity) ?? false;
  String? get accessToken => _preferences?.getString(_accessToken);
  String get mobile => _preferences?.getString(_mobile) ?? "";
}
