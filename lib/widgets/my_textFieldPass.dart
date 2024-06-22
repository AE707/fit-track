import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFieldPass extends StatefulWidget {
  final String labeltext;
  final String hinttext;
  final controller;

  MyTextFieldPass({required this.labeltext, required this.hinttext, required this.controller});

  @override
  State<MyTextFieldPass> createState() => _MyTextFieldPassState();
}

class _MyTextFieldPassState extends State<MyTextFieldPass> {
  //late String labeltext;
  //late String hinttext;
  bool _isSecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {},
        obscureText: _isSecurePassword,
        decoration: InputDecoration(
          labelText: widget.labeltext,
          labelStyle: GoogleFonts.bebasNeue(
            fontSize: 20,
            color: Color.fromARGB(120, 17, 15, 45),
          ),
          suffixIcon: togglePassword(),
          hintText: widget.hinttext,
          hintStyle: GoogleFonts.bebasNeue(
            fontSize: 19,
            color: Color.fromARGB(120, 17, 15, 45),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(20),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(35, 32, 77, 1),
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(20),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(35, 32, 77, 1),
              width: 3,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility_rounded)
          : Icon(Icons.visibility_off),
      color: Color.fromARGB(159, 17, 15, 45),
    );
  }
}
