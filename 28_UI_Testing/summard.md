# UI Testing

## Pengertian UI Testing

Tahapan yang penting, dapat menemukan bug atau masalah yang terjadi pada aplikasi.

Pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberikan respon kepada pengguna.

UI Testing di Flutter = Widget Testing, sehingga pengujian dilakukan pada widgets menuliskan script yang dapat dijalankan secara otomatis.

### Keuntungan UI Testing

- Memastikan seluruh widget memberi tampilan yang sesuai
- Memastikan seluruh interaksi dapat diterima dengan baik
- Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

## Melakukan UI Testing

By default library sudah terinstall

### Penulisan Script Testing

- Dilakukan pada folder `test`
- Nama file harus diikuti suffix `_test.dart`, cth: `contact_test.dart`
- Tiap file berisi fungsi `main()` yang didalamnya dapat dituliskan script testing
- Tiap skenario pengujian disebut `test case`

```dart
testWidgets('Judul halaman harus ...', (WidgetTester tester) async {

});
testWidgets('Tombol harus ...', (WidgetTester tester) async {

});
```

### Script Testing

1 Test case diawali dengan `testWidgets` dan diberi judul
2 Simulasi prses mengaktifkan halaman AboutScree
3 Memeriksa apakah di halaman tersebut terdapat teks "About Screen"

```dart
// 1
testWidgets('Judul halaman harus About Screen', (WidgetTester tester) async {
  //2
  await tester.pumpWidget(
    const MaterialApp(
      home: AboutScreen(),
    ),
  );

  // 3
  except(find.text('About Screen'), findOneWidget);
});
```

### Menjalankan Testing

- Perintah `flutter test` akan menjalanakan seluruh file test yang dibuat
- Hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan, dan pesan bahwa pengujian berhasil
