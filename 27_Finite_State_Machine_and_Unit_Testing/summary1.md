# Finite State Machines

## FInite State Machine

- Mesin yang memiliki sejumlah state
- Tiap state menunjukan apa yang terjadi sebelumnya

Terdapat 3 state yang menunjukan kejadian dalam suatu proses:

- IDDLE saat tidak terjadi proses
- RUNNING saat proses sedang berjalan
- ERROR saat proses gagal diselesaikan

## Implementasi pada View-Model

### Menambah Enum

Membuat enum untuk masing-masing state

- none saat IDDLE
- loading saat RUNNING
- error saat ERROR

```dart
enum ContactViewState {
  none,
  loading,
  error
}
```

### Menambah Getter-Setter

Membuat getter-setter untuk menyimpan state dari widget

```dart
class ContactViewModel with ChangeNotifier{
  ContactViewState _state = ContactViewState.none;
  ContactViewState get state => _state;

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;  

  changeState(ContactViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllContact() async {
    changestate(ContactViewState.loading);
    try {
      final c = await ContactAPI.getAllContacts();
      _contact = c;
      notifyListeners();
      changeState(ContactViewState.none);
    } catch (e) {
      changeState(ContactViewState.error);
    }
  }
}
```

### Perbedaan tampilan pada setiap State

Informasi finite state dapat berguna untuk menentukan seperti apa tampilan yang dimunculkan.

```dart
  Widget body(ContactViewModel viewModel) {
    final isLoading = viewModel.state == ContactViewState.loading;
    final isError = viewModel.state == ContactViewState.error;

    if (isLoading) {
      return const Center(child: CircularProgressIn);
    }
    if (isError) {
      return const Center(child: const Text('Gagal mengambil data'));
    }
    return listView(viewModel);
  }
```

