import 'package:flutter/material.dart';
import 'package:flutter_navigation/models/contact_manager.dart';
import 'package:flutter_navigation/models/contact_model.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _addContactFormKey = GlobalKey<FormState>();
  final _nameCtl = TextEditingController();
  final _phoneNumberCtl = TextEditingController();

  @override
  void dispose() {
    _nameCtl.dispose();
    _phoneNumberCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.amber[50],
        child: Form(
          key: _addContactFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtl,
                validator: ((value) => (value == null || value.isEmpty)
                    ? "Please enter valid name"
                    : null),
                style: const TextStyle(
                  color: Colors.deepPurple,
                ),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Contact Name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberCtl,
                validator: ((value) => (value == null || value.isEmpty)
                    ? "Please enter valid phone number"
                    : null),
                style: const TextStyle(
                  color: Colors.deepPurple,
                ),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_addContactFormKey.currentState!.validate()) {
                    final contact = ContactModel(
                        id: const Uuid().v1(),
                        name: _nameCtl.text,
                        phoneNumber: _phoneNumberCtl.text);
                    final manager =
                        Provider.of<ContactManager>(context, listen: false);
                    manager.addContact(contact);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1, milliseconds: 500),
                        content: Text(
                            'Contact named ${_nameCtl.text} Success Added'),
                        action:
                            SnackBarAction(label: 'Close', onPressed: () {}),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(46)),
                child: const Text('Save Contact'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
