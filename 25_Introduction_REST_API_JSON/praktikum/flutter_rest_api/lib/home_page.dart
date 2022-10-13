import 'package:flutter/material.dart';
import 'package:flutter_rest_api/user.dart';
import 'data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameCtl = TextEditingController();
  final _jobCtl = TextEditingController();
  String _result = '-';
  final List<User> _users = [];

  @override
  void dispose() {
    _nameCtl.dispose();
    _jobCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameCtl,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Name',
                suffixIcon: IconButton(
                  onPressed: _nameCtl.clear,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _jobCtl,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Job',
                suffixIcon: IconButton(
                  onPressed: _jobCtl.clear,
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      DataService.getUsers().then(
                          (res) => setState(() => _result = res.toString()));
                    },
                    child: const Text('GET'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameCtl.text.isEmpty) {
                        displaySnackbar('Enter name correctly');
                        return;
                      }
                      if (_jobCtl.text.isEmpty) {
                        displaySnackbar('Enter name correctly');
                        return;
                      }
                      DataService.postUser(_nameCtl.text, _jobCtl.text).then(
                        (res) => setState(
                          () => _result = res.toString(),
                        ),
                      );
                      _nameCtl.clear();
                      _jobCtl.clear();
                    },
                    child: const Text('POST'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameCtl.text.isEmpty) {
                        displaySnackbar('Enter name correctly');
                        return;
                      }
                      if (_jobCtl.text.isEmpty) {
                        displaySnackbar('Enter name correctly');
                        return;
                      }
                      DataService.putUser('3', _nameCtl.text, _jobCtl.text)
                          .then(
                        (res) => setState(
                          () => _result = res.toString(),
                        ),
                      );
                      _nameCtl.clear();
                      _jobCtl.clear();
                    },
                    child: const Text('PUT'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      DataService.deleteUser('4').then(
                        (res) => setState(
                          () => _result = 'Delete Success',
                        ),
                      );
                    },
                    child: const Text('DELETE'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final users = await DataService.test();
                      setState(() {
                        _users.addAll(users);
                      });
                    },
                    child: const Text('Model Class User Example'),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = '';
                      _users.clear();
                    });
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: _users.isEmpty ? Text(_result) : _buildListUser(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListUser() {
    return ListView.separated(
        itemBuilder: (context, index) {
          final user = _users[index];
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(user.avatar),
              ),
              title: Text('${user.firstName} ${user.lastName}'),
              subtitle: Text(user.email),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
        itemCount: _users.length);
  }

  dynamic displaySnackbar(String msg) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}
