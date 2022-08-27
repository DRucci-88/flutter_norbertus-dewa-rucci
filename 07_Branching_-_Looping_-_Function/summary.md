# (7) Branching - Looping - Function


## Fungsi

### Anonymous function

- Tidak memiliki nama
- Fungsi sebagai data

```dart
() {
  // Something here
}
```

```dart
// Anonymous function yang disimpan kedalam variable
var hello = () {
  print('Hello');
};
var jumlah = (int a, int b) {
  return a + b;
}

void main() {
  // Pemanggilan anonymous function
  hello();
  print(jumlah(1,3));
}
```

### Arrow function

- Membuat funtion lebih ringkas
- Dapat memiliki nama atau tidak
- Berisi 1 data (dari proses maupun data statis)
- Nilai return fungsi ini diambil dari data tsb

```dart
var hello = () => print('hello');
var jumlah = (int a, int b) => a + b;
```

## Async-Await

- Menjalankan beberapa proses tanpa perlu menunggu
- Proses ditulis dalam bentuk fungsi
- Await akan menunggu hingga proses async selesai

Asynchronus:

```dart
// function ini terdapat Object Future dg method delayed berdurasi 1s
void p1() {
  Future.delayed(Duration(seconds: 2), () {
    print('Hello from p1');
  });
}
void p2() => print('Hello from p2');
void main(List<String> args) {
  p1();
  p2();
}

// Output
// Hello from p2
// Hello from p1
```

Async-Await dapat  membuat kita menuliskan program Asynchronus layaknya Synchronus:

```dart
Future<void> p1() {
  return Future.delayed(Duration(seconds: 2), () => print('Hello from p1'));
}
void p2() => print('Hello from p2');
void main(List<String> args) async {
  await p1();
  p2();
}
// Output
// Hello from p1
// Hello from p2
```

## Tipe Data Future

- Data yang dapat ditunggu
- Membawa data return dari dari fungsi async

```dart

// Object Future akan return String
Future<String> p3() {
  return Future.delayed(Duration(seconds: 2), () => 'Hello dari p1');
}

void main(List<String> args) {
  // p3 menghasilkan Future yang didalamnya terdapat sebuah String
  var data = p3();
  print(data);
}
```

## Collection

Kumpulan data pada suatu tempat

- list
  - menyimpan data secara berbaris
  - Tiap data memiliki index

```dart
void main(List<String> args) {
  var scores = [];
  scores.add(10);
  scores.add(10);
  scores.add("kamu");
  scores.add("jika");

  print(scores[0]);

  for (var score in scores) {
    print(score);
  }
}
```

- map
  - Menyimpan data secara key-value
  - Ket berguna sebagai index selaknya list

```dart
void main(List<String> args) {
  var students = {};
  students['name'] = 'Alex Under';
  students['age'] = 16;
  print(students);

  var teacher = {'name': 'john Doe', 'age': 30};
  print(teacher);
  for (var key in teacher.keys) {
    print(teacher[key]);
  }
}
```
