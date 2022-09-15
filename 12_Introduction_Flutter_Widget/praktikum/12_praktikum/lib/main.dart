import 'dart:async';

import 'package:flutter/material.dart';

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
  final GlobalKey<FabChildState> _key = GlobalKey();
  int _counter = 0;

  void runTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter = _counter + 1;
      });
    });
  }

  @override
  void initState() {
    runTimer();
    super.initState();
  }

  void reset() {
    setState(() {
      _counter = 0;
    });
  }

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
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: reset,
        //   tooltip: 'Reset',
        //   child: const Icon(Icons.add),
        // ),
        floatingActionButton: FabChild(
          key: _key,
          reset: reset,
        ));
  }
}

class FabChild extends StatefulWidget {
  final VoidCallback reset;
  const FabChild({Key? key, required this.reset}) : super(key: key);

  @override
  FabChildState createState() => FabChildState();
}

class FabChildState extends State<FabChild> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: 'Reset Timer',
        child: const Icon(Icons.lock_clock_outlined),
        onPressed: () => widget.reset());
  }
}
