import 'package:flutter/material.dart';
import 'package:flutter_provider_1/contact_item.dart';
import 'package:flutter_provider_1/contact_model.dart';
import 'package:flutter_provider_1/create_contact_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> contacts = [
    Contact('1', 'Norbertus', '0845321321'),
    Contact('2', 'Dewa', '0897565432'),
    Contact('3', 'Rucci', '0836497331'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateContactScreen(
              addCallback: (newContact) => setState(
                () => contacts.add(newContact),
              ),
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Container(color: Colors.amber[50], child: _body()),
    );
  }

  Widget _body() {
    if (contacts.isEmpty) {
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
          contact: contacts[index],
          deleteCallback: (index) => setState(
            () => contacts.removeAt(index),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 8.0),
        itemCount: contacts.length,
      );
    }
  }
}
