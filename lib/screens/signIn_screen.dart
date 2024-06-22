//import 'package:app_pfe/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/screens/forgotPassword_screen.dart';
import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/welcome_screen.dart';
import 'package:fit_track/widgets/my_textField.dart';
import 'package:fit_track/widgets/my_textFieldPass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button.dart';

class SignInScreen extends StatefulWidget {

  static const String screenRoute = 'signIn_screen';
  final Function()? onTap;

  const SignInScreen({super.key, required this.onTap});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Navigate to the HomeTwoScreen after successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeTwoScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
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
                        ),
                      ),
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
              padding: const EdgeInsets.only(top: 200, left: 20),
              child: Container(
                height: 325,
                width: 250,
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
                        'SIGN IN',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30,
                          //fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(35, 32, 77, 1),
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: TextButton(
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 13,
                                  color: Color.fromRGBO(35, 32, 77, 1),
                                ),
                                textAlign: TextAlign.end,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, ForgotPasswordScreen.screenRoute);
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Button(
                          text: "SIGN IN",
                          onTap: signUserIn,

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
