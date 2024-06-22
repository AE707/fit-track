import 'package:flutter/material.dart';

import '../screens/signUp_screen.dart';

class LoginOrRegister2 extends StatefulWidget {
  final Function()? onTap;
  const LoginOrRegister2({super.key, required this.onTap});
  @override
  State<LoginOrRegister2> createState() => _LoginOrRegister2State();
}

class _LoginOrRegister2State extends State<LoginOrRegister2> {
  @override
  Widget build(BuildContext context) {
    return SignUpScreen(
      onTap: widget.onTap,
    );
  }
}
