class Hewan {
  double berat;

  Hewan(this.berat);
}

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(Hewan newHewan) {
    if (totalMuatan() <= kapasitas) {
      muatan.add(newHewan);
      print('Hewan dg berat ${newHewan.berat} masuk ke mobile');
    } else {
      print('Kapasitas mobil terlalu penuh, tidak bisa menambah hewan lagi');
    }
  }

  double totalMuatan() =>
      muatan.fold(0.0, (sum, element) => sum + element.berat);
}

void main(List<String> args) {
  Mobil pajero = Mobil(2100.85);
  Hewan sapi = Hewan(1065.5);
  Hewan kerbau1 = Hewan(500.75);
  Hewan kerbau2 = Hewan(470.91);
  Hewan kambing1 = Hewan(70.9);
  Hewan kambing2 = Hewan(100.6);
  Hewan kambing3 = Hewan(120.89);

  pajero.tambahMuatan(sapi);
  pajero.tambahMuatan(kerbau1);
  pajero.tambahMuatan(kerbau2);
  pajero.tambahMuatan(kambing1);
  pajero.tambahMuatan(kambing2);
  pajero.tambahMuatan(kambing3);
}
