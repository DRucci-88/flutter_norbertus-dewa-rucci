import 'dart:io';

void main(List<String> args) {
  print('Enter Value: ');
  int? score = int.parse(stdin.readLineSync()!);
  print(grade(score));
}

String grade(int score) {
  if (score > 70) {
    return 'A';
  } else if (score > 40) {
    return 'B';
  } else if (score > 0) {
    return 'C';
  } else {
    return '';
  }
}

// Paste this command on your terminal to see the result
// dart bin/praktikum1.dart
