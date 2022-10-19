import 'package:flutter/material.dart';
import 'package:project_weekly3/model/user_provider.dart';
import 'package:project_weekly3/screens/about_screen.dart';
import 'package:project_weekly3/screens/data_user_screen.dart';
import 'package:project_weekly3/screens/home_screen.dart';
import 'package:project_weekly3/screens/contact_us_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekly 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeScreen.routeName:
            return _customNamedRoute(const HomeScreen());
          case AboutScreen.routeName:
            return _customNamedRoute(const AboutScreen());
          case ContactUsScreen.routeName:
            return _customNamedRoute(const ContactUsScreen());
          case DataUserScreen.routeName:
            return _customNamedRoute(const DataUserScreen());
          default:
            return null;
        }
      },
    );
  }

  Route _customNamedRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: const Offset(0.0, 0.8), end: Offset.zero);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
