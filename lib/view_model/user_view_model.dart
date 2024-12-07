import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserViewModel with ChangeNotifier {
  //
  // Future<bool> saveUser(UserModel user) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("token", user.token.toString());
  //   notifyListeners();
  //   return true;
  // }
  //
  // Future<UserModel> getUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? token = prefs.getString("token");
  //
  //   return UserModel(token: token.toString());
  // }
  //
  // Future<bool> removeUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove("token");
  //   return true;
  // }
}
