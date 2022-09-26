import 'package:flutter/material.dart';
import 'package:flutter_form_contact/view/form_contact_page.dart';
import 'package:flutter_form_contact/widget/contact_row.dart';
import 'package:flutter_form_contact/model/contact.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [];

  @override
  void initState() {
    _contacts = contactsDummy;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const FormContactPage(),
                //   ),
                // ).then((value) => setState((() => _contacts = contactsDummy)));
                Navigator.of(context).push(_createRoute()).then(
                      (value) => setState(
                        () => _contacts = contactsDummy,
                      ),
                    );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: contactsDummy.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: ContactRow(contact: _contacts[index]),
            );
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const FormContactPage(),
    transitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
