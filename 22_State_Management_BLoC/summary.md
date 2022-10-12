# State Management

## Declartive UI

Flutter memiliki sifat declarative yang artinya Flutter membangun UI nya pada screen untuk mencerminkan keadaan state saat ini

## setState

- State adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori
- Flutter akan membangun ulang UI nya ketika ada state atau data yang berubah
- Ada 2 jenis state dalam Flutter yakni ephemeral dan app state

### Ephemeral State

- Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widget nya. contohnya
  - PageView
  - BottomNavigationBar
  - Switch Button
- Tidak perlu state management yang kompleks
- Hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState()

### App State

- Digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget, contohnya
  - Login info
  - Pengaturan preferensi pengguna
  - Keranjang belanja, dimana informasi yang pengguna pilih di suatu screen yang mana informasi itu akan muncul di screen yang berbeda

### Pendekatan State Management

- setState
  - Lebih cocok penggunann nya pada ephemeral state
- Provider
  - Penggunaan unsuk state management yang lebih kompleks seperti app state, pendeketan ini direkomendasikan oleh tim flutter karena mudah dipelajari
- Bloc
  - Menggunakan pola stream/observable, untuk memisahkan UI dengan bisnis logic nya
  
## Provider

### ChangeNotifier

- Class yang menambah dan menghapus listeners
- Digunakan dengan cara meng-extends
- Memanggil notifyListeners(), fungsi yang memberitahu widget yang menggunakan state bahwa terjadi perubahan data sehinggga UI nya harus dibangun ulang

### ChangeNotifierProvider

- Widget yang membungkus sebuah class
- Mengimplementasikan ChangeNotifier dan menggunakan child untuk widget UI nya
- Menggunakan create, provider yang akan menyimpan model yang telah dibuat

### Consumer

- Widget yang mendengarkan perubahan class yang mengimplementasikan ChangeNotifier
- Membangun ulang widget yang dibungkus Consumer saja
- Penting untuk meletakan Consumer pada lingkup sekecil mungkin
- Membutuhkan property builder yang berisi context, model dan child

## BLoC (Business Logic Component)

Memisahkan antara business logic dengan UI

### Cara kerja Bloc

- Menerima event sebagai input
- Dianalisa dan dikelola oleh Bloc
- Menghasilkan state sebagai output

### Stream

- Rangkaian proses secara asynchronous
- Actor utama di dalam Bloc
