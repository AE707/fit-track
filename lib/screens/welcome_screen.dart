import 'package:fit_track/pages/LoginOrRegister2.dart';
import 'package:fit_track/widgets/my_button.dart';
import 'package:fit_track/widgets/my_menuButton.dart';
import 'package:flutter/material.dart';

import '../pages/LoginOrRegister1.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(35, 32, 77, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MyMenuButton(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(125, 125, 125, 0),
              child: Container(
                child: Image.asset('images/image_1.png'),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            MyButton(
              color: Color.fromRGBO(127, 199, 206, 1),
              colorT: Color.fromRGBO(35, 32, 77, 1),
              sizeT: 25,
              height: 10,
              width: 250,
              title: 'SIGN IN',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginOrRegister1(onTap: () {  },)));
              },
            ),
            MyButton(
              color: Color.fromRGBO(127, 199, 206, 1),
              colorT: Color.fromRGBO(35, 32, 77, 1),
              sizeT: 25,
              height: 10,
              width: 250,
              title: 'SIGN UP',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginOrRegister2(onTap: () {  },)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
