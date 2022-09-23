import 'package:flutter/material.dart';

class FirstPage1 extends StatelessWidget {
  const FirstPage1({
    Key? key,
    required this.labelText,
    required this.image,
  }) : super(key: key);

  final String labelText;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hero'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Hero(
          tag: labelText,
          // child: Icon(
          //   iconData,
          //   size: 100.0,
          //   color: iconColor,
          // ),
          child: GestureDetector(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: Image.network(image),
          ),
        ),
      ),
    );
  }
}
