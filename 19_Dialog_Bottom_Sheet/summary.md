# Dialog and Bottom Sheet

## Aplikasi Task Management

Menambahkan dan menghapus kegiatan

Real Example:

1. Membuat model untuk informasi yang mau disimpan, buat folder models dan di dalam nya buat file dart baru `task_model.dart`
1. Membuat Task Screen, buat folder screens didalam nya buat file dart baru `task_screen.dart`
1. Membuat Empty screen, buat file dart baru `empty_task_screen.dart` di folder screens
1. Tambahkan package provider di pubspec.yaml
1. Membuat Task Manager, buat file dart baru `task_manager.dart` didalam folder models. Tambahkan method deleteTask dan addTask
1. `main.dart` menambahkan TaskManager sebagai Provider
1. `task_screen.dart` membuat fungsi buildTaskScreen, akan return Task Screen yang ada data nya atau yang kosong akan dipanggil fungsi nya di body
1. Membuat Task Item Screen, buat file dart baru `task_item_screen.dart` di dalam folder screens dan tambahkan properti onCreate
1. `task_screen.dart` buat FloatingActionButton, untuk navigasi ke TaskItemScreen
1. `task_item_screen.dart` menambahkan state propertu, initState dan dispose
1. `taask_item_screen.dart` membuat buildNameField dan panggil fungsi nya di dalam ListView
1. `task_item_screen.dart` membuat buildButton dan panggil fungsi nya didalam ListView
1. Membuat Task Item Card, buat folder baru components lalu didalam nya buat file dart baru `task_item_card.dart`
1. `task_item_screen.dart` menambahkan call back handler di ElevatedButton pada buildButton, dan menambahkan package uuid
1. Membuat Task List Screen, dalam folder screens buat file dart baru `task_list_screen.dart` dan tambahkan di buildTaskScreen `task_screen.dart`
1.`task_list_screen.dart` menambahkan properti yang dibutuhkan pada TaskItemCard untuk melihat task yang sudah dibuat
1. `task_list_screen.dart` menambahkan properti yang dibutuhkan pada TaskItemCard untuk melihat task yang sudah dibuat

## AlertDialog

- Untuk menampilkan android dari Material Design
- Menginformasikan pengguna tentang situasi tertentu
- Bisa digunakan untuk mendapatkan input dari user
- Membutuhkan helper method showDialog

Lanjutan dari tutorial sebelumnya

1. `task_item_card.dart` menambahkan Alert Dialog
1. Memanggil fungsi showDialog di dalam fungsi onPressed pada IconButton
1. showDialog membutuhkan context dan builder
1. Di builder akan return AlertDialog

Cara Membuat Alert Dialog

1. AlertDialog menyediakan properti seperti content dan actions
1. Content bisa dimasukan widget text, gambar dan animasi gambar
1. Actions bisa ditambahkan button untuk menerima respon dari user
1. `task_item_card.dart` membuat properti onPressed
1. `task_list_screen.dart` menambahkan fungsi onPressed pada TaskItemCard, pada body fungsi nya tambahkan method deleteTask, Navigator.pop(context), dan ScaffoldMessager

## Bottom Sheet

- Seperti dialog tetapi muncul dari bawah layar aplikasi
- Menggunakan fungsi bawaan flutter showModalBottomSheet
- Membutuhkan dua properti, yaitu Context dan builder

Cara Membuat Bottom Sheet

1. `task_screen.dart` membuat Bottom Sheet
1. buat file dart baru `profile_sheet.dart` didalam folder components dan buat konten-kontennya
1. `task_screen.dart` mengganti Container pada builder showModalBottomSheet menjadi ProfileSheet()
