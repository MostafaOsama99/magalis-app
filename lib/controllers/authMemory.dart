import 'package:shared_preferences/shared_preferences.dart';

class AuthMemory {
   Future<bool> loggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    if(prefs.getString('token') != null && prefs.getString('token') != ''){

    return true;
    } else {
      return false;
    }
  } 

  void setPrefs(value) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString("token", value);
  }
}