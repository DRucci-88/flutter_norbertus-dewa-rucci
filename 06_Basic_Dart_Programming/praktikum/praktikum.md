# Soal Latihan Fundamental Mobile Developer 2

Norbertus Dewa Rucci - Kelas A

## Implementasi rumus luas lingkaran pada program Dart

```dart
import 'dart:io';

const double pi = 3.1415926535897932;

void main(List<String> args) {
  print('Enter radius: ');

  int? radius = int.parse(stdin.readLineSync()!);

  double area = pi * radius * radius;

  print(area);
}

// Paste this command on your terminal to see the result
// dart bin/praktikum1.dart
```

<!-- ![Output 1](../screenshots/praktikum1.jpg) -->
![praktikum1](https://user-images.githubusercontent.com/60127414/187014392-68f4d1d5-72df-41c2-8c8d-87660d1e89d8.jpg)


## Buatlah 3 buah variabel yang berisi string, lalu sambungkan seluruh string tersebut, dan tampilkan pada layar!

```dart
void main(List<String> args) {
  const String firstName = 'Norbertus';
  const String middleName = 'Dewa';
  const String lastName = 'Rucci';

  print('$firstName $middleName $lastName');
}

// Paste this command on your terminal to see the result / F5
// dart bin/praktikum2.dart
```

<!-- ![Output 1](../screenshots//praktikum2.jpg) -->
![praktikum2](https://user-images.githubusercontent.com/60127414/187014435-2be46a5f-2b37-4bd9-944d-10a81047f6a3.jpg)
