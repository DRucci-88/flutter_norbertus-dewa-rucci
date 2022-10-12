import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/contact_bloc.dart';
import 'package:flutter_bloc_1/bloc/user_bloc.dart';
import 'package:flutter_bloc_1/screens/enter_username_screen.dart';
import 'package:flutter_bloc_1/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContactBloc()),
        BlocProvider(create: (context) => UserBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const EnterUsernameScreen(),
      ),
    );
  }
}
