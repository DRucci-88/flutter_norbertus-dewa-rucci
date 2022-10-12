import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/user_bloc.dart';
import 'package:flutter_bloc_1/screens/home_page.dart';

class EnterUsernameScreen extends StatefulWidget {
  const EnterUsernameScreen({super.key});

  @override
  State<EnterUsernameScreen> createState() => _EnterUsernameScreenState();
}

class _EnterUsernameScreenState extends State<EnterUsernameScreen> {
  final _usernameCtl = TextEditingController();
  @override
  void dispose() {
    _usernameCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Wannabe')),
      body: Container(
        height: double.infinity,
        color: Colors.amber[50],
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameCtl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Username",
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                print(_usernameCtl.text);
                if (_usernameCtl.text.isNotEmpty) {
                  context.read<UserBloc>().add(AddUser(_usernameCtl.text));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false);
                }
              },
              child: const Text('Save Username'),
            )
          ],
        ),
      ),
    );
  }
}
