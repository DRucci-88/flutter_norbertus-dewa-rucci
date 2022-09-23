# Assets

- File yang di bundled dan di deployed bersamaan dengan aplikasi
- Tipe-tipe assets, seperti static data (JSON fiels), icons, images, dan font file (ttf)

Menggunakan Assets

- Flutter menggunakan pubspec.yaml
- Pubspec.yaml terletak pada root project, untuk mengidentifikasi asstes yang dibutuhkan aplikasi
- Gunakan karakter "/" untuk memasukan semua asstes dibawah satu directory name

## Image

- Image atau gambar akan membuat tampilan aplikasi menjadi lebih menarik
- Flutter mendukudng format gambar seperti JPEG, WebP, GIF, Animated Web/GIF, BPM, dan WBMP
- Menampilkan gambar dari project asset dan internet

### Loading Images

- Gunakan widget `Image`
- Membutuhkan properti image dengan class `AssetImage()`
- Method `Image.asset`, mendapatkan image yang sudah didalam project
- Method `Image.network`, mendapatkan data image melalui internet dengan menggunakan string url nya.

## Font

- Penggunaan font dengan style tertentu akan menjadi keunikan pada aplikasi
- Penentuan font yang mau dipakai biasanya oleh UI designer
- Penerapan font menggunakan custom font atau dari package

### Custom Font

Cara menggunakan custom font:

1. Cari dan download font ex: [https://fonts.google.com](https://fonts.google.com)
1. Import file .ttf kedalam folder fonts
1. Daftarkan font di pubspec.yaml
1. Mengatur font sebagai default
1. Gunakan font pada spesifik widget

Font dari package

1. Tambahkan package google_fonts di dependencies
1. Impoert package di file dart
1. Gunakan font dengan memanggil GoogleFonts.namaFont()

## Aplikasi Task Management
