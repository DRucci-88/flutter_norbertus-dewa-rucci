# Flutter Form

## Form

- Digunakan untuk interaksi dengan pengguna
- Menerima isian dara dari pengguna
- Isian data dapat lebih dari satu

Membuat Form

- Menggunakan `StatefulWidget`
- Keadaan form disimpan menggunakan `GlobalKey<FormState>`

```dart
// property
var formKey - GlobalKey<FormState>();

// Build
Form(
  key: formKey,
  child: inputWidgets,
);
```

## Input

> Ketika kita menggunakan controller, kita harus menghapus controllernya ketika widget sudah tidak digunakan. Supaya tidak memory leak. Bisa menggunakan Dispose

### Text Field

- Menerima isian data dari pengguna
- Isian data dapat lebih dari satu

### Radio

- Bisa pilih banyak value atau hanya satu saja

### Dropdown Button

- Memberi opsi pada pengguna
- Hanya dapat memilih satu opsi
- Opsi tidak ditampilkan diawal, hanya tampil jika ditekan

> Contoh code:

```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Form')),
      body: Form(
        key: formKey,
        child: Column(children: [
          TextField(controller: inputController),
          ListTile(
            leading: Radio<String>(
              value: 'Laki-laki',
              groupValue: radioValue,
              onChanged: (String? value) => setState(() {
                radioValue = value ?? "";
              }),
            ),
            title: const Text('Laki-laki'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Perempuan',
              groupValue: radioValue,
              onChanged: (String? value) => setState(() {
                radioValue = value ?? "";
              }),
            ),
            title: const Text('Perempuan'),
          ),
          DropdownButton(
            value: dropdownValue,
            items: const [
              DropdownMenuItem(value: 0, child: Text('Pilih')),
              DropdownMenuItem(value: 1, child: Text('Satu')),
              DropdownMenuItem(value: 2, child: Text('Dua')),
              DropdownMenuItem(value: 3, child: Text('Tiga')),
              DropdownMenuItem(value: 4, child: Text('Empat')),
            ],
            onChanged: (int? value) {
              setState(() {
                dropdownValue = value ?? 0;
              });
            },
          ),
        ]),
      ),
    );
  }
```

## Button

- Bersifat seperti tombol
- Dapat melakukan sesuatu saat ditekan

### Elevated Button

- Tombol yang timbul
- Jika ditekan akan menjalankan `onPressed`

### Icon Button

- Tombol yang menampilkan icon
- Jika ditekan akan menjalankan `onPressed`
