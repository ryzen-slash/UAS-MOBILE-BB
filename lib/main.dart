import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mob_queker/pages/first_screen.dart';
import 'firebase_options.dart'; // Import Firebase Auth

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}
