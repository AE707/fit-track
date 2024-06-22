import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_track/screens/signIn_screen.dart';
import 'package:fit_track/widgets/my_textField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const String screenRoute = 'forgotPassword_screen';


  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! Check your email'),
            );
          }
      );

    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInScreen(onTap: () {  },)));
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
              padding: const EdgeInsets.only(top: 230),
              child: Container(
                height: 200,
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
                        'Forgot Password',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 25,
                          
                          color: Color.fromRGBO(35, 32, 77, 1),
                        ),
                      ),
                      MyTextField(
                        controller: _emailController,
                        labeltext: 'Email',
                        hinttext: 'Email',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:35),
                        child: MaterialButton(
                          onPressed: passwordReset,
                          child:  Text('Send Email',style: GoogleFonts.bebasNeue(
                          fontSize: 20,
                          
                          color: Color.fromRGBO(127, 199, 206, 1),
                        ),),
                          elevation: 10,
                          splashColor: Color(0x5D6978),
                          color: Color.fromRGBO(35, 32, 77, 1),
                          height: 50,
                          minWidth: 200,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

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
