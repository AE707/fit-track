import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:fit_track/widgets/textFieldTwo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagePushScreen extends StatefulWidget {
  static const String screenRoute = 'messagePush_screen';
  const MessagePushScreen({super.key});

  @override
  State<MessagePushScreen> createState() => _MessagePushScreenState();
}

class _MessagePushScreenState extends State<MessagePushScreen> {
  
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
              child:MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SettingScreen.screenRoute);
                  },
                  child: Image.asset(
                    "assets/setting.png",
                    width: 40,
                    height: 50,
                  ),
                ),
            ),
            addVerticalSpace(150),
            Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Message Push",
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
                  color: Color(0xff7fc7ce),),
              child: Column(
                children: [
                  addVerticalSpace(80),
                  Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40),
                        child: textFieldTwo(
                          labeltext: "+Add Number",
                          hinttext: "+Add Number",
                        ),
                      ),
                  
                 addVerticalSpace(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 40,right: 40),
                        child: textFieldTwo(
                          labeltext: "+Add Email",
                          hinttext: "+Add Email",
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
