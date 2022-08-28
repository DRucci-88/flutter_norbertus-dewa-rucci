void main(List<String> args) {
  // var data = {'23': 1};
  var dataList = [
    [1, 2],
    [3, 4],
    [5, 6],
    [7, 8]
  ];
  print('List Data: $dataList');

  var dataMap = {};
  dataMap.addAll({0: dataList});
  print('Map Data: $dataMap');
}

// Paste this command on your terminal to see the result / F5
// dart bin/praktikum2.dart