# (13) Platform Widget

Apple vs Android

## MaterialApp

- Widget dasar yang mengemas seluruh widget dalamn aplikasi
- Widget yang digunakan pada sistem Android
- Di-import dari `package:flutter/material.dart`

Widget yang pertama kali dibuka, diletakan pada bagian Home.

Mengatur halaman juga dapat dilakukan dengan menggunakan `routes` dan `initialRoute`

```dart
MaterialApp(
  theme: ThemeData.dark(),
  home: const HomePage(),
  routes: {
    'home': (_) => const HomePage(),
  },
);
```

## Scaffhold

Widget dasar untuk membangun sebuah halaman pada MaterialApp. Widget disusun berdasarkan tree.

Membentuk tata letak dasar sebuah halaman yang ditulis melalui properti-properti.

```dart
Scaffold(
  appBar: AppBar(...),
  drawer: Drawer(...),
  body: ...,
  bottomNavigationBar: BottomNavigationBar(...),
);
```

## CupertionApp

- Widget dasar yang mengemas seluruh widget dalam aplikasi
- Widget yang digunakan pada sistem iOS
- Di-import dari `package:flutter/cupertion.dart`

Variable `_themeDark` dibuat untuk menyimpan tema

Diperlukan karena Cupertiono tidak menyediakan ThemeData.Dark() seperti pada Material

Widget yang pertama kali dibuka, diletakan pada bagian Home.

```dart
CupertionApp(
  theme: _themeDark,
  home: const HomePage(),
);
```

## CupertionPageScaffold

Widget dasar untuk membangun sebuah halaman pada CupertionApp. Widget disusun berdasarkan Tree.

```dart
CupertionPageScaffold(
  navigationBar: CupertinoNavigationBar(...),
  child: ...
);
```
