import '../app.export.dart';

class SharedPreferencesHelper {
  // Shared Preference Keys
  static const String _kUserInfo = 'user_info';

  // Variables...
  static UserModel? _userInfo;

  static late SharedPreferences _prefs;

  // Load saved data...
  static Future<void> loadSavedData() async {
    _prefs = await SharedPreferences.getInstance();
    _getUserDetail();
  }

  //!------------------------------------------------- Setter --------------------------------------------------//

  // Set UserInfo...
  static set setUserInfo(UserModel? userInfo) {
    _userInfo = userInfo;
    if (userInfo == null) {
      removeCacheData();
    } else {
      _prefs.setString(_kUserInfo, userInfoToRawJson(userInfo));
    }
  }

  //!------------------------------------------------- Getter --------------------------------------------------//

  // User detail...
  static UserModel? get getUserInfo => _userInfo;

  // User detail...
  static UserModel? _getUserDetail() {
    String userInfo = _prefs.getString(_kUserInfo) ?? "";
    _userInfo = userInfo.isEmpty ? null : userInfoFromStoredJson(userInfo);
    return getUserInfo;
  }

//!------------------------------------------------- Remove Cache Data --------------------------------------------------//
  // Remove Cache Data (Use only when user wants to remove all store data on app)...
  static Future<bool> removeCacheData() async {
    return _prefs.remove(_kUserInfo);
  }
}
