import 'package:flutter/material.dart';
import 'package:flutter_navigation/models/contact_model.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen(
      {super.key, required this.contacts, required this.deleteContact});
  final List<ContactModel> contacts;
  final Function(int index) deleteContact;

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: ((context, index) {
          return Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[700],
                radius: 24,
                child: Text(
                  widget.contacts[index].name[0],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.contacts[index].name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.contacts[index].phoneNumber),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.deleteContact(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1, milliseconds: 500),
                      content: Text(
                          'Contact ${widget.contacts[index].name} Deleted'),
                      action: SnackBarAction(label: 'Close', onPressed: () {}),
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              )
            ],
          );
        }),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: widget.contacts.length,
      ),
    );
  }
}
