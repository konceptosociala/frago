import 'package:shared_preferences/shared_preferences.dart';

class Config {
  final SharedPreferences _prefs;

  Config._(this._prefs);

  static Future<Config> getInstance() async => 
    Config._(await SharedPreferences.getInstance());
}