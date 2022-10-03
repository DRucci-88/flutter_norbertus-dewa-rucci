# Flutter Global State Management

## Pengertian State

- Data yang dapat dibaca saat pembuatan widget
- Dapat berubah saat widget sedang aktif
- Hanya dimiliki oleh `StatefulWidget`

Memanfaatkan State

- Penggunaan widget yang memiliki perubahan
- Dibuat sebagai property dari class
- Digunakan saat widget saat build

Mengubah state menggunakan method setState

## Global State

State biasa yang dapat digunakan pada seluruh widget

Kenapa perlu Global State ?

- Antara widget dapat memanfaatkan state yang sama dengan mudah

Bisa menggunakan package `Provider` untuk penangangan State yang lebih kompleks

## Provider

Instalasi provider

- Menambah package provider pada bagian dependencies dalam file pubspec.yaml
- Jalankan perintah `flutter pub add provider` lalu `flutter pub get`

Membuat State Provider

- Buat file bernama contact.dart
- Definisikan state dalam bentuk class
- import dalam file `main.dart`
- Daftarkan pada runApp dengan MultiProvider

Menggunakan State dari Provider

- Simpan provider dalam variable
- Ambil data dari provider melalui getter
