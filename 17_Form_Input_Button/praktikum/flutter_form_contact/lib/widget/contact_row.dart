import 'package:flutter/material.dart';

import '../model/contact.dart';

class ContactRow extends StatelessWidget {
  final Contact contact;
  const ContactRow({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(25),
            color: Colors.purple,
          ),
          child: Center(
            child: Text(
              contact.name[0].toUpperCase(),
              style: TextStyle(
                color: Colors.amber[100],
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.name),
            const SizedBox(
              height: 5.0,
            ),
            Text(contact.numberPhone)
          ],
        )
      ],
    );
  }
}
