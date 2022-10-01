import 'package:flutter/material.dart';
import 'package:flutter_dialog_bottom_sheet/galery_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galery Dialog Bottom Sheet'),
      ),
      body: Container(
        color: Colors.amber[50],
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return buildImageView(context);
          },
        ),
      ),
    );
  }

  Widget buildImageView(context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/kucing.jpg'),
        ),
        Positioned(
          top: 6,
          right: 0,
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                context: context,
                builder: (context) => const GaleryBottomSheet(
                  imageUrl: 'assets/kucing.jpg',
                ),
              );
            },
            icon: const Icon(Icons.info),
            color: Colors.white,
            iconSize: 32,
          ),
        ),
        Positioned(
          // right: 0,
          top: 6,
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: SingleChildScrollView(
                    child: Image.asset('assets/kucing.jpg'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Done'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.add_alert),
            color: Colors.white,
            iconSize: 32,
          ),
        ),
      ],
    );
  }
}
