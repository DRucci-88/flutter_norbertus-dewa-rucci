import 'package:flutter/material.dart';
import 'package:flutter_assets/simple_hero/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Flutter Simple Hero"),
        backgroundColor: Colors.blueAccent,
      ),
      body: _gridHome(),
    );
  }

  Widget _gridHome() {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        _gridItem(0, "First Item", 'https://picsum.photos/id/0/400'),
        _gridItem(1, "Second Item", 'https://picsum.photos/id/2/400'),
        _gridItem(2, "Third Item", 'https://picsum.photos/id/4/400'),
        _gridItem(3, "Fourth Item", 'https://picsum.photos/id/5/400'),
        _gridItem(4, "Fifth Item", 'https://picsum.photos/id/7/400'),
        _gridItem(5, "Sixtth Item", 'https://picsum.photos/id/8/400'),
        _gridItem(6, "Seventh Item", 'https://picsum.photos/id/3/400'),
      ],
    );
  }

  Widget _gridItem(int id, String labelText, String image) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Material(
        color: Colors.white,
        shadowColor: Colors.tealAccent,
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 15.0,
        // child: InkWell(
        //   customBorder: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(25),
        //   ),
        //   borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        //   splashColor: Colors.teal,
        //   child: Align(
        //     alignment: Alignment.center,
        //     child: Hero(
        //       tag: labelText,
        //       // child: Icon(
        //       //   icons,
        //       //   size: 100.0,
        //       //   color: iconColor,
        //       // ),
        //       child: SizedBox(
        //         width: MediaQuery.of(context).size.width,
        //         child: Image.network('https://picsum.photos/300'),
        //       ),
        //     ),
        //   ),
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         PageRouteBuilder(
        //             transitionDuration: const Duration(seconds: 1),
        //             pageBuilder: (_, __, ___) => FirstPage1(
        //                   labelText: labelText,
        //                   image: image,
        //                 )));
        //   },
        // ),

        child: Stack(children: <Widget>[
          Positioned.fill(
            child: Hero(
              tag: labelText,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned.fill(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              splashColor: Colors.teal,
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 1),
                    pageBuilder: (_, __, ___) =>
                        FirstPage1(labelText: labelText, image: image),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
