import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_2/contact_model.dart';

class ContactManager extends ChangeNotifier {
  final List<Contact> _contacts = [
    Contact('1', 'Norbertus', '0845321321'),
    Contact('2', 'Dewa', '0897565432'),
    Contact('3', 'Rucci', '0836497331'),
  ];
  List<Contact> get contacts => List.unmodifiable(_contacts);

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }
}
