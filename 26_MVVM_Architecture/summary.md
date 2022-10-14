# MVVM Architecture

## Apa itu MVVM Architecture

MVVM = Model-View ViewModel

Memisahkan logic dengan tampilan (View) kedalam ViewModel

## Keuntungan yang didapat

### Reusability

Jika ada beberapa tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama.

### Maintainability

Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpul bersama logic.

### Testabiliity

Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian.

Pengujian tampilan dan logic dilakukan secara terpisah.

## Aturan pada MVVM

## Melakukan MVVM

### Struktur Direktori

- Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut.

- Tiap screen diletakan dalam sebuah direktori yang didalam terdapat View dan ViewModel

```text
lib
  model
    api
      contact_api.dart
    contac_model.dart
  screen
    contact
      contact_screen.dart
      contact_view_model.dart
```

### Model

- Bentuk data yang akan digunakan, dibuat dalam bentuk class
- Data-data yang dimuat, diletakan pada property

```dart
class Contact {
  final int id;
  final String name;
  final String phone;

  Contact({required this.id, required this.name, required this.phone});
}
```

### Model API

```dart

class ContactAPI {
  static Future<List<Contact>> getContacts() async {
    final response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');

    List<Contact> contacts = (response.data as List)
        .map((e) => Contact(id: e['id'], name: e['name'], phone: e['phone']))
        .toList();
    return contacts;
  }
}
```

### ViewModel

- Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
- Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga

```dart
class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;
  getAllContacts() async {
    final c = await ContactAPI.getContacts();
    _contacts = c;
    notifyListeners();
  }
}
```

### Mendaftarkan ViewModel

- Menggunakan MultiProvider agar dapat menggunakan banyak ViewModel
- MaterialApp sebagai child utama

```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'MVVM Architecture',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ContactScreen(),
      ),
    ),
  );
}
```

### View

Menggunakan StatefulWidget karena ada perubahan state

Melakukan override `didChangeDependencies()` dan akan dipanggil ketika dependency dari object state berubah

Menggunakan provider ini diluar method `build`

```dart
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
  }
```

### Menampilkan Data di View

- Letakkan pada bagian build
- Menggunakan getters yang ada pada ViewModel
- Data dapat langsung ditampilkan pada widgets

```dart
@override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: modelView.contacts.length,
        itemBuilder: (context, index) {
          final contact = modelView.contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phone),
          );
        },
      ),
    );
  }
```
