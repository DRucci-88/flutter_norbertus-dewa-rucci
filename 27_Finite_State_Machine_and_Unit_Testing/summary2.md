# Unit Test

## Pengertian Unit Test

- Salah satu jenis pengujin pada perangkat lunak
- Pengujian dilakukan pada unit dalam perangkat lunak
- Unit yang dimaksid umumnya adalah fungsi atau method

### Tujuan Unit Test

- Memastikan fungsi dapat mengolah berbagai jenis input
- Memastikan hasil dari suatu fungsi atau method sudah sesuai
- Menjadi dokumentasi

### Bagaimana melakukan Unit test

1. Manual

- Unit dijalankan dan di cek hasilnya secara manual

2.Automated

- Menulis script yang dapat dijalankan berkali-kali menggunakan test runner

### Menambah Dependencies

- Tambahkan test, pada bagian dev_dependencies dalam file `pubspec.yaml`
- Jalankan `flutter pub get` pada terminal

### Membuat File Test

- Pada folder `test`, tambakan folder baru `model/api`
- Dalam folder terebut, tambahkan file baru `contact_api_test.dart`

### Menulis Test Script

- Import package test
- Membuat test case
- Menjalankan fungsi
- Cek hasil dengan expect

```dart
import 'package:test/test.dart';

void main() {
  test('get all contacts returns data', () async {
    var contacts = await ContactAPI.getAllContacts();
    expect(contacts.isNotEmpty, true);
  });
}
```

### Mengelempokan Test

- Beberapa test dengan subjeck yang sama diletakan dalam sebuah kelompok
- Dilakukan dengan menggunakan Group

```dart
import 'package:test/test.dart'

void main() {
  
  group('ContactAPI', () {
    test('get all contacts returns data', () async {
      var contacts = await ContactAPI.getAllContacts();
      expect(contacts.isNotEmpty, true);
    });  
  });
}
```

## Mocking

- Proses yang terikat dengan sistem eksternal dapat mempengaruhi berjalannya pengujian
- Pengaruh tersebut dapat mengganggu proses pengujian
- Dilakukan mocking untuk menghindari masalah-masalah tersebut

### Bagaimana cara kerja Mocking

- Suatu object dibuat bentuk tiruannya
- Bentuk tiruan tersebut memiliki input dan output yang sama dengan yang asli
- Bentuk tiruan menghilangkan ketergantungan pada sistem eksternal

### Menambahkan Dependencies

- Tambahkan `mockito` dan `build_runner`, pada bagian `dev_dependencies` dalam file `pubspec.yaml`
- Jalankan `flutter pub get` pada terminal

### Melakukan Mocking

Method `getAllContacts` jangan dijadikan static terlebih dahulu

```dart
class ContactAPI {
  Future<List<Contact>> getAllContacts() async {
    final res = .....
    List<Contact> contacts = .....
    return contacts;
  }
}
```

Memasang annotation untuk membuat mock

```dart
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ContactAPI])
void main() {
  group('ContactAPI', () {
    test('get all contacts returns data', () async {
      var contacts = await ContactAPI.getAllContacs();
      expect(contact.isNotEmpty, true);
    });
  });
}
```

Membuat file mock dengan menjalankan perintah pada terminal `flutter pub run build_runner build`. Maka akan menghasilkan satu file mock baru.

```dart
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ContactAPI])
void main() {
  group('ContactAPI', () {

    // Hasil Generated Mock
    ContactAPI contactAPI = MockContactAPI();

    test('get all contacts returns data', () async {
      when(contactAPI.getAllContacts()).thenAnswer(
        (_) async => <Contact>[
          Contact(id: 1, name: 'a', phone: '0'),
        ],
      );
      var contacts = await contactAPI.getAllContacs();
      expect(contact.isNotEmpty, true);
    });
  });
}
```

`flutter test -f`
