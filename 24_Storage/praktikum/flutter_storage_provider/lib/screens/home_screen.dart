import 'package:flutter/material.dart';
import 'package:flutter_storage_provider/screens/register_screen.dart';
import 'package:flutter_storage_provider/screens/register_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RegisterViewModel registerViewModel;
  @override
  void initState() {
    registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);
    registerViewModel.checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<RegisterViewModel>(
          builder: (context, value, child) {
            return ListView(
              children: [
                Text('Hello ${registerViewModel.user?.name}'),
                Text('${registerViewModel.user?.email}'),
                ElevatedButton(
                  onPressed: () {
                    registerViewModel.logout();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text('Log Out'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
