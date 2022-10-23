import 'package:flutter_unit_test/Service/Api/contact_api.dart';
import 'package:flutter_unit_test/models/contact_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'contact_api_test.mocks.dart';

@GenerateMocks([ContactAPI])
void main() {
  group('ContactAPI', () {
    ContactAPI contactAPI = MockContactAPI();
    test('get all contacts returns data', () async {
      when(contactAPI.getAllContacts())
          .thenAnswer((_) async => <Contact>[Contact(id: 1, name: 'name')]);
      var contacts = await contactAPI.getAllContacts();
      expect(contacts.isNotEmpty, true);
    });
  });
}
