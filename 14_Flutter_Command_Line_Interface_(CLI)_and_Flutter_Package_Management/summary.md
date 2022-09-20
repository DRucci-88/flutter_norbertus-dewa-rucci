# 14 Flutter Command Line Interface (CLI) and Flutter package management

## Flutter CLI

- Alat yang digunakan untuk berinteraksi dengan Flutter SDK
- Perintah didalam terminal

## Important CLI Commands

- `flutter doctor` | `flutter doctor -v`
  - Perintah untuk menampilkan informasi software yang dibutuhkan flutter
  - Ketika ada problem, maka berwarna merah

- `flutter create [app name]`
  - Perintah untuk membuat project aplikasi flutter baru di directory tertentu

- `flutter run [dart file]`
  - Perintah untuk menjalakan project aplikasi di device yang tersedia

- Flutter Emulator
  - `flutter emulators`
  - `flutter emulators --launch [emulator id]`
  - `flutter emulators --create [--name xyz]`
  - Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru.

- `flutter channel`
  - Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukan channel yang digunakan saat ini

- Flutter Pub
  
  Ada 2 sintaks yang bisa digunakan
  - `flutter pub add [package name]`
    - Menambahkan packages ke dependencies yang ada di pubspec.yaml
  - `flutter pub get`
    - Download semua packages atau dependencies yang ada di pubspec.yaml

- `flutter build [directory]`
  - Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, PlayStore dll

- `flutter clean`
  - Perintah untuk menghapuus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator
  - Perintah ini akan memperkecul ukuran project tersebut.

## Packages Management

- Flutter mendukung sharing packages
- Packages dibuat developers lain
- Mempercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
- Mendapatkan packages di websites pub.dev

### Cara Menambakan Packages

- Cari package di pub.dev
- Copy baris dependencies yang ada di bagian installing
- Buka pubspec.yaml
- Paste barisnya dibawah dependencies pubspec.yaml
- Run flutter pub get di terminal
- Import package di file dart agar bisa digunakan
- Stop atau restart aplikasi jika dibutuhkan
