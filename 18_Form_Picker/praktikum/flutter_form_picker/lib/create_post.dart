import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_form_picker/dbhelper.dart';
import 'package:flutter_form_picker/post_form_model.dart';
import 'package:flutter_form_picker/preview_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final dbHelper = DatabaseHelper.instance;
  final TextEditingController _datePickerCtl = TextEditingController();
  final TextEditingController _captionCtl = TextEditingController();

  Color _themeColor = Colors.white;
  File? coverImage;
  String? coverImagePath;
  String? publishDate;
  int? colorThemeValue;
  String? caption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: _body(),
      drawer: _drawer(),
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
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _coverImagePicker(),
          _sz(),
          _datePicker(),
          _sz(),
          _colorThemePicker(),
          _captionText(),
          _sz(),
          _saveButton(),
        ],
      ),
    );
  }

  Widget _sz() => const SizedBox(height: 16);

  Widget _coverImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: coverImage != null,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: coverImage != null
                ? Image.file(
                    coverImage!,
                    fit: BoxFit.cover,
                  )
                : Container(),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
          child: const Text(
            'Cover',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            minimumSize: const Size.fromHeight(50.0),
          ),
          child: const Text(
            'Choose Image',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            ImagePicker()
                .pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 1800.0,
                    maxHeight: 1800.0)
                .then((value) {
              if (value != null) {
                setState(() {
                  coverImage = File(value.path);
                  coverImagePath = value.path;
                });
              }
            });
          },
        )
      ],
    );
  }

  Widget _datePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
          child: const Text(
            'Publish At',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _datePickerCtl,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'dd/mm/yyyy',
            hintStyle: TextStyle(fontSize: 16.0),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          ),
          style: const TextStyle(fontSize: 16.0),
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime(2024),
            ).then((value) {
              if (value != null) {
                String? formatedDate = DateFormat('dd/MM/yyyy').format(value);
                setState(() {
                  _datePickerCtl.text = formatedDate;
                  publishDate = formatedDate;
                });
              }
            });
          },
        ),
      ],
    );
  }

  Widget _colorThemePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
          child: const Text(
            'Color Theme',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            backgroundColor: _themeColor,
            minimumSize: const Size.fromHeight(50.0),
          ),
          child: Text(
            'Pick a Color',
            style: TextStyle(
                color: _themeColor != Colors.white ? _themeColor : Colors.grey),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: const Text('Pick a Color'),
                  content: SingleChildScrollView(
                    child: MaterialPicker(
                      onColorChanged: (value) {
                        setState(() {
                          _themeColor = value;
                          colorThemeValue = value.value;

                          Navigator.pop(context);
                        });
                      },
                      pickerColor: _themeColor,
                    ),
                  ),
                );
              }),
            );
          },
        )
      ],
    );
  }

  Widget _captionText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
          child: const Text(
            'Caption',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          controller: _captionCtl,
          keyboardType: TextInputType.multiline,
          maxLines: 7,
          onChanged: (value) {
            setState(() {
              caption = value;
            });
          },
        )
      ],
    );
  }

  Widget _saveButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(),
        child: const Text('Save'),
        onPressed: () {
          if (coverImagePath != null &&
              publishDate != null &&
              colorThemeValue != null &&
              caption != null) {
            _insert(coverImagePath, publishDate, colorThemeValue, caption);
          } else {
            showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: const Text('ERROR'),
                  content: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 100.0,
                        ),
                        const Text('Data is not completed!'),
                        ElevatedButton(
                          child: const Text('BACK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                );
              }),
            );
          }
        },
      ),
    );
  }

  void _insert(coverImagePath, publishDate, colorThemeValue, caption) {
    Map<String, dynamic> row = {
      DatabaseHelper.columnCoverImagePath: coverImagePath,
      DatabaseHelper.columnPublishDate: publishDate,
      DatabaseHelper.columnColorThemeValue: colorThemeValue,
      DatabaseHelper.columnCaption: caption
    };
    PostFormModel postFormModel = PostFormModel.fromMap(row);
    dbHelper.insert(postFormModel).then(
      (value) {
        showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: const Text('INSERTED'),
              content: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.done,
                      color: Colors.green,
                      size: 100.0,
                    ),
                    Text('inserted row id: $value'),
                    ElevatedButton(
                      child: const Text('PREVIEW'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            );
          }),
        ).then((value) {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PreviewPage()));
        });
      },
    );
  }
}
