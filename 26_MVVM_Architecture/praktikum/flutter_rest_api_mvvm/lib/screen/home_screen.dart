import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rest_api_mvvm/model/user_model.dart';
import 'package:flutter_rest_api_mvvm/screen/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final _nameCtl = TextEditingController();
  final _jobCtl = TextEditingController();

  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    _nameCtl.dispose();
    _jobCtl.dispose();
    super.dispose();
  }

  bool isInputValidate() {
    if (_nameCtl.text.isEmpty) {
      displaySnackbar('Enter name correctly');
      return false;
    }
    if (_jobCtl.text.isEmpty) {
      displaySnackbar('Enter Job correctly');
      return false;
    }
    return true;
  }

  void clearInput() {
    _nameCtl.clear();
    _jobCtl.clear();
  }

  void getUser() {
    homeViewModel.getUsers();
  }

  void postUser() {
    if (isInputValidate()) {
      homeViewModel.postUser(name: _nameCtl.text, job: _jobCtl.text);
    }
  }

  void putUser() {
    if (isInputValidate()) {
      homeViewModel.putUser(id: '1', name: _nameCtl.text, job: _jobCtl.text);
    }
  }

  void deleteUser() {
    homeViewModel.deleteUser(id: '1');
  }

  void getUsersModel() {
    homeViewModel.getUsersModel();
  }

  void clearData() {
    homeViewModel.clearData();
    clearInput();
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
                    onPressed: getUser,
                    child: const Text('GET'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: postUser,
                    child: const Text('POST'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: putUser,
                    child: const Text('PUT'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: deleteUser,
                    child: const Text('DELETE'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: getUsersModel,
                    child: const Text('Model Class User Example'),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: clearData,
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
              child: Consumer<HomeViewModel>(
                builder: (context, value, child) {
                  if (value.users.isEmpty) {
                    return Text(value.result);
                  } else {
                    return _buildListUser(value.users);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListUser(List<User> users) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final user = users[index];
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
        itemCount: users.length);
  }

  dynamic displaySnackbar(String msg) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}
