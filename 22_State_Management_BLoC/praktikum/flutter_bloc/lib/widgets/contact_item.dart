import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/contact_bloc.dart';
import '../model/contact.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
    required this.index,
    required this.contact,
  });
  final int index;

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    print(index);
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
          onPressed: () {
            context.read<ContactBloc>().add(DeleteContact(index));
          },
          icon: const Icon(Icons.delete_forever, size: 32),
        ),
      ),
    );
  }
}
