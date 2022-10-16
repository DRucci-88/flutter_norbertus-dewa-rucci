import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_storage_bloc/data/shared_pref.dart';
import 'package:flutter_storage_bloc/screens/home/bloc/home_bloc.dart';
import 'package:flutter_storage_bloc/screens/register/bloc/register_bloc.dart';
import 'package:flutter_storage_bloc/screens/register/register_screen.dart';
import 'package:flutter_storage_bloc/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => RegisterBloc(
                SharedPref(sharedPref: SharedPreferences.getInstance()))),
        BlocProvider(
            create: (context) => HomeBloc(
                SharedPref(sharedPref: SharedPreferences.getInstance())))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RegisterScreen.routeName:
            return _customRoute(const RegisterScreen());
          case HomeScreen.routeName:
            return _customRoute(const HomeScreen());
          default:
            return null;
        }
      },
    );
  }

  Route _customRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(0.0, 0.1), end: Offset.zero);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
