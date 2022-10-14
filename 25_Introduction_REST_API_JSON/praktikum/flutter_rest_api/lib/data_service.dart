import 'dart:convert';

import 'package:dio/dio.dart';
import 'user.dart';

class DataService {
  static Future<Response> getUsers() async {
    try {
      return await Dio().get('https://reqres.in/api/users');
    } on DioError {
      rethrow;
    }
  }

  static Future postUser(String name, String job) async {
    try {
      return await Dio().post(
        'https://reqres.in/api/users',
        data: {'name': name, 'job': job},
      );
    } on DioError {
      rethrow;
    }
  }

  static Future putUser(String idUser, String name, String job) async {
    try {
      return await Dio().put(
        'https://reqres.in/api/users/$idUser',
        data: {'name': name, 'job': job},
      );
    } on DioError {
      rethrow;
    }
  }

  static Future deleteUser(String idUser) async {
    try {
      return await Dio().delete('https://reqres.in/api/users/$idUser');
    } on DioError {
      rethrow;
    }
  }

  static Future<List<User>> test() async {
    try {
      Response res = await Dio().get('https://reqres.in/api/users');
      final users = (res.data['data'] as List)
          .map((user) => User.fromJson(user))
          .toList();

      return users;
    } on DioError {
      rethrow;
    }
  }
}

Future<List<User>> getUsersModel() async {
  Response res = await Dio().get('https://reqres.in/api/users');
  final users =
      (res.data['data'] as List).map((user) => User.fromJson(user)).toList();
  // users.forEach((element) => print(element));
  return users;
}
