import 'package:flutter/material.dart';
import 'package:flutter_unit_test/Service/Api/contact_api.dart';

import '../models/contact_model.dart';

enum ContactViewState { none, loading, ready, error }

class ContactViewModel with ChangeNotifier {
  ContactViewState _state = ContactViewState.none;
  ContactViewState get state => _state;

  final List<Contact> _contacts = [];
  List<Contact> get contacts => List.unmodifiable(_contacts);

  final contactAPI = ContactAPI();

  changeState(ContactViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllContact() async {
    changeState(ContactViewState.loading);
    try {
      final c = await contactAPI.getAllContacts();
      _contacts.addAll(c);
      // print(c);
      notifyListeners();
      changeState(ContactViewState.ready);
    } catch (e) {
      changeState(ContactViewState.error);
    }
  }
}
