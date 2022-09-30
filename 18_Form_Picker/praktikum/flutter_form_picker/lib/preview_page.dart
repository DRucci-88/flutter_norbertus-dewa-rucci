import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_picker/create_post.dart';
import 'package:flutter_form_picker/dbhelper.dart';
import 'package:flutter_form_picker/post_form_model.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  final dbHelper = DatabaseHelper.instance;
  List<PostFormModel> postForms = [];

  List test = [];

  @override
  void initState() {
    super.initState();
    _queryAll();
  }

  void _queryAll() async {
    dbHelper.queryAllRows().then((value) {
      for (var row in value) {
        postForms.add(PostFormModel.fromMap(row));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      drawer: _drawer(),
      body: _body(),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: 300.0,
        child: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 50.0,
                ),
                _drawerItem(0, Icons.post_add, 'Create Post'),
                _drawerItem(1, Icons.preview, 'Preview Page'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(int id, IconData icontext, String labelText) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      child: ElevatedButton(
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
        onPressed: () {
          if (id == 0) {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreatePost()));
          } else {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PreviewPage()));
          }
        },
      ),
    );
  }

  Widget _body() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: postForms.length,
      itemBuilder: (BuildContext context, int index) {
        if (postForms.isEmpty) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: Text('Data is null!'),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _sz(5.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150.0,
              child: postForms[index].coverImagePath != null
                  ? Image.file(
                      File(postForms[index].coverImagePath.toString()),
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
            _sz(10.0),
            Row(
              children: [
                Text(
                  'Published : ${postForms[index].publishDate}',
                  style: const TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                const Spacer(),
                const Text(
                  'Color : ',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                      color: Color(postForms[index].colorThemeValue!),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0))),
                ),
              ],
            ),
            _sz(10.0),
            Text(
              '${postForms[index].caption}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0),
            ),
            _sz(5.0),
            const Divider(
              color: Colors.grey,
              thickness: 1.0,
            )
          ],
        );
      },
    );
  }

  Widget _sz(double? heightVal) => SizedBox(height: heightVal);
}
