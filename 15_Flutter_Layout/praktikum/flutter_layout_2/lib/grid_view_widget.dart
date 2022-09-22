import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      Icons.abc,
      Icons.ac_unit,
      Icons.percent,
      Icons.zoom_out,
      Icons.padding,
      Icons.search,
      Icons.set_meal,
      Icons.read_more,
      Icons.javascript,
      Icons.kayaking,
      Icons.kebab_dining,
      Icons.kebab_dining,
      Icons.abc_rounded,
      Icons.label,
      Icons.keyboard,
      Icons.join_full,
      Icons.face,
      Icons.ios_share,
      Icons.mobile_friendly,
      Icons.dangerous,
      Icons.abc,
      Icons.ac_unit,
      Icons.percent,
      Icons.zoom_out,
      Icons.padding,
      Icons.search,
      Icons.set_meal,
    ];

    return Scaffold(
        appBar: AppBar(title: const Text('Grid View')),
        body: GridView.count(
          crossAxisCount: 4,
          children: [
            for (IconData icon in icons)
              Container(
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(10),
                // decoration: BoxDecoration(border: Border.all()),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: const [
                    BoxShadow(color: Colors.blue, spreadRadius: 0)
                  ],
                ),
                child: Icon(icon),
              ),
          ],
        ));
  }
}
