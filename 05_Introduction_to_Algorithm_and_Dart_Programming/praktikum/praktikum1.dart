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
