import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/screens/changePass_screen.dart';
import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilScreen extends StatefulWidget {
  static const String screenRoute = 'profil_screen';
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
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
      return {'user': '', 'fullName': ''};
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
              padding: const EdgeInsets.only(left: 340, top: 10),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeTwoScreen.screenRoute);
                },
                child: Image.asset(
                  "assets/exit.png",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 10),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 60,
              ),
            ),
            addVerticalSpace(30),
            Container(
              width: 220,
              height: 455,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff7fc7ce)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Profile",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff110f2d),
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ),
                  addVerticalSpace(60),

                  //full name
                  FutureBuilder<Map<String, dynamic>>(
                    future: getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final userData = snapshot.data!;
                        final fullName = userData['fullName'];

                        return Container(
                          width: 161,
                          height: 31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x33110f2d),
                          ),
                          child: Center(
                            child: Text(
                              fullName,
                              style: GoogleFonts.bebasNeue(
                                fontSize: 15,
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

                  //user name
                  FutureBuilder<Map<String, dynamic>>(
                    future: getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final userData = snapshot.data!;
                        final username = userData['user'];

                        return Container(
                          width: 161,
                          height: 31,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0x33110f2d)),
                          child: Center(
                            child: Text(
                              username,
                              style: GoogleFonts.bebasNeue(
                                fontSize: 15,
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
                    width: 161,
                    height: 31,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x33110f2d)),
                    child: Center(
                      child: Text(
                        currentUser.email!,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(120, 17, 15, 45),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ChangePassScreen.screenRoute);
                    },
                    child: Container(
                      width: 161,
                      height: 31,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0x33110f2d)),
                      child: Center(
                        child: Text(
                          "Change Password",
                          style: GoogleFonts.bebasNeue(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(120, 17, 15, 45),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(10),

                  //bracelet id
                  Container(
                    width: 161,
                    height: 31,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0x33110f2d)),
                    child: Center(
                      child: Text(
                        "Device ID: ******",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 15,
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
