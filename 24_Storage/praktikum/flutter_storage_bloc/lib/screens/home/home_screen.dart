import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_storage_bloc/screens/register/register_screen.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = context.read<HomeBloc>();
    homeBloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return ListView(children: [
                Text('Hello, ${state.name}'),
                Text(state.email),
                Text(state.phoneNumber),
                ElevatedButton(
                  onPressed: () {
                    homeBloc.add(LogoutEvent(
                        nextRoute: () => Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName)));
                  },
                  child: const Text('Log Out'),
                ),
              ]);
            }
            return const Text('Nothing to show');
          },
        ),
      ),
    );
  }
}
