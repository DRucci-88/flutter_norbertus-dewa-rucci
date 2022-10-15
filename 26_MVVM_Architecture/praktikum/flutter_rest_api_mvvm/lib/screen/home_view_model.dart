import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_mvvm/model/api/user_api.dart';
import 'package:flutter_rest_api_mvvm/model/user_model.dart';

class HomeViewModel with ChangeNotifier {
  String _result = '';
  String get result => _result;

  final List<User> _users = [];
  List<User> get users => List.unmodifiable(_users);

  clearData() {
    _result = '';
    _users.clear();
    notifyListeners();
  }

  getUsers() async {
    try {
      Response res = await UserApi.getUsers();
      _result = res.toString();
    } on DioError catch (e) {
      _result = 'Get User Failed - ${e.message}';
    }
    notifyListeners();
  }

  postUser({required String name, required String job}) async {
    try {
      Response res = await UserApi.postUser(name, job);
      _result = res.toString();
    } on DioError catch (e) {
      _result = 'Post User Failed - ${e.message}';
    }
    notifyListeners();
  }

  putUser({
    required String id,
    required String name,
    required String job,
  }) async {
    try {
      Response res = await UserApi.putUser(id, name, job);
      _result = res.toString();
    } on DioError catch (e) {
      _result = 'Put User Failed - ${e.message}';
    }
    notifyListeners();
  }

  deleteUser({required String id}) async {
    try {
      Response res = await UserApi.deleteUser(id);
      _result = 'Delete Success';
    } on DioError catch (e) {
      _result = 'Delete User Failed - ${e.message}';
    }
    notifyListeners();
  }

  getUsersModel() async {
    try {
      _users.addAll(await UserApi.getUsersModel());
    } on DioError catch (e) {
      _result = 'Get Users Model Failed - ${e.message}';
      _users.clear();
    }
    notifyListeners();
  }
}
