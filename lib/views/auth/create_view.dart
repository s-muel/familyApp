import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicons/unicons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateAccountView extends StatefulWidget {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final emailRegexpression = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final ImagePicker _imagePicker = ImagePicker();

  File? _imageFile;

  selectImage({ImageSource imageSource = ImageSource.camera}) async {
    XFile? selectFile = await _imagePicker.pickImage(source: imageSource);
    File _imageFile = File(selectFile!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/imo.jpg'),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: _imageFile == null
                  ? Image.asset(
                      'assets/imo.jpg',
                      width: 130,
                      height: 130,
                      fit: BoxFit.contain,
                    )
                  : Image.file(
                      _imageFile!,
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
            ),
            TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                                TextButton.icon(
                                    onPressed: () => selectImage(
                                        imageSource: ImageSource.camera),
                                    icon: const Icon(UniconsLine.camera),
                                    label: const Text('Select From Camara')),
                                TextButton.icon(
                                    onPressed: () => selectImage(
                                        imageSource: ImageSource.gallery),
                                    icon: const Icon(UniconsLine.picture),
                                    label: const Text('Select From Galary'))
                              ],
                            ));
                      });
                },
                icon: Icon(UniconsLine.camera),
                label: Text('Select Profile')),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Fullname',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Fullname is required';
                }
                ;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (!emailRegexpression.hasMatch(value!)) {
                    return 'Email is invalid';
                  }
                  if (value.isEmpty) {}
                }),
            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "password is require";
                }
                if (value.length < 8) {
                  return "Password less than 8";
                }
              },
            ),
            SizedBox(height: 15),
            TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String name = _nameController.text;
                    String email = _emailController.text;
                    String password = _passwordController.text;
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please Check Input",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white),
                ),
                child: Text('Create Account'))
          ],
        ),
      ),
    );
  }
}
