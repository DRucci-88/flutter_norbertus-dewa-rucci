# (5) Introduction to Algorithm and Dart Programming

## Dart Programming Language

Bahasa pemrograman yang di rancang untuk pengembangan client, seperti desktop, web dan mobile aplikasi. Didirikan oleh Lars Bak dan Kasper Lund di Google.

Keuntungan Dart:

- Type safe: menjamin konsistensi data
- Null Safety: memberi keamanan dari data bernilai hampa (null)
- Rich standart library: hadir dengan banyak dukungan library internal
- Multiplatform: mampu berjalan pada berbagai jenis perangkat

## Fungsi Main

- Bagian yang dijalankan pertama kali
- Dapat memiliki tipe data void atau int
- Memiliki nama main

## Komentar

Baris kode yang tidak dijalankan dengan tujuan memberi catatan pada kode, bisa sebagai dokumentasi untuk menjelaskan program yang kita tulis sehingga baris kode yang tersebut tidak akan di ekskusi.

- `// print('sss');`
- `/*print("sss");*/`

## Variable

Pengertian variable

- Digunakan untuk menyimpan data, bisa diibaratkan sebuah kotak yang memiliki sebuah value
- Memiliki nama
- Memiliki tipe data

```dart
void main() {
  int score = 10;
  var age;
  final name = 'Norbertus Dewa Rucci'
  
  print(age);
  print(score);
  print(name);

  score = 30;
  // name = 'Kobokan Aer' // This line makes an error

  print(score);
  print(name);

  // Output
  // null
  // 10
  // Norbertus Dewa Rucci
  // 30
  // Norbertus Dewa Rucci
}
```

Menggunakan `var` dan diikuti nama variable secara otomatis tipe data variable tersebut adalah `Null`

***Konstanta*** pada dasarnya sama seperti variable pada umumnya namun sekali kita memberikan nilai (assign value) maka nilai tersebut ***tidak dapat berubah*** (nilai tetap).

## Tipe Data

Beresifat staticly type yang berarti saat membuat variable, harus menentukam jenis data.

Jenis-jenis tipe data:

- int: bilangan bulat
- double: bilangan pecahan
- bool: true/false
- string: teks

```dart
void main() {
  int number = 10;
  double gpa = 23.5;
  bool isHandsome = true;
  String name = "Norbertus Dewa Rucci";
}
```

## Operator

- Operasi pengolahan data
- Data yang dikelola disebut operand

***Arithmetic*** untuk perhitungan matematis seperti tambah, kurang, kali, bagi, modulus (`+ - * / %`).

***Assignment*** memberi nilai pada variable (`= += -= *= %=`).

***Comparison*** membandingkan kesetaran nilai dan return bool (`== < <= > >=`).

***Logical*** menggabungkan beberapa kondisi untuk menguji logika dari beberapa nilai bool (`&& || !`).

Operasi pembagian akan menghasilkan bilangan pecahan (return double).
