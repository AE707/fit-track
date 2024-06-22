import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/screens/home_screen.dart';
import 'package:fit_track/screens/welcome_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:fit_track/widgets/my_textField.dart';
import 'package:fit_track/widgets/my_textFieldPass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenRoute = 'signUp_screen';

  final Function()? onTap;

  const SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final braceletIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fireBaseInstance = FirebaseAuth.instance;

  Future<bool> signUserUp() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        // Create user in Firebase authentication
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Get the user's UID
        String userUid = FirebaseAuth.instance.currentUser!.uid;

        // Reference to the Firestore collection and document
        final userDocRef = FirebaseFirestore.instance.collection("users").doc(userUid);

        // User data to be stored in Firestore
        final newUserInfos = <String, dynamic>{
          "id": userUid,
          "email": emailController.text,
          "password": passwordController.text,
          "fullName": fullNameController.text,
          "user": userNameController.text,
          "phoneNumber": phoneController.text,
          "braceletID": braceletIdController.text,
        };

        // Set user data in Firestore
        await userDocRef.set(newUserInfos);

        // Sign-up successful
        return true;
      } else {
        // Passwords don't match
        passwordDontMatch();
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // Email is already registered
        wrongEmailMessage();
      } else {
        // Other authentication errors
        print("Firebase Auth Error: ${e.code}");
      }
      return false; // Sign-up failed
    } catch (error) {
      // Other errors
      print("Error: $error");
      return false; // Sign-up failed
    }
  }

  void handleSignUpButtonTap() async {
    bool passwordsMatch = passwordController.text == confirmPasswordController.text;
    bool signUpSuccess = false;

    if (!passwordsMatch) {
      passwordDontMatch();
    } else {
      signUpSuccess = await signUserUp();
      if (!signUpSuccess) {
        // Handle other errors, if needed
      }
    }

    if (signUpSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(onTap: () {})), // Navigate to the HomeScreen
      );
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          backgroundColor: Color.fromRGBO(29, 27, 65, 0.541),
          title: Text('Incorrect Email',style: GoogleFonts.bebasNeue(
                          fontSize: 20,
                          
                          color: Color.fromRGBO(127, 199, 206, 1),
                        ),),
        );
      },
    );
  }
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          backgroundColor: Color.fromRGBO(29, 27, 65, 0.541),
          title: Text('Incorrect password',style: GoogleFonts.bebasNeue(
                          fontSize: 20,
                          
                          color: Color.fromRGBO(127, 199, 206, 1),
                        ),),
        );
      },
    );
  }
  void passwordDontMatch() {
    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          backgroundColor: Color.fromRGBO(29, 27, 65, 0.541),
          title: Text("Password don't match",style: GoogleFonts.bebasNeue(
                          fontSize: 20,
                          
                          color: Color.fromRGBO(127, 199, 206, 1),
                        ),),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //double baseWidth = 377.0; // Define your new base width here
    //double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(35, 32, 77, 1),
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 10,
          right: 20,
          bottom: 70,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, WelcomeScreen.screenRoute);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 30,
                      color: Color.fromRGBO(127, 199, 206, 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 20),
              child: Container(
                height: 550,
                width: 255,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(127, 199, 206, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'SIGN UP',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30,
                          //fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(35, 32, 77, 1),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextField(
                        controller: fullNameController,
                        labeltext: 'Fullname',
                        hinttext: '',
                      ),
                      MyTextField(
                        controller: userNameController,
                        labeltext: 'Username',
                        hinttext: '',
                      ),
                      MyTextField(
                        controller: emailController,
                        labeltext: 'Email',
                        hinttext: 'Email',
                      ),
                      MyTextFieldPass(
                        controller: passwordController,
                        labeltext: 'Password',
                        hinttext: 'Entre your Password',
                      ),
                      MyTextFieldPass(
                        controller: confirmPasswordController,
                        labeltext: 'Confirm Password',
                        hinttext: 'Repeat your Password',
                      ),
                      MyTextField(
                        controller: phoneController,
                        labeltext: 'Phone Number',
                        hinttext: 'Entre your PhoneNumber',
                      ),
                      MyTextField(
                        controller: braceletIdController,
                        labeltext: 'Bracelet ID',
                        hinttext: 'Entre your Bracelet ID',
                      ),
                      addVerticalSpace(25),
                      Button(
                        text: "SIGN UP",
                        onTap: handleSignUpButtonTap,
                      ),
                      SingleChildScrollView(),
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
