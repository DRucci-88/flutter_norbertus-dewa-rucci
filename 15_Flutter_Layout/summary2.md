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

Membuat TextField

- Data diambil menggunakan TextEditingController
- Isian data berupa teks

```dart

```

### Radio

- Bisa pilih banyak value atau hanya satu saja

## Button