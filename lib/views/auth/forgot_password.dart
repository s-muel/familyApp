import 'package:famiily_app/views/home/home_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final RegExp emailRegexp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const FlutterLogo(
            size: 130,
          ),

          //
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
          const SizedBox(height: 25),
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  bool isSuccessful = true;
                  if (isSuccessful == true) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeView()),
                        (route) => false);
                  }
                } else {}
              },
              child: Text("Reset password")),
          // TextButton(onPressed: () {}, child: Text('Login'))
        ],
      ),
    )));
  }
}
