# Basic Layouting

## Row dan Column

- Row meletakaan widget children secara horizontal
- Column meleteakan widget children secara vertical

Berikut merupakan beberapa property yang dimiliki Row and Column:

### MainAxisSize

- Menentukan seberapa banyak space menempati main axis
- Main axis dari Row adalah horizontal
- Main axis dari Column adalah vertical
- Property mainAxisSize memiliki dua values yakni `MainAxisSize.max` dan `MainAxisSize.min`
- `MainAxisSize.max` menempati semua space dari main axis
- `MainAxisSize.min` tidak memiliki extra space, hanya untuk children nya saja

### MainAxisAlignment Property

Memposisikan children mereka di extra space yang ada

Memiliki 6 values

- MainAxisAlignment.start
- MainAxisAlignment.end
- MainAxisAlignment.center
- MainAxisAlignment.spaceBetween
- MainAxisAlignment.spaceEvenly
- MainAxisAlignment.spaceAround

### CrossAxisAligment Property

Memposisikan children mereka pada cross axis

Cross Axis dari Row adalah vertikal dan Cross Axis dari Column adalah horizontal

Memiliki 5 values

- CrossAxisAlignment.start
- CrossAxisAlignment.end
- CrossAxisAlignment.center
- CrossAxisAlignment.stretch
- CrossAxisAlignment.baseline

## Flexible Widget

- Membungkus widget lain sehingga child dari Flexible widget menjadi flexible atau resizable
- Sangat berguna untuk membuat aplikasi yang responsif
- Harus berada dalam turunan parent widget Row atau Column
- Perubahan ukuran ditentukan dengan properti fit dan flex

### Fit Property

- Menentukan apakah flexible widget memenuhi extra space yang tersedia di main axis nya
- Menerima nilai values berupa FlexFit.loose atau FlexFit.tight
- FlexFit.loose akan memiliki ukuran minimum
- FlexFit.tight akan memiliki ukuran maximum

### Flex Property

- Menentukan perbandingan ukuran dari child widget nya
- Menerima nilai values berupa integer
- Membandingkan nilai nya dengan flex properti lain

## Expanded Widget

- Membungkus widget lain sehingga ukuran dari child Expanded widget akan dipaksa untuk memenuhi ruang yang tersedia
- Sangat berguna untuk membuat aplikasi yang responsif
- Harus berada dalam turunan parent widge Row atau Column
- Memiliki default value FlexFit.tight
- Perubahan ukuran ditentukan dengan properti flex

## Demo App
