import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:fit_track/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ChangePassScreen extends StatefulWidget {
  static const String screenRoute = 'changePass_screen';
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final currentUser = FirebaseAuth.instance.currentUser;

  String? _errorMessage;

  // Function to change the user's password with re-authentication
  Future<void> _changePassword(
      String currentPassword, String newPassword) async {
    try {
      // Re-authenticate the user with their current password
      final AuthCredential credential = EmailAuthProvider.credential(
        email: currentUser!.email!,
        password: currentPassword,
      );

      await currentUser!.reauthenticateWithCredential(credential);

      // After successful re-authentication, update the password
      await currentUser!.updatePassword(newPassword);
      // Get the user's UID
      String userUid = FirebaseAuth.instance.currentUser!.uid;

      // Reference to the Firestore collection and document
      final userDocRef =
          FirebaseFirestore.instance.collection("users").doc(userUid);
      // Update the password in Firestore
      await userDocRef.update({
        "password": newPassword,
        // Assuming you have a "password" field in your user document
      });

      // Password changed successfully
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password changed successfully.'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushNamed(context, ProfilScreen.screenRoute);
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    }
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
                  Navigator.pushNamed(context, ProfilScreen.screenRoute);
                },
                child: Image.asset(
                  "assets/exit.png",
                ),
              ),
            ),
            addVerticalSpace(100),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Change Password",
                style: GoogleFonts.bebasNeue(
                  fontSize: 28,
                  color: Color(0xff7fc7ce),
                ),
              ),
            ),
            addVerticalSpace(20),
            Container(
              width: 282,
              height: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff7fc7ce)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    addVerticalSpace(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: textField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your current password.';
                          }
                          return null;
                        },
                        controller: _currentPasswordController,
                        labeltext: "Current Password",
                        hinttext: "Current Password",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: textField(
                        controller: _newPasswordController,
                        labeltext: "New Password",
                        hinttext: "New Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a new password.';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: textField(
                        controller: _confirmPasswordController,
                        labeltext: "Retype The New Password",
                        hinttext: "Retype The New Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your new password.';
                          }
                          if (value != _newPasswordController.text) {
                            return 'Passwords do not match.';
                          }
                          return null;
                        },
                      ),
                    ),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    addVerticalSpace(20),
                    MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final currentPassword =
                              _currentPasswordController.text;
                          final newPassword = _newPasswordController.text;
                          _changePassword(currentPassword, newPassword);
                        }
                      },
                      child: Container(
                        width: 165,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x33110f2d)),
                        child: Center(
                          child: Text(
                            "Change  Password",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(159, 17, 15, 45),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
