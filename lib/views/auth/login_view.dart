import 'package:flutter/material.dart';

import 'forgot_password.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailRegexp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const FlutterLogo(
              size: 130,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text('Email'),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email is required!';
                }

                if (!emailRegexp.hasMatch(value)) {
                  return 'Email is invalid';
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required!';
                }

                if (value.length < 8) {
                  return 'Password should be 8 characters or more';
                }
              },
            ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordView())),
                    child: Text("forgot password"))),
            TextButton(onPressed: () {}, child: Text('Login'))
          ],
        ),
      ))),
    );
  }
}
