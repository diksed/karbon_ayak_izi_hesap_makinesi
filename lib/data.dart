import 'package:shared_preferences/shared_preferences.dart';

class data{
  static SharedPreferences? _preferences;
  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setDataInt(String key,int kayit) async{
    await _preferences?.setInt(key, kayit);
  }
  static Future setDataString(String key,String kayit) async{
    await _preferences?.setString(key, kayit);
  }
  static Future<String?> getDataString(String key) async{
    return await _preferences?.getString(key);
  }
  static Future<int?> getDataInt(String key) async{
    return await _preferences?.getInt(key);
  }

}