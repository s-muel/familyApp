import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unicons/unicons.dart';

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

  final ImagePicker _imagePicker = ImagePicker();
  File? _imageFile;

  selectImage({ImageSource imageSource = ImageSource.camera}) async {
    XFile? selectFile = await _imagePicker.pickImage(source: imageSource);
    _imageFile = File(selectFile!.path);
    setState(() {});
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
            TextButton.icon(
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                            height: 200,
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () => selectImage(
                                      imageSource: ImageSource.camera),
                                  child: Icon(Icons.camera),
                                ),
                                TextButton(
                                  onPressed: () => selectImage(
                                      imageSource: ImageSource.gallery),
                                  child: Icon(Icons.photo),
                                )
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
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 15),
            TextButton(
                onPressed: null,
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
