import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _dateCtl = TextEditingController();
  final TextEditingController _captionCtl = TextEditingController();
  Color _themeColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    const double sixedBoxHeight = 16.0;
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildColorPicker(context),
            _sz(),
            _buildColorTheme(context),
            _buildCaptionText(context),
            _sz(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(),
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _sz() => const SizedBox(height: 16);

  Widget _buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Publish At'),
        TextFormField(
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            DateTime? date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime(2024),
            );
            if (date != null) {
              String? formatedDate = DateFormat('dd-MM-yyyy').format(date);
              _dateCtl.text = formatedDate;
            }
          },
          controller: _dateCtl,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'dd/mm/yyyy',
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          ),
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildColorTheme(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color Theme'),
        Container(
          height: 100,
          width: double.infinity,
          color: _themeColor,
        ),
        Center(
          child: TextButton(
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
                          });
                        },
                        pickerColor: _themeColor,
                      ),
                    ),
                  );
                }),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)),
            child: const Text('Pick a Color'),
          ),
        )
      ],
    );
  }

  Widget _buildCaptionText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Caption'),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          controller: _captionCtl,
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLines: 7,
        )
      ],
    );
  }
}

// const Text('Cover'),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                   minimumSize: const Size.fromHeight(50)),
//               child: const Text('Pilih File'),
//             ),