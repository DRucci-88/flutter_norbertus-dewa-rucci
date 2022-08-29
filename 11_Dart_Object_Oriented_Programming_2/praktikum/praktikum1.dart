import 'dart:math';

abstract class BangunRuang {
  late double panjang, lebar, tinggi;
  BangunRuang({this.panjang = 0.0, this.lebar = 0.0, this.tinggi = 0.0});
  double volume() => panjang * lebar * tinggi;
}

class Kubus extends BangunRuang {
  late double sisi;
  // Kubus(this.sisi) : super(lebar: 2, panjang: 3, tinggi: 10);
  // Kubus() : super(0.0, 0.0, 0.0);
  Kubus(this.sisi);
  @override
  double volume() => pow(sisi, 3).toDouble();
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi) {
    super.panjang = panjang;
    super.lebar = lebar;
    super.tinggi = tinggi;
  }
}

void main(List<String> args) {
  Kubus k1 = Kubus(10.6);
  Kubus k2 = Kubus(13.7);

  Balok b1 = Balok(13.3, 12.9, 9.7);
  Balok b2 = Balok(9.3, 7.4, 3.5);

  print('Kubus 1 dg sisi ${k1.sisi} memiliki volume ${k1.volume()}');
  print('Kubus 1 dg sisi ${k2.sisi} memiliki volume ${k2.volume()}');

  print(
      'Balok dengan p ${b1.panjang}, l ${b1.lebar}, t ${b1.tinggi} memiliki volume ${b1.volume()}');
  print(
      'Balok dengan p ${b2.panjang}, l ${b2.lebar}, t ${b2.tinggi} memiliki volume ${b2.volume()}');
}
