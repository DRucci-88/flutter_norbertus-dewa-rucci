import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/contact_bloc.dart';
import 'package:flutter_bloc_1/model/contact.dart';
import 'package:uuid/uuid.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({super.key});

  @override
  State<CreateContactScreen> createState() => _CreateContactScreenState();
}

class _CreateContactScreenState extends State<CreateContactScreen> {
  final _formContact = GlobalKey<FormState>();
  final _nameCtl = TextEditingController();
  final _phoneNumberCrl = TextEditingController();

  @override
  void dispose() {
    _nameCtl.dispose();
    _phoneNumberCrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Container(
        color: Colors.amber[50],
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Form(
            key: _formContact,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameCtl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Add Name Properly '
                      : null,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _phoneNumberCrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Add Phone Number Properly '
                      : null,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formContact.currentState!.validate()) {
                      final newContact = Contact(
                        const Uuid().v1(),
                        _nameCtl.text,
                        _phoneNumberCrl.text,
                      );
                      context.read<ContactBloc>().add(AddContact(newContact));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Create Contact'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
