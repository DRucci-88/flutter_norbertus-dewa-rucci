# (11) Dart Object Oriented Programming 2

## Constructor

- Method yang dijalankan saat pembuatan project
- Dapat menerima parameter
- Tidak memiliki return
- Nama sama dengan nama class

```dart
class Hewan {
  int? mata;
  int? kaki;
  Hewan() {
    mata = 0;
    kaki = 0;
  }
}

class Animal {
  int? mata;
  int? kaki;
  Animal(this.mata, this.kaki);
}

void main(List<String> args) {
  var hewan = Hewan();
  var zebra = Animal(2, 4);
  print(hewan.mata);
  print(zebra.kaki);
}
```

## Inheritance

- Membuat class baru dengan memanfaatkan class yang sudah ada
- Bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru
- Bisa diibaratkan orang tua mewarisi sifat ke anaknya.

Menambahkan keyword `extends` pada class baru

```dart
import 'constructor.dart';

class Kambing extends Hewan {
  Kambing() {
    mata = 2;
    kaki = 4;
  }
}

void main(List<String> args) {
  var k1 = Kambing();
  print(k1.mata);
  print(k1.kaki);

  var h1 = Hewan();
  print(h1.mata);
  print(h1.kaki);
}

```

## Method Overriding

- Menulis ulang method yang ada pada super-class
- Bertujuan agar class memiliki method yang sama, dengan proses yang berbeda;

Syarat overriding

- Dilakukan pada class yang melakukan inheritance
- Method sudah ada pada class induk
- Method ditulis ulang seperti membuat method baru pada class anak
- Ditambahkan tanda `@override` di barus sebelum method dibuat

```dart
class Hewan {
  int? mata;
  int? kaki;
  Hewan() {
    mata = 0;
    kaki = 0;
  }
  reproduksi() => print('Tidak Diketahui');
  bernafas() => print('Tidak diketahui');
}
```

```dart
import 'constructor.dart';

class Kambing extends Hewan {
  @override
  reproduksi() {
    print('Melahirkan');
  }

  @override
  bernafas() {
    print('paru-paru');
  }
}

void main(List<String> args) {
  var k1 = Kambing();
  k1.reproduksi();
  k1.bernafas();

  var h1 = Hewan();
  h1.reproduksi();
  h1.bernafas();
}
```

## Interface

- Berupa class
- Menunjukan method apa saja yang ada pada suatu class
- Seluruh method wajib di-override
- Digunakan dengan keyword `implements`

```dart
class Hewan {
  reproduksi() => print('Tidak Diketahui');
  bernafas() => print('Tidak diketahui');
}

class Kambing implements Hewan {
  @override
  bernafas() {
    print('Paru-paru');
  }

  @override
  reproduksi() {
    print('melahirkan');
  }
}

void main(List<String> args) {
  var k1 = Kambing();
  k1.bernafas();
  k1.reproduksi();

  var h1 = Hewan();
  h1.bernafas();
  h1.reproduksi();
}
```

## Abstract Class

- Berupa class abstrak
- Menunjukan method apa saja yang ada pada suatu class
- Digunakan dengan menggunakan keyword `extends`
- Tidak dapat dibuat object
- Tidak semua method harus di-override

```dart
abstract class Hewan {
  reproduksi() => print('Tidak Diketahui');
  bernafas() => print('Tidak diketahui');
}

class Kambing extends Hewan {
  @override
  reproduksi() {
    print('Melahirkan');
  }

  @override
  bernafas() {
    print('paru-paru');
  }
}

void main(List<String> args) {
  var k1 = Kambing();
  k1.reproduksi();
  k1.bernafas();

  // var h1 = Hewan();  // Abctract class cannot be instantied
}
```

## Polymorphism

- Kemampuan data berubah menjadi bentuk lain
- Tipe data yang dapat digunakan adalah super class
- Dapat dilakukan pada class dengan extends atau implements

```dart
class Hewan {
  reproduksi() => print('Tidak Diketahui');
  bernafas() => print('Tidak diketahui');
}

class Kambing extends Hewan {
  @override
  reproduksi() {
    print('Melahirkan');
  }

  @override
  bernafas() {
    print('paru-paru');
  }
}

class Kucing extends Hewan {
  @override
  reproduksi() {
    print('Melahirkan');
  }

  @override
  bernafas() {
    print('paru-paru');
  }
}

void main(List<String> args) {
  Hewan k1 = Hewan();
  print(k1);

  k1 = Kambing();
  print(k1);

  k1 = Kucing();
  print(k1);
}
```

## Generics

- Dapat digunakan pada class atau fungsi
- Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda
- Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi

Membuat class dengan Generics

- Class hadiah dapat dimasukan dengan tipe T
- Tipe T dapat digunakan di seluruh class hadiah

```dart
class Hadiah<T> {
  var _isi;
  Hadiah(T i) {
    _isi = i;
  }
}

void main(List<String> args) {
  var h1 = Hadiah<String>('mobile');
  var h2 = Hadiah<int>(10);
  print(h1._isi);
}
```

Membuat fungsi dengan Generics

```dart
void cekTipe<T>(T data) => print(data.runtimeType);

void main(List<String> args) {
  cekTipe<String>('s');
  cekTipe<int>(1);
  cekTipe<bool>(true);
}
```
