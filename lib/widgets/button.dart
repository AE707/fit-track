import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends  StatelessWidget {

  final Function()? onTap;
  final String text;



  Button({
    super.key,
    required this.onTap,
    required this.text,


  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,

      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: Color.fromRGBO(35, 32, 77, 1),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(text,
            style:
            GoogleFonts.bebasNeue(
              fontSize: 20,

              color: Color.fromRGBO(127, 199, 206, 1),
            ),
        ),),
      ),
    );
  }
}
