import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetUsers extends StatelessWidget {
  final String DocumentId;
  final String util;
  final double size;

  const GetUsers(
      {required this.DocumentId, required this.util, required this.size});

  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(DocumentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data[util]}",
            style: GoogleFonts.bebasNeue(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(120, 17, 15, 45),
            ),
          );
        }
        return Text(
          '...',
          style: GoogleFonts.bebasNeue(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(120, 17, 15, 45),
          ),
        );
      },
    );
  }
}
