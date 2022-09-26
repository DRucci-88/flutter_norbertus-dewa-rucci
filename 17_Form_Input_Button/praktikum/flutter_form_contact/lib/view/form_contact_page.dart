import 'package:flutter/material.dart';
import 'package:flutter_form_contact/model/contact.dart';

class FormContactPage extends StatefulWidget {
  const FormContactPage({Key? key}) : super(key: key);

  @override
  State<FormContactPage> createState() => _FormContactPageState();
}

class _FormContactPageState extends State<FormContactPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name = '';
  String? _phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Contact'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter name correctly'
                    : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Name',
                ),
                onChanged: (value) => setState(() => _name = value),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Please enter phone number correctly'
                    : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Phone Number',
                ),
                onChanged: (value) => setState(() => _phoneNumber = value),
              ),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    contactsDummy.add(
                      Contact(contactsDummy.length + 1, _name!, _phoneNumber!),
                    );
                    Navigator.of(context).pop(true);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
