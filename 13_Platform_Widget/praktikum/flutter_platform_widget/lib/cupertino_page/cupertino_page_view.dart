import 'dart:convert';

import 'package:flutter/cupertino.dart';

class CupertinoPageView extends StatefulWidget {
  const CupertinoPageView({super.key});

  @override
  State<StatefulWidget> createState() => CupertinoPageViewState();
}

class CupertinoPageViewState extends State<CupertinoPageView> {
  TextEditingController controller = TextEditingController(text: '');
  List listBody = [];

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  void _loadJson() {
    DefaultAssetBundle.of(context)
        .loadString("assets/material_asset.json")
        .then((value) {
      final jsonResult = jsonDecode(value);
      setState(() {
        listBody = jsonResult['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return _body();
          },
        );
      },
    );
  }

  Widget _body() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Edit',
            style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 16.0),
          ),
        ),
        middle: const Text('Chats'),
        trailing: const Icon(
          CupertinoIcons.create,
          color: CupertinoColors.activeBlue,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              height: 50.0,
              child: CupertinoSearchTextField(
                backgroundColor: CupertinoColors.systemGrey5,
                onChanged: (value) {},
                onSubmitted: (value) {},
                controller: controller,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "All Chats",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey, fontSize: 14.0),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Work",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey, fontSize: 14.0),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Unread",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey, fontSize: 14.0),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Personal",
                      style: TextStyle(
                          color: CupertinoColors.systemGrey, fontSize: 14.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
