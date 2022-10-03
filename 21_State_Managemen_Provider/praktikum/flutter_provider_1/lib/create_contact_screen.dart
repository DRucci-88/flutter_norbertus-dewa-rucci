import 'package:flutter/material.dart';
import 'package:flutter_provider_1/contact_model.dart';
import 'package:uuid/uuid.dart';

class CreateContactScreen extends StatefulWidget {
  const CreateContactScreen({super.key, required this.addCallback});

  final void Function(Contact newContact) addCallback;

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
                      widget.addCallback(Contact(
                        const Uuid().v1(),
                        _nameCtl.text,
                        _phoneNumberCrl.text,
                      ));

                      Navigator.pop(context);
                      ScaffoldMessenger(
                        child: Text('${_nameCtl.text} successfully added'),
                      );
                    }
                  },
                  child: const Text('Create Contact'),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
