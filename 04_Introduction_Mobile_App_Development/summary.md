# (04) Introduction Mobile App Development

## Pengertian Software

Software adalah perangkat lunak yang tersimpan dan dikendalikan oleh komputer, berisi perintah-perintah.

## Jenis Software

- Web
  - Diakses menggunakan web browser
  - Memerlukan koneksi internet

- Desktop
  - Berjalan pada deskrip
  - Perlu langkah instalasi
  - Dapat dibuka tanpa memelurkan internet

- Mobile
  - Berjalan pada perangkat mobile
  - Lperlu langkah instalasi melalui store penyedia aplikasi.
  - Dapat dibuka tanpa memerlukan internet

## Pengembangan Software

Bahasa pemrograman adalah rangkaian teks yang digunakan untuk memberi perintah pada kepada komputer. Banyak sekali bahasa pemrograman yang tersedia di internet, dikarenakan disesuaikan dengan kebutuhan pada kehidupan nyata.

Source code yang ditulis developer perlu diterjemahkan kedalam bahasa mesin. Ada dua teknik yakni:

- Compiler
  - Software yang digunakan untuk membaca perintah-perintah dalam bahasa pemrograman dan dan mengubahnya kedalam bahasa yang dikenali oleh mesin.
  - Bahasa Pemrograman -> Compiler -> Machine code -> Output

- Interpreter
  - Software yang digunakan untuk membaca perintah-perintah dalam bahasa pemrograman dan menjalankan langsung perintah-perintah tersebut.
  - Bahasa pemrograman -> interpreter -> output

Jika interpreter lebih ringkas, kenapa compiler masih populer ?

<h2 align='center'>Compiler VS Intrepeter</h2>

| Compiler | Interpreter |
|--|--|
| Mengubah kode menjadi file yang dapat dijalankan | Membaca kode tanpa mengubah ke bentuk lain |
| Prosesnya lebih panjang | Prosesnya lebih singkat |
| Program dapat dijalankan dengan cepat karena tidak membaca ulanh kode | Seringkali lebih lambat karena harus membaca ulang keseluruhan kode |

## Mobile App Development

Jenis-jenis perangkat mobile:

- iOS
  - Dikembangkan oleh Apple
  - Bahasa pemrograman native: Swift dan Objective-C

- Android
  - Berkembang secara luas karena open source
  - Bahasa pemrograman native: Kotlin dan Java

Tahapan Flutter sebagai Cross Platform

1. Bahasa Pemrograman (Dart + Flutter) singel code base
2. Compiler (Android / iOs) SDK, Dart Virtual Machine
3. Machine code (.apk / .ipa)
4. Output
