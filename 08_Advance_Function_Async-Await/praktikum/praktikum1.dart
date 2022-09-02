import 'dart:io';

void main(List<String> args) async {
  print('Enter Multiplier: : ');
  int? multiplier = int.parse(stdin.readLineSync()!);

  multiplication([1, 2, 3, 4], multiplier).then((value) => print(value));

  // try {
  //   var datas = await multiplication([1, 2, 3, 4], 2);
  //   print(datas);
  // } catch (e) {}

  print('Baris ini di execute terlebih dahulu');
  print('Karena berjalan secara Asynchronous');
}

Future<List<int>> multiplication(List<int> data, int multiplier) {
  return Future.delayed(
      Duration(seconds: 2), () => data.map((e) => e * multiplier).toList());
}

// Paste this command on your terminal to see the result
// dart bin/praktikum1.dart
