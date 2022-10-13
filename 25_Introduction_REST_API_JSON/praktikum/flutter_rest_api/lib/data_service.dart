import 'dart:convert';

import 'package:dio/dio.dart';
import 'user.dart';

class DataService {
  static Future<Response> getUsers() async {
    return await Dio().get('https://reqres.in/api/users');
  }

  static Future postUser(String name, String job) async {
    return await Dio().post(
      'https://reqres.in/api/users',
      data: {'name': name, 'job': job},
    );
  }

  static Future putUser(String idUser, String name, String job) async {
    return await Dio().put(
      'https://reqres.in/api/users/$idUser',
      data: {'name': name, 'job': job},
    );
  }

  static Future deleteUser(String idUser) async {
    return await Dio().delete('https://reqres.in/api/users/$idUser');
  }

  static Future<List<User>> test() async {
    Response res = await Dio().get('https://reqres.in/api/users');
    final users =
        (res.data['data'] as List).map((user) => User.fromJson(user)).toList();
    // users.forEach((element) => print(element));
    return users;
  }
}
