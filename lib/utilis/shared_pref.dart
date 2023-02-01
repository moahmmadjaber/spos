import 'package:shared_preferences/shared_preferences.dart';
import 'package:spos/constants/enum_constant.dart';

class SharedPref{
  static Future<void> setUser(ID,firstName,status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ID', ID);
    await prefs.setString('first_name', firstName);
    await prefs.setBool('status', status);
  }
  static Future<void> setPathImgUsername(username,pathImg) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('path_img', pathImg);
  }
  static Future<dynamic> getUser(UserEnum userEnum) async {
    switch(userEnum){
      case UserEnum.firstName:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString('first_name');
      case UserEnum.lastName:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString('last_name');
      case UserEnum.username:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString('username');
      case UserEnum.countryCode:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString('country_code');
      case UserEnum.phone:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString('phone');
      case UserEnum.dateBirth:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString('date_birth');
      case UserEnum.idGender:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getInt('id_gender');
      case UserEnum.pathImg:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString('path_img');
      case UserEnum.token:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString('token');
      case UserEnum.expiration:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        return DateTime.parse(prefs.getString('expiration')!);
    }
  }
  static Future<String> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var firstName = prefs.getString('first_name');
    return '$firstName';

  }
  static Future<String> getID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var ID = prefs.getString('ID');
    return'$ID';
  }
  static Future<bool> haveLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? res = prefs.getString('ID');
    return res == null ? false : true;
  }
  static Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('ID');
    prefs.remove('first_name');
    prefs.remove('status');

  }
}