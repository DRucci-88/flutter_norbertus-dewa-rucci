import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/contact_bloc.dart';
import 'package:flutter_bloc_1/bloc/user_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../widgets/contact_item.dart';
import 'create_contact_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, String>(
          builder: (context, state) {
            // print(state);  // Run Twice Somehow
            return Text(state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateContactScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Container(
          height: double.infinity, color: Colors.amber[50], child: _body()),
    );
  }

  Widget _body() {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        // print(state);
        if (state is ContactInitial) {
          print(state);
          return _blankScreen();
        }
        if (state is ContactLoading) {
          print(state);
          return _loadingScreen();
        }
        if (state is ContactLoaded) {
          print(state);
          return _contactsScreen(state);
        }
        if (state is ContactFailed) {
          print(state);
          return const Text('ERROR LER');
        }
        return const Text('Error Kabeh');
      },
    );
  }

  Widget _blankScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('There is no Data here'),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.person_add_disabled),
          ),
        ],
      ),
    );
  }

  Widget _loadingScreen() {
    return const LoadingIndicator(
      indicatorType: Indicator.ballPulse,
      colors: [Colors.red, Colors.green, Colors.blue],
      strokeWidth: 1,
    );
  }

  Widget _contactsScreen(ContactState state) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          ContactItem(index: index, contact: state.contacts[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 8.0),
      itemCount: state.contacts.length,
    );
  }
}
