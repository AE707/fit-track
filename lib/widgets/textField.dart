import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textField extends StatefulWidget {
  final String labeltext;
  final String hinttext;
  final controller;
  final String? Function(String?)?
      validator; // Define validator as a named parameter

  textField({
    required this.labeltext,
    required this.hinttext,
    required this.controller,
    this.validator,
  });

  @override
  State<textField> createState() => _textFieldState();
}

class _textFieldState extends State<textField> {
  //late String labeltext;
  //late String hinttext;
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) {},
        obscureText: _isSecurePassword,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.labeltext,
          labelStyle: GoogleFonts.bebasNeue(
            fontSize: 18,
            color: Color.fromARGB(120, 17, 15, 45),
          ),
          suffixIcon: togglePassword(),
          filled: true,
          fillColor: Color(0x33110f2d),
          hintText: widget.hinttext,
          hintStyle: GoogleFonts.bebasNeue(
            fontSize: 18,
            color: Color.fromARGB(120, 17, 15, 45),
          ),
          contentPadding: EdgeInsets.symmetric(
            //vertical: 5,
            horizontal: 20,
          ),
          //border: OutlineInputBorder(
          //  borderRadius: BorderRadius.circular(30),

          //),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(30),
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
