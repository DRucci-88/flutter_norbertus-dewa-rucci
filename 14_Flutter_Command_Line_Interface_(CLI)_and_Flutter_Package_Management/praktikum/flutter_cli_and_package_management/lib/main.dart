import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Chip(
              padding: EdgeInsets.all(5.0),
              backgroundColor: Colors.deepPurple,
              label: Text('BADGE', style: TextStyle(color: Colors.white)),
            ),
            const Chip(
              padding: EdgeInsets.all(0),
              backgroundColor: Colors.deepPurple,
              label: Text('BADGE', style: TextStyle(color: Colors.white)),
            ),
            BarcodeWidget(
              barcode: Barcode.code128(),
              data: 'Alterra Academy',
              width: 300,
            ),
            BarcodeWidget(
              barcode: Barcode.code128(),
              data: 'Flutter Asik',
              width: 300,
            ),
            BarcodeWidget(
              barcode: Barcode.code128(),
              data: 'Norbertus Dewa Rucci',
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
