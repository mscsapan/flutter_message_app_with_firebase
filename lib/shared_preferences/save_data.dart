import 'package:shared_preferences/shared_preferences.dart';

class SaveUserFunction {
  static String isUserLoggedInKey = "ISLOGGEDIN";
  static String userNameKey = "NAMEKEY";
  static String userEmailKey = "EMAILKEY";

//save data
  static Future<bool> saveUserLoggedIn(bool isLoggedIn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool(isUserLoggedInKey, isLoggedIn);
  }

  static Future<bool> saveUserName(String username) async {
    SharedPreferences name = await SharedPreferences.getInstance();
    return name.setString(userNameKey, username);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences email = await SharedPreferences.getInstance();
    return email.setString(userEmailKey, userEmail);
  }

  //getting data
  static Future<bool> getUserLoggedIn() async {
    SharedPreferences loggedIn = await SharedPreferences.getInstance();
    return loggedIn.getBool(isUserLoggedInKey);
  }

  static Future<String> getUserName() async {
    SharedPreferences name = await SharedPreferences.getInstance();
    return name.get(userNameKey);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences email = await SharedPreferences.getInstance();
    return email.get(userEmailKey);
  }
}
