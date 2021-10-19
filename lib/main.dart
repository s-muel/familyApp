// import 'package:device_preview/device_preview.dart';
import 'package:famiily_app/views/auth/create_view.dart';
import 'package:famiily_app/views/home/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// void main() {
//   runApp(MyApp());
// // }
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famly App',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(249, 251, 252, 1),
          cardColor: Colors.white,
          appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: Color.fromARGB(249, 251, 252, 1),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              actionsIconTheme: IconThemeData(color: Colors.black))),
      home: CreateAccountView(),
    );
    
  }
}
