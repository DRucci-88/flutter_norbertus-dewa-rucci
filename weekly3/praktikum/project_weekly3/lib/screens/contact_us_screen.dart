import 'package:flutter/material.dart';
import 'package:project_weekly3/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:project_weekly3/model/user_provider.dart';
import 'package:uuid/uuid.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  static const routeName = '/contact-us';

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _messageCtl = TextEditingController();

  @override
  void dispose() {
    _usernameCtl.dispose();
    _emailCtl.dispose();
    _messageCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Users'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameCtl,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        (value!.isEmpty) ? 'Enter username' : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailCtl,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        (value!.isEmpty) ? 'Enter email' : null,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _messageCtl,
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        (value!.isEmpty) ? 'Enter message' : null,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog<void>(
                          context: context,
                          builder: (context) {
                            /// Add Contact to Provider
                            userProvider.addUser(User(
                              const Uuid().v1(),
                              _usernameCtl.text,
                              _emailCtl.text,
                              _messageCtl.text,
                            ));

                            return AlertDialog(
                              title: const Text('Value Submit Form'),
                              content: Text(
                                  'Username: ${_usernameCtl.text} \nEmail: ${_emailCtl.text} \nMessage: ${_messageCtl.text}'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(42)),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
