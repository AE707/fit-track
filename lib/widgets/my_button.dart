import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {required this.color,
      required this.colorT,
      required this.sizeT,
      required this.width,
      required this.height,
      required this.title,
      required this.onPressed});

  final Color color;
  final Color colorT;
  final double width;
  final double sizeT;
  final double height;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 10,
        color: color,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: height,
          child: Text(
            title,
            style: GoogleFonts.bebasNeue(
              fontSize: sizeT,
              color: colorT,
            ),
          ),
        ),
      ),
    );
  }
}
