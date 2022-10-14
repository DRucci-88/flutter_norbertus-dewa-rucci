# Flutter Animation

## Animation

- Animasi membuat aplikasi terlihat hidup
- Widget yang bergerak menambah daya tarik
- Pergerakan dari kondisi A ke kondisi B

## Implicit Animation

Versi animasi dari widget yang sudah ada

## Transition

- Animasi yang terjadi saat perpindahan halaman
- Dilakukan pada bagian `Navigator.push()`

## Transition Umum

Beberapa transisi yang umum digunakan pada aplikasi

### Fade Transition

Halaman muncul dengan efek redup menuju ke tampak jelas secara penuh

```dart
final tween = Tween(begin: 0.0, end: 1.0);
return FadeTransition(
  opacity: animatio.drive(tween),
  child: child
);
```

### Scale Transition

Halaman muncul dengan efek berubah ukuran dari tidak penuh menuju tampil keseluruhan

```dart
final tween = Tween(begin: 0.0, end: 1.0);
return ScaleTransition(
  scale: animation.drive(tween),
  child: child
);
```
