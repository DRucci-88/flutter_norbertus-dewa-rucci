# (7) Branching - Looping - Function

## Pengambilan keputusan

Menentukan alur program pada kondisi tertentu

### IF

- Memerlukan nilao bool (dari operator logical atau comparison)
- Menjalankan bagian proses jika nilao bool bernilai true

```dart
void main() {
  var usia = 18
  if (usia < 20) {
    print('Remaja');
  }
}
```

### If-Else

- Berjalan dengan id
- Menambahkan altenative jika nilai bool adalah false
- Menambah pengujian nilai bool lain

```dart
void main() {
  var usia = 18;
  if (usia < 20) {
    print('Remaja');
  } else {
    print('Tidak memiliki golongan');
  }
}
```

## Perulangan

Menjalankan proses berulang kali

### For

- Diketahui berapa kali perulangan terjadi
- Memerlukan nilai awal
- Memerlukan nilai bool, jika true perulangan dilanjutkan
- Memerlukan pengubah nilai

```dart
void main() {
  for (var i = 0;i < 10; i+= 1){
    print(i);
  }
}
```

### While

- Tidak diketahui berapa kali perulangan terjadi
- Memerlukan nilai bool, jika true maka perulangan dilanjutkan

```dart
void main() {
  var i = 0;
  while(i < 10) {
    print(i);
    i++;
  }
}
```

### Do-While

- Mengubah bentuk while
- Proses dijalankan minimum sekali, akan diteruskan jika nilai bool adalah true

```dart
void main() {
  var i = 0;
  do {
    print(i);
    i++;
  } while(i < 10);
}
```

## Break and Continue

Cara lain mengentikan perulangan

- Perulangan menggunakan nilai bool untuk lanjut atau berhenti
- Break and continue dapat menghentikan perulangan dengan mengabaikan nilai bool
- Continue dapat menghentikan satu kali proses

Perbedaan

- Break = menghentikan seluruh proses perulangan

```dart
void main() {
  for(var i = 0; true; i++){
    if (i == 10){   // Akan berhenti ketika perulangan sampe 10
      break;
    }
    print(i);
  }
}
```

- Contine = menghentikan satu kali proses perulangan

```dart
void main() {
  for(var i = 0; i < 10; i++){
    if (i % 2 == 1){  // Melewati perulangan ketika bilangan ganjil
      continue;
    }
    print(i);
  }
}
```

## Fungsi

Kumpulan kode yang dapat digunakan berulang kali

- Kumpulan perintah
- Dapat digunakan berkali-kali
- Cukup mengubah fungsi sekali, penggunaan lainnya akan ikut berubah

```dart
void main() {
  // Memanggil fungsi
  halo();
  tampil('Top G');
  int result = jumlah(3,5);
}

// Membuat fungsi
void halo(){
  print('Halo');
}

// Fungi dengan parameter
void tampil(String teks){
  print(teks);
}

// Fungsi dengan Return
int jumlah(int a, int b){
  return a + b;
}
```
