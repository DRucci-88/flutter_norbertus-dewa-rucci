import 'package:flutter/material.dart';
import 'package:project_weekly3/model/user_provider.dart';
import 'package:provider/provider.dart';

class DataUserScreen extends StatelessWidget {
  static const routeName = '/data-user';

  const DataUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Data'),
      ),
      body: Container(
        color: Colors.amber[50],
        child: Consumer<UserProvider>(
          builder: (context, value, child) {
            if (value.users.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: value.users[index].username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const TextSpan(text: ' ~ '),
                            TextSpan(text: value.users[index].email)
                          ],
                        ),
                      ),
                      subtitle: Text(value.users[index].message),
                    ),
                  );
                },
                itemCount: value.users.length,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
