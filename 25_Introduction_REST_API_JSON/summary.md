# REST API Client

## REST API

REST API (Representational State Transfer Application Programming Interface)

- Arsitektural yang memisahkan tampilan dengan proses bisnis
- Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request

## HTTP

Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web

### Pola Komunikasi

- Client mengirim request ke server
- Server mengolah dan membalas dengan memberi response yang nantinya akan ditampilkan

### Struktur Request

- `URL` Alamat halaman yang akan diakses
- `Method (GET, POST, PUT, DELETE)` menunjukan aksi yang diinginkan
- `Header` Informasi tambahan terkait request yang dikirimkan
- `Body` Data yang disertakan bersama request

### Struktur Reponse

- `Status Code` Kode yang mewakili keseluruhan response baik sukses maupun gagal
- `Header` Informasi tambahan terkait response yang diberikan
- `Body` Data yang disertakan bersama response

## Dio

- Sebagai HTTP Client
- Dimanfaatkan untuk melakukan REST API

`flutter pub add dio`

```dart
import 'package:dio/dio.dart';

Dio()
  .get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts')
  .then((res) => print(res));  
```

## JSON

JSON (Javascript Object Notation)

Serialisasi JSON = Mengubah struktur data ke bentuk JSON

Map/List -> Serialisasi -> JSON

Deserialisasi JSON = Mengubah bentuk JSON ke struktur data

JSON -> Deserialisasi -> Map/List

```dart
import 'dart:convert';

void main(List<String> args) {
  const String url =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts';

  Dio().get(url).then((res) => print(res));

  var dataMap = {
    "name": "John Thor",
    "phone": 0123456,
  };
  var dataJSON = jsonEncode(dataMap);
  print(dataJSON);

  var dataJSON1 = '{"name":"John Thor","phone":123456}';
  var dataMap1 = jsonDecode(dataJSON1);
  print(dataMap1);
}
```
