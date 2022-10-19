import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_weekly2/about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _messageCtl = TextEditingController();

  @override
  void dispose() {
    _usernameCtl.dispose();
    _emailCtl.dispose();
    _messageCtl.dispose();
    super.dispose();
  }

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
      drawer: _buildDrawer(),
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

          _buildForm(),
          const SizedBox(height: 200),
        ]),
      ),
    );
  }

  Widget _buildDrawer() {
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
            onTap: () {},
          ),
          ListTile(
            title: const Text('About Me'),
            onTap: () => Navigator.pushNamed(context, AboutScreen.routeName),
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: _usernameCtl,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) => (value!.isEmpty) ? 'Enter username' : null,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailCtl,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) => (value!.isEmpty) ? 'Enter email' : null,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _messageCtl,
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
              validator: (value) => (value!.isEmpty) ? 'Enter message' : null,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _formKey.currentState!.validate()
                  ? showDialog<void>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Value Submit Form'),
                          content: Text(
                              'Username: ${_usernameCtl.text} \nEmail: ${_emailCtl.text} \nMessage: ${_messageCtl.text}'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    )
                  : null,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(42)),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
