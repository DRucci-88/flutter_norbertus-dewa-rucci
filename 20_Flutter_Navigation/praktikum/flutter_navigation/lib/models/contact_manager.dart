import 'package:flutter/material.dart';
import 'package:flutter_navigation/models/contact_model.dart';

class ContactManager extends ChangeNotifier {
  final _contactModels = <ContactModel>[];
  List<ContactModel> get contactModels => List.unmodifiable(_contactModels);

  void addContact(ContactModel contact) {
    _contactModels.add(contact);
    notifyListeners();
  }

  void deleteContact(int index) {
    _contactModels.removeAt(index);
    notifyListeners();
  }
}
