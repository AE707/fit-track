import 'package:fit_track/screens/signIn_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegister1 extends StatefulWidget {
  final Function()? onTap;
  const LoginOrRegister1({super.key, required this.onTap});
  @override
  State<LoginOrRegister1> createState() => _LoginOrRegister1State();
}

class _LoginOrRegister1State extends State<LoginOrRegister1> {
  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      onTap: widget.onTap,
    );
  }
}
