import 'dart:io';

void main(List<String> args) {
  print('Enter Multiplier: : ');
  int? multiplier = int.parse(stdin.readLineSync()!);
  multiplication([1, 2, 3, 4], multiplier).then((value) => print(value));

  print('Baris ini di execute terlebih dahulu');
  print('Karena berjalan secara Asynchronous');
}

Future<List<int>> multiplication(List<int> data, int multiplier) {
  return Future.delayed(
      Duration(seconds: 2), () => data.map((e) => e * multiplier).toList());
}

// Paste this command on your terminal to see the result
// dart bin/praktikum1.dart
