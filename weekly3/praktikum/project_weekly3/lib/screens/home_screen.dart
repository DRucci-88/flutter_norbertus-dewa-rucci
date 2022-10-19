import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_weekly3/screens/about_screen.dart';
import 'package:project_weekly3/screens/contact_us_screen.dart';
import 'package:project_weekly3/screens/data_user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 56,
        title: const Text('Welcome'),
        actions: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
            ),
            child: Lottie.asset('assets/welcome-screen-animation.json'),
          )
        ],
      ),
      drawer: _buildDrawer(context),
      body: Container(
        color: Colors.amber[50],
        child: ListView(children: [
          // Lottie.asset('assets/sticker-welcome.json', height: 256.0),
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.amber[200],
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/rindu.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(4.0),
                    child: const Text(
                      'Rindu tak bertuan \nSungguh malang nasib si puan \nBerjuang sendirian melawan duri kerinduan \n\nRindu tak bertuan \nMati-matian hanya untuk mencipta pertemuan \nTak jarang yang dapat hanya kepasrahan \n\nNamun sang Tuan tak pernah merasakan perihnya perjuangan',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Lottie.asset('assets/raining.json', height: 100.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 200),
        ]),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.grey),
            accountName: const Text('Name of the Person Sad'),
            accountEmail: const Text('Sad OG Boi'),
            currentAccountPicture:
                Lottie.asset('assets/sticker-welcome.json', height: 156.0),
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () =>
                Navigator.pushNamed(context, ContactUsScreen.routeName),
          ),
          ListTile(
            title: const Text('About Me'),
            onTap: () => Navigator.pushNamed(context, AboutScreen.routeName),
          ),
          ListTile(
            title: const Text('Data User'),
            onTap: () => Navigator.pushNamed(context, DataUserScreen.routeName),
          ),
        ],
      ),
    );
  }
}
