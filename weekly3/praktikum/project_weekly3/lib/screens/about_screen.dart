import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static const routeName = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: Container(
        height: 240,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pepatah-kakek-kura-kura.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
        alignment: Alignment.topCenter,
        child: const Text(
          '"There is No Secret Ingredients"',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}
