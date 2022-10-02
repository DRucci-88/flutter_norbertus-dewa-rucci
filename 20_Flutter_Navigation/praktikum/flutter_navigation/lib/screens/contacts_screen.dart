import 'package:flutter/material.dart';
import 'package:flutter_navigation/models/contact_manager.dart';
import 'package:flutter_navigation/screens/add_contact_screen.dart';
import 'package:flutter_navigation/screens/empty_contact_screen.dart';
import 'package:flutter_navigation/screens/contact_list_screen.dart';
import 'package:provider/provider.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddContactScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<ContactManager>(
        builder: (context, manager, child) {
          if (manager.contactModels.isEmpty) {
            return const EmptyContactScreen();
          }
          return ContactListScreen(
            contacts: manager.contactModels,
            deleteContact: (index) => manager.deleteContact(index),
          );
        },
      ),
    );
  }
}
