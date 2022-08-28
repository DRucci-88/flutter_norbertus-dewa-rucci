# (10) Dart Object Oriented Programming 1

## Object Oriented Programming (OOP)

Paradigma pemrograman berkonsep object. Memvisualisasikan object di dunia nyata kedalam program.

- Singkatan dari OOP
- Program disusun dalam bentuk abstraksi object
- Data dan proses diletakan pada abstraksi tersebut, dimana kita bisa menampilakan property dan method dengan menyembunyikan detailnya.

Keuntungan

- Mudah di troubleshhot, ketika terjadi error secara mudah mengetahui letak error tanpa memeriksa baris per baris.
- Mudah di gunakan ulang, beberapa object memiliki kesaamaan ciri-ciri dan perilaku.

## Class

- Abstraksi dari sebuah benda (Object)
- Memiliki ciri-ciri yang disebut property
- Memiliki sifat dan kemampuan yang disebut method

Membuat Class

- Menggunakan kata kunci `class`
- Memiliki nama
- Detail class diletakan didalam tanda kurawal
- Penamaan dari class harus mengikuti Pascal Case

```dart
class Animal {
  // property
  // method
}
```

Membuat object

- Bentuk sebenarnya dari class
- Disebut instance of class
- Diperlukan seperti data

```dart
void main() {
  var h1 = Hewan();
  var h2 = Hewan();
  var h3 = Hewan();
}
```

## Property

- Ciri-ciri suatu class
- Hal-hal yang dimiliki suatu class
- Memiliki sifat seperti variable, deklarasi tipe, assign value etc

```dart
class Animal {
  int mata = 2;
  int kaki = 4;
}

void main(List<String> args) {
  var h1 = Animal();
  print(h1.mata);
  print(h1.kaki);
}

```

## Method

- Sifat suatu class
- Aktivitas yang dapat dikerjakan suatu class
- Memiliki sifat seperti fungsi

```dart
class Cat {
  void eat() {
    print('Eat Whiskas');
  }
}

void main(List<String> args) {
  var h1 = Cat();
  h1.eat();
}

```
