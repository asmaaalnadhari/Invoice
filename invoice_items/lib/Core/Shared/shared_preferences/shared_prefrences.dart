import 'package:shared_preferences/shared_preferences.dart';

class CacheData{
  static late SharedPreferences sharedPreferences;
  ///declare
  static Future<void> cacheInitialization() async {
    sharedPreferences= await SharedPreferences.getInstance();

  }
  //methods:
  ///1. set:
  static Future<bool> setData({required String key, required dynamic value})async
  {
    if( value is int)
    {
      print(value is int);
      return await sharedPreferences.setInt(key, value);
    }
    return false;

  }
  ///2. get:
  static dynamic getData({required String key})
  {
    return sharedPreferences.get(key);
  }
  static const String keyId = 'id';
   static int getNextId()  {
    int currentId = getData( key:keyId) ?? 1;
    int nextId = currentId + 1;
    setData(key: keyId, value: nextId);
   return nextId;
  }

}