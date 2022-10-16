# Storage

## Penyimpanan Lokal

- Diperlukan untuk efesiensi penggunaan data internet, cukup ambil sekali dari internet, lalu simpan di local
- Ada beberapa cara implementasi penyimpanan lokal, sbb:
  - Shared Preferences
  - Local Database

## Shared Preferences

- Menyimpan data yang sederhana
- Penyimpanan dengan format key-value
- Menyimpan tipe data dasar seperti teks, angka dan boolean
- Contoh penggunaan shared preference seperti menyimpan data login, riwayat pencarian dan etc

### Implementasi Shared Preferences

- Menambahkan shared preferences pada fitur login
- Tambahkan pada package `flutter pub add shared_preferences`

## Local Database (SQLite)

- Analogikan sebagai lemari arsip
- Memiliki tabel (file folders)
- Data yang tersimpan (lembaran kertas)
- Tabel memiliki column untuk mendefinisikan data yang tersimpan pada row
- Menyimpan dan mempertahakan data dalam jumlah besar pada local device
- Bersifat private
- Menggunakan SQLite database melalui sqflite
- SQLite adalah database open source yang mendukung insert, read, dan remove data

`flutter pub add sqflite` = Menyediakan class dan function untuk berinteraksi dengan SQLite database

`flutter pub add path` = Menyediakan functions untuk mendefinisikan lokasi penyimpanan database pada memori

## Aplikasi Task Management
