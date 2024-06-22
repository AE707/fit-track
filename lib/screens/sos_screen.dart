import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SosScreen extends StatefulWidget {
  static const String screenRoute = 'sos_screen';
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;

// Function to fetch user data from Firestore
  Future<Map<String, dynamic>> getUserData() async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    if (userDoc.exists) {
      // Document exists, fetch data
      final userData = userDoc.data() as Map<String, dynamic>;
      return userData;
    } else {
      // Document does not exist
      return {'phoneNumber': ''};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(35, 32, 77, 1),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 330, top: 10),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, SettingScreen.screenRoute);
                },
                child: Image.asset(
                  "assets/setting.png",
                ),
              ),
            ),
            addVerticalSpace(150),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Sos Contacts",
                style: GoogleFonts.bebasNeue(
                  fontSize: 28,
                  color: Color(0xff7fc7ce),
                ),
              ),
            ),
            addVerticalSpace(20),
            Container(
              width: 282,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff7fc7ce)),
              child: Column(
                children: [
                  addVerticalSpace(100),

                  //Phone Number
                  FutureBuilder<Map<String, dynamic>>(
                    future: getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final userData = snapshot.data!;
                        final phoneNumber = userData['phoneNumber'];

                        return Container(
                          width: 170,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x33110f2d),
                          ),
                          child: Center(
                            child: Text(
                              phoneNumber,
                              style: GoogleFonts.bebasNeue(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(120, 17, 15, 45),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  addVerticalSpace(15),

                  //Email
                  Container(
                    width: 170,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x33110f2d)),
                    child: Center(
                      child: Text(
                        currentUser.email!,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(120, 17, 15, 45),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
