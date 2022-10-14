import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double percentage = 0.7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: InkWell(
          onTap: () => setState(() => percentage = (percentage == 1 ? 0.7 : 1)),
          child: AnimatedContainer(
            width: MediaQuery.of(context).size.width * percentage,
            duration: const Duration(seconds: 1),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/POWER1.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
