import 'package:flutter/material.dart';
import 'package:flutter_layout/models/user_model.dart';
import 'models/user_model.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      // child: ListView.builder(
      //   itemCount: users.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return userContact(users[index]);
      //   },
      // ),

      child: ListView(
        children: [
          for (var user in users) userContact(user),
        ],
      ),
    );
  }
}

Widget userContact(User user) {
  return Container(
    margin: const EdgeInsets.all(5),
    child: Row(
      children: <Widget>[
        CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(user.imageUrl),
        ),
        const SizedBox(width: 10.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(user.recentChat),
          ],
        ),
      ],
    ),
  );
}
