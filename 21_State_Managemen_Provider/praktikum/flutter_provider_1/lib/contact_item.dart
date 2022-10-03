import 'package:flutter/material.dart';
import 'package:flutter_provider_1/contact_model.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.index,
    required this.contact,
    required this.deleteCallback,
  });
  final int index;

  final Contact contact;
  final void Function(int index) deleteCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        tileColor: Colors.blue[50],
        selectedTileColor: Colors.red[400],
        hoverColor: Colors.green,
        leading: const Icon(Icons.person_pin, size: 40),
        title: Text(contact.name),
        subtitle: Text(contact.phoneNumber),
        trailing: IconButton(
            onPressed: () => deleteCallback(index),
            icon: const Icon(Icons.delete_forever, size: 32)),
      ),
    );
  }
}
