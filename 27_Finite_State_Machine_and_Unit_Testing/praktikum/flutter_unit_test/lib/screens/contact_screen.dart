import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_unit_test/screens/contact_view_model.dart';
import 'package:provider/provider.dart';

import '../models/contact_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final contactViewModel =
          Provider.of<ContactViewModel>(context, listen: false);
      await contactViewModel.getAllContact();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Consumer<ContactViewModel>(
        builder: (context, value, child) {
          print(value.state);
          if (value.state == ContactViewState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.state == ContactViewState.ready) {
            print(value.contacts);
            return _buildListContact(value.contacts);
          }
          return const Center(child: Text('Error Happen'));
        },
      ),
    );
  }

  Widget _buildListContact(List<Contact> contacts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(contacts[index].name),
          subtitle: Text(contacts[index].id.toString()),
        );
      },
      itemCount: contacts.length,
    );
  }
}
