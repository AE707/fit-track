import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({required this.labeltext, required this.hinttext, required this.controller});

  final String labeltext;
  final String hinttext;
  final controller;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: TextField(
        controller: controller,
        onChanged: (value) {},
        decoration: InputDecoration(

          labelText: labeltext,
          labelStyle:  GoogleFonts.bebasNeue(
                          fontSize: 20,
                          
                          color: Color.fromARGB(120, 17, 15, 45),
                        ),
          hintText: hinttext,
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
}
