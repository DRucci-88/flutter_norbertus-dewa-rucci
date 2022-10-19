import 'package:flutter/material.dart';
import 'package:project_weekly3/model/user_model.dart';
import 'package:uuid/uuid.dart';

class UserProvider with ChangeNotifier {
  final List<User> _users = [
    User(
      const Uuid().v1(),
      'Norbertus',
      'norbertus@gmail.com',
      'There is no tomorrow',
    ),
    User(
      const Uuid().v1(),
      'Dewa',
      'dewa@gmail.com',
      'We seek for justice',
    ),
    User(
      const Uuid().v1(),
      'Rucci',
      'rucci@gmail.com',
      'Die with honour',
    ),
  ];
  List<User> get users => List.unmodifiable(_users);

  addUser(User user) {
    _users.add(user);
    _users.forEach((element) => print(element.username));
  }

  deleteUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }
}
