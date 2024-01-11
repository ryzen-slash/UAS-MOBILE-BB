import 'package:flutter/material.dart';
import 'package:mob_queker/pages/status_gempa_screen.dart';

class ShowDataScreen extends StatefulWidget {
  const ShowDataScreen({Key? key}) : super(key: key);

  @override
  _ShowDataScreenState createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatusGempaPage(),
    );
  }
}
