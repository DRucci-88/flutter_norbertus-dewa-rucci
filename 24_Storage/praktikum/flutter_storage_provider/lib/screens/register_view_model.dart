import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class RegisterViewModel with ChangeNotifier {
  User? _user;
  User? get user => _user;

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  Future register({required User user}) async {
    _user = user;
    _isLogin = true;
    SharedPreferences registerData = await SharedPreferences.getInstance();
    await registerData.setBool('isLogin', true);
    await registerData.setString('name', user.name);
    await registerData.setString('email', user.email);
    await registerData.setString('phoneNumber', user.phoneNumber);
  }

  logout() async {
    _user = null;
    _isLogin = false;
    SharedPreferences registerData = await SharedPreferences.getInstance();
    registerData.remove('isLogin');
    registerData.remove('name');
    registerData.remove('email');
    registerData.remove('phoneNumber');
  }

  checkLogin() async {
    SharedPreferences registerData = await SharedPreferences.getInstance();
    String? name = registerData.getString('name');
    String? email = registerData.getString('email');
    String? phoneNumber = registerData.getString('phoneNumber');
    if (name != null && email != null && phoneNumber != null) {
      _user = User(name: name, email: email, phoneNumber: phoneNumber);
      _isLogin = true;
    }
    notifyListeners();
  }
}
