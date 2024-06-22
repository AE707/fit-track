import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:fit_track/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RangeScreen extends StatefulWidget {
  static const String screenRoute = 'range_screen';

  const RangeScreen({super.key});

  @override
  State<RangeScreen> createState() => _RangeScreenState();
}

class _RangeScreenState extends State<RangeScreen> {
  String? _selectedRange = "3-6 (80-100 BMP)"; // Set an initial value

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
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfilScreen.screenRoute);
                  },
                  child: Image.asset(
                    "assets/logo.png",
                    width: 50,
                    height: 80,
                  ),
                ),
                addHorizontalSpace(80),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "Range",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 44,
                      color: Colors.white,
                    ),
                  ),
                ),
                addHorizontalSpace(78.7),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SettingScreen.screenRoute);
                  },
                  child: Image.asset(
                    "assets/setting.png",
                    width: 40,
                    height: 50,
                  ),
                ),
              ],
            ),
            addVerticalSpace(50),
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Container(
                height: 325,
                width: 255,
                decoration: BoxDecoration(
                  color: Color(0x8c7fc7ce),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: Column(
                          children: [
                            //radio 1
                            Row(
                              children: [
                                Text(
                                  "3-6 (80-100 BMP)",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 23,
                                    color: Colors.white,
                                  ),
                                ),
                                addHorizontalSpace(38),
                                Radio(
                                  activeColor: Colors.white,
                                  value: "3-6 (80-100 BMP)",
                                  groupValue: _selectedRange,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedRange = value as String;
                                    });
                                  },
                                ),
                              ],
                            ),

                            // radio 2
                            Row(
                              children: [
                                Text(
                                  "7-9 (70-110 BMP)",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 23,
                                    color: Colors.white,
                                  ),
                                ),
                                addHorizontalSpace(38),
                                Radio(
                                  activeColor: Colors.white,
                                  value: "7-9 (70-110 BMP)",
                                  groupValue: _selectedRange,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedRange = value as String;
                                    });
                                  },
                                ),
                              ],
                            ),

                            // radio 3
                            Row(
                              children: [
                                Text(
                                  "10+ (60-100 BMP)",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 23,
                                    color: Colors.white,
                                  ),
                                ),
                                addHorizontalSpace(35),
                                Radio(
                                  activeColor: Colors.white,
                                  value: "10+ (60-100 BMP)",
                                  groupValue: _selectedRange,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedRange = value as String;
                                    });
                                  },
                                ),
                              ],
                            ),

                            // radio 4
                            Row(
                              children: [
                                Text(
                                  "Athletes Top Condition\n(40-60 BMP)",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                addHorizontalSpace(13),
                                Radio(
                                  activeColor: Colors.white,
                                  value: "Athletes Top Condition\n(40-60 BMP)",
                                  groupValue: _selectedRange,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedRange = value as String;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 120),
                        child: MyButton(
                          sizeT: 20,
                          color: Color.fromRGBO(35, 32, 77, 1),
                          colorT: Color.fromARGB(206, 127, 199, 206),
                          height: 2,
                          width: 80,
                          title: 'Select',
                          onPressed: () async {
                            // Get the user's UID
                            String userUid =
                                FirebaseAuth.instance.currentUser!.uid;

                            // Reference to the Firestore collection and document
                            final userDocRef = FirebaseFirestore.instance
                                .collection("users")
                                .doc(userUid);

                            try {
                              // Update the Firestore document with the selected radio button text
                              await userDocRef.update({
                                "selectedRange": _selectedRange,
                              });

                              // Data updated successfully
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    'Selected range updated successfully.'),
                                backgroundColor: Colors.green,
                              ));

                              // Navigate to the HomeTwoScreen
                              Navigator.pushReplacementNamed(
                                  context, HomeTwoScreen.screenRoute);
                            } catch (error) {
                              // Handle the error if any
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text('Failed to update selected range.'),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
