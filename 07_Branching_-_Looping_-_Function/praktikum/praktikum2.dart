void main(List<String> args) {
  var sco = 1;
  print('Factorial 10: ${factorial(10)}');
  print('Factorial 20: ${factorial(20)}');
  print('Factorial 30: ${factorial(30)}');
}

int factorial(int number) {
  var total = 1;
  for (var i = number; i > 0; i--) {
    total *= i;
  }
  return total;
  // return BigInt.from(total);
}

// Paste this command on your terminal to see the result
// dart bin/praktikum1.dart
