import 'package:flutter/material.dart';
import 'package:flutter_provider_2/contact_item.dart';
import 'package:flutter_provider_2/contact_manager.dart';
import 'package:flutter_provider_2/create_contact_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final contactManager = Provider.of<ContactManager>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return CreateContactScreen(
                addCallback: (newContact) =>
                    contactManager.addContact(newContact),
              );
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 1.0);
              return ScaleTransition(
                scale: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Container(color: Colors.amber[50], child: _body(contactManager)),
    );
  }

  Widget _body(ContactManager contactManager) {
    return Consumer<ContactManager>(
      builder: (context, value, child) {
        if (contactManager.contacts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('There is no Data here'),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.person_add_disabled),
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) => ContactItem(
              index: index,
              contact: contactManager.contacts[index],
              deleteCallback: (index) => contactManager.deleteContact(index),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 8.0),
            itemCount: contactManager.contacts.length,
          );
        }
      },
    );
  }
}
