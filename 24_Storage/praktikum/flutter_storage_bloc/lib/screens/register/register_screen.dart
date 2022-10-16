import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_storage_bloc/screens/home/home_screen.dart';
import 'package:flutter_storage_bloc/screens/register/bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtl = TextEditingController();
  final _emailCtl = TextEditingController();
  final _phoneNumberCtl = TextEditingController();
  final _passwordCtl = TextEditingController();

  late RegisterBloc registerBloc;

  @override
  void initState() {
    registerBloc = context.read<RegisterBloc>();
    registerBloc.checkLogin(
      () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
    super.initState();
  }

  @override
  void dispose() {
    _nameCtl.dispose();
    _emailCtl.dispose();
    _phoneNumberCtl.dispose();
    _passwordCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            TextFormField(
              controller: _nameCtl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_box),
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) => (value == null) ? "Enter your name" : null,
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _emailCtl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  (value != null && !EmailValidator.validate(value))
                      ? 'Enter a valid email'
                      : null,
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _phoneNumberCtl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  (value == null) ? 'Enter your phone number' : null,
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _passwordCtl,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) => (value != null && value.length < 3)
                  ? 'Enter min 3 character'
                  : null,
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  registerBloc.add(
                    SaveRegisterEvent(
                      name: _nameCtl.text,
                      email: _emailCtl.text,
                      phoneNumber: _phoneNumberCtl.text,
                      nextRoute: () => Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName),
                    ),
                  );
                }
              },
              child: const Text('Register'),
            )
          ]),
        ),
      ),
    );
  }
}
