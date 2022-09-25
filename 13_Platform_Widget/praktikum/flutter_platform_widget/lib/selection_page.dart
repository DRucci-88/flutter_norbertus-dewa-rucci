import 'package:flutter/material.dart';
import 'cupertino_page/cupertino_page_view.dart';
import 'material_page/material_page_view.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<StatefulWidget> createState() => SelectionPageState();
}

class SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selection Page',
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        _gridItem(0, "Material", Icons.android, Colors.green),
        _gridItem(1, "Cupertino", Icons.apple, Colors.black),
      ],
    );
  }

  Widget _gridItem(int id, String labelText, IconData icons, Color iconColor) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Material(
        color: Colors.white,
        shadowColor: Colors.tealAccent,
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15.0,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          splashColor: Colors.grey,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icons,
                  size: 100.0,
                  color: iconColor,
                ),
                Text(
                  labelText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )
              ],
            ),
          ),
          onTap: () {
            if (id == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MaterialPageView()));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CupertinoPageView()));
            }
          },
        ),
      ),
    );
  }
}
