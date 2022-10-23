import 'package:dio/dio.dart';
import 'package:flutter_unit_test/models/contact_model.dart';

class ContactAPI {
  Future<List<Contact>> getAllContacts() async {
    final res = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');

    List<Contact> contacts = (res.data as List).map((e) {
      return Contact(id: e['id'], name: e['name']);
    }).toList();
    return contacts;
  }
}
