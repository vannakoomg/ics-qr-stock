import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;

  // initial SharedPreferences

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  // store data to local storage

  static Future<void> storeData({String? key, dynamic value}) async {
    if (value.runtimeType == String) {
      await _prefs!.setString(key!, value);
    } else if (value.runtimeType == int) {
      await _prefs!.setInt(key!, value);
    } else if (value.runtimeType == bool) {
      await _prefs!.setBool(key!, value);
    } else if (value.runtimeType == double) {
      await _prefs!.setDouble(key!, value);
    } else {
      _prefs!.setStringList(key!, value);
    }
  }

  // function for get data from local storage

  static int getIntValue(String key) {
    return _prefs!.getInt(key) ?? 0;
  }

  static String getStringValue(String key) {
    return _prefs!.getString(key) ?? "";
  }

  static bool getBooleanValue(String key) {
    return _prefs!.getBool(key) ?? false;
  }

  static double getDoubleValue(String key) {
    return _prefs!.getDouble(key) ?? 0.0;
  }

  static List<String> getListString(String key) {
    return _prefs!.getStringList(key) ?? [];
  }

  static Future<bool?> remove(String key) {
    return _prefs!.remove(key);
  }
}

enum Z1LocalData { currentLocation, home }

extension GetLocalData on Z1LocalData {
  String get key => toString().split('.').last;
}
