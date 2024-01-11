import 'package:flutter/material.dart';
import 'package:mob_queker/pages/login_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff61A3BA),
        body: Column(
          children: <Widget>[
            SizedBox(height: 150),
            Center(
              child: Column(
                children: [
                  Container(
                      height: 300,
                      width: 300,
                      child: Image(image: AssetImage('assets/logo.png'))),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Welcome to Mob Queker',
                    style: TextStyle(
                      color: Color(0xffFFFFDD),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Connecting Lives - Your Ultimate Earthquake Companion!',
                    style: TextStyle(
                      color: Color(0xffFFFFDD),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color(0xffD2DE32),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
