# Flutter Layout

## Layout

- Mengatur tata letak
- Layout berbentuk widget yang mengatur widget didalamnya

## Single Child Layout

### Container

- Membuat sebuah Box
- Membungkus widget lain
- Box memiliki margin, padding, dan border

```dart
Container(
  margin: const EdgeInsets.all(10),
  padding: const EdgeInsets.all(10),
  decoration: BoxDecoration(border: Border.all()),
  child: const Text('Halo'),
);
```

### Center

- Membuat sebuah box
- Membungkus widget lain
- Memenuhi lebar dan tinggi ruang di luarnya
- Meletakkan widget berada di bagian tengah

```dart
Center(
  child: Text('Halo'),
);
```

### SizedBox

- Membuat sebuah box
- Membungkus widget lain
- Box dapat diatur lebar dan tingginya
- Lebih sederhana dari container

```dart
SizedBox(
  width: 100,
  height: 150,
  child: Text('hi')
);
```

## Multi Child Layout

### Column

- Mengatur widgets secara vertical

```dart
Column(
  children: [
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: const Text('H'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: const Text('A'),
    ),
  ],
);
```

### Row

- Mengatur widgets secara horizontal

```dart
Row(
  children: [
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: const Text('H'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: const Text('A'),
    ),
  ],
);
```

### GridView

- Mengatur widgets dalam bentuk galery

```dart
GridView.count(
  crossAxisCount: 3,
  children: [
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('L'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('O'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('L'),
    ),
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: const Text('O'),
    ),
  ],
);
```
