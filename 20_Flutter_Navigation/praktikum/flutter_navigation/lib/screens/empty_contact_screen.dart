import 'package:flutter/material.dart';

class EmptyContactScreen extends StatelessWidget {
  const EmptyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      child: Column(
        children: <Widget>[
          Image.asset('assets/POWER.jpg'),
          const Text(
            'There is no Contact here !',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
