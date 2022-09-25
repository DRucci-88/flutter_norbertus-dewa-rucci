import 'dart:convert';

import 'package:flutter/material.dart';

class MaterialPageView extends StatefulWidget {
  const MaterialPageView({super.key});

  @override
  State<StatefulWidget> createState() => MaterialPageViewState();
}

class MaterialPageViewState extends State<MaterialPageView> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Telegram',
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {},
      ),
      drawer: _drawer(),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listBody.length,
      itemBuilder: (context, index) {
        late Map<String, dynamic> bodyValue;
        bodyValue = listBody[index];
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 5.0, 0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(bodyValue['image']),
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Visibility(
                            visible: bodyValue['favorite'],
                            child: const Icon(
                              Icons.lock,
                              color: Colors.green,
                            )),
                        Expanded(
                          flex: 10,
                          child: Text(
                            bodyValue['name'],
                            style: bodyValue['favorite']
                                ? const TextStyle(
                                    color: Colors.green,
                                  )
                                : const TextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        Visibility(
                          visible: bodyValue['read'],
                          child:
                              const Icon(Icons.done_all, color: Colors.green),
                        ),
                        Text(bodyValue['date'])
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: bodyValue['body']['username'] != ''
                              ? Text(
                                  bodyValue['body']['username'] +
                                      ' : ' +
                                      bodyValue['body']['message'],
                                  overflow: TextOverflow.ellipsis,
                                )
                              : Text(
                                  bodyValue['body']['message'],
                                  style: bodyValue['attachment']
                                      ? const TextStyle(
                                          color: Colors.blueAccent,
                                        )
                                      : const TextStyle(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 0,
                          child: Visibility(
                            visible: bodyValue['unread'] != 0,
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                bodyValue['unread'].toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.purpleAccent),
          ],
        ),
        width: 300.0,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage('https://picsum.photos/id/1021/300/200'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: 75.0,
                      height: 75.0,
                      decoration: const BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0))),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://picsum.photos/id/1005/200/300'),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                      child: const Text(
                        "Dan Ashford",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      "+1 (047) 911 05",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _drawerItem(Icons.group, 'New Group'),
                    _drawerItem(Icons.lock, 'New Secret Chat'),
                    _drawerItem(Icons.safety_divider, 'New Channel'),
                    const SizedBox(
                      height: 15.0,
                    ),
                    _drawerItem(Icons.person_pin_rounded, 'Contacts'),
                    _drawerItem(Icons.person_add, 'Invite Friends'),
                    _drawerItem(Icons.settings, 'Settings'),
                    _drawerItem(Icons.help, 'Telegram FAQ'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icontext, String labelText) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(icontext),
          ),
          Expanded(
            flex: 3,
            child: Text(labelText,
                style: const TextStyle(
                  fontSize: 16.0,
                )),
          ),
        ],
      ),
    );
  }
}
