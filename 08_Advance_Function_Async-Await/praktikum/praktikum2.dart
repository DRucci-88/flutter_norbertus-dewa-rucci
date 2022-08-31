void main(List<String> args) {
  List<List<int>> dataList = [
    [1, 2],
    [3, 4],
    [5, 6],
    [7, 8],
    [9, 10]
  ];
  print('List Data: $dataList');

  Map<int, int> dataMap = {};
  dataList.forEach((e) => dataMap.addAll({e[0]: e[1]}));
  print('Map Data: $dataMap');
  dataMap.forEach((key, value) => print('$key: $value'));
}

// Paste this command on your terminal to see the result / F5
// dart bin/praktikum2.dart