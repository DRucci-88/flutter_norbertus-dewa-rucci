import 'package:flutter/material.dart';

class GaleryBottomSheet extends StatelessWidget {
  final String imageUrl;
  const GaleryBottomSheet({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUrl),
        ),
      ),
      // child: Image.asset(imageUrl),
    );
  }
}
