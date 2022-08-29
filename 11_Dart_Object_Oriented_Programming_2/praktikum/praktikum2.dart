class Matematika {
  int hasil() => 0;
}

class KelipatanPersekutuanTerkecil implements Matematika {
  late int x, y;
  KelipatanPersekutuanTerkecil(this.x, this.y);
  @override
  int hasil() {
    int a, b, c = x * y;
    for (var i = 1; i <= c; i++) {
      a = i % x;
      b = i % y;
      if (a == 0 && b == 0) return i; // Hasil KPK
    }
    return 1;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  late int x, y;
  FaktorPersekutuanTerbesar(this.x, this.y);
  @override
  int hasil() {
    int a, b, fpb = 1;
    for (int i = 1; i <= x; i++) {
      a = x % i;
      b = y % i;

      if (a == b && b == 0) fpb = i; // Hasil FPB
    }
    return fpb;
  }
}

void main(List<String> args) {
  KelipatanPersekutuanTerkecil kpk1 = KelipatanPersekutuanTerkecil(3, 4);
  print('KPK dari 3 dan 4 =  ${kpk1.hasil()}');

  KelipatanPersekutuanTerkecil kpk2 = KelipatanPersekutuanTerkecil(5, 9);
  print('KPK dari 5 dan 9 =  ${kpk2.hasil()}');

  FaktorPersekutuanTerbesar fpb1 = FaktorPersekutuanTerbesar(12, 24);
  print('FPB dari 12 dan 24 = ${fpb1.hasil()}');

  FaktorPersekutuanTerbesar fpb2 = FaktorPersekutuanTerbesar(8, 18);
  print('FPB dari 8 dan 18 = ${fpb2.hasil()}');
}
