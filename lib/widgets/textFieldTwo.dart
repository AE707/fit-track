import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textFieldTwo extends StatefulWidget {
  final String labeltext;
  final String hinttext;
  textFieldTwo({required this.labeltext, required this.hinttext});

  @override
  State<textFieldTwo> createState() => _textFieldTwoState();
}

class _textFieldTwoState extends State<textFieldTwo> {
 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextField(
        
        onChanged: (value) {},
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: widget.labeltext,
          
          labelStyle: GoogleFonts.bebasNeue(
            fontSize: 20,
            
            color: Color.fromARGB(120, 17, 15, 45),
          ),
          
          filled: true,
          fillColor: Color(0x33110f2d),
          hintText: widget.hinttext,
          
          hintStyle: GoogleFonts.bebasNeue(
            fontSize: 20,
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

 
}
