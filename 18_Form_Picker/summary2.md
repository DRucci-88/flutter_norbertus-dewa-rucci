# Advance Form Input

- Interaksi antara aplikasi dan user
- Mengumpulkan inpur dan feedback dari user

## Date Picker

- Widget dimana user bisa memasukan tanggal
- Tanggal kelahiran, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting etc.

Cara membuat Date Picker

- Menggunakan fungsi bawaan flutter `showDatePicker`
- Fungsi `showDatePicker` memiliki tipe data `Future`
- Menampilkan dialog material design date picker
- Menambahkan packages `intl` di pubspec.yaml
- Mempersiapkan variable

```dart
final selectDate = await showDatePicker(
  context: context,
  initialDate: currentDate,
  firstDate: DateTime(1990),
  lastDate: DateTime(currentDate.year + 5)
);
```

```dart
class _HomePageState extends State<HomePage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTIme.now();
}
```

Contoh kode widget

```dart
Widget buildDatePicker(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Date'),
          TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectDate != null) _dueDate = selectDate;
                });
              },
              child: const Text('Select'))
        ],
      ),
      Text(
        DateFormat('dd-MM-yyyy').format(_dueDate),
      )
    ],
  );
}
```

## Color Picker

- Widget dimana user bisa memilih color
- Penggunaan color picker bisa digunakan untuk berbagai macam kondisi

Cara membuat Color Picker

- Menambahkan packages `flutter_colorpicker` di pubspec.yaml
- Mempersiapkan variable
- Membangun UI
- Import packages `flutter_colorpicker`
- Membuat kode untuk penggunaan packages `flutter_colorpicker`

Contoh kode widget

```dart
Widget buildColorPicker(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Color'),
      const SizedBox(height: 10),
      Container(
        height: 100,
        width: double.infinity,
        color: _currentColor,
      ),
      const SizedBox(height: 10),
      Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_currentColor),
          ),
          child: const Text('Pick Color'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Pick Your Color?'),
                  content: SingleChildScrollView(
                    child: HueRingPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (Color color) => setState(() {
                        _currentColor = color;
                      }),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    )
                  ],
                );
              },
            );
          },
        ),
      )
    ],
  );
}
```

## File Picker

- Kemampuan widget untuk mengakses storage
- Memilih dan membuka file dari apps
- Menggunakan packages file_picker dan open_file
- Menambahkan packages `file_picker` dan `open_file` di pubspec.yaml
- Import kedua packages nya
- Membangun UI
- Membuat fungsi untuk mengplore dan memilih files dari storage
- Memanggil fungsi _pickFile didalam onPressed
- Membuat fungsi untuk membuka files yang telah dipilih
- Mengambil file dari object result dan memanggil fungso _openFile di dalam fungsi _pickFile

```dart
Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () => _pickFile(),
            child: const Text('Pick and Open'),
          ),
        )
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
```
