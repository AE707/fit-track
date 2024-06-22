import 'package:fit_track/screens/device_screen.dart';
import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/home_screen.dart';
import 'package:fit_track/screens/languages_screen.dart';
import 'package:fit_track/screens/messagePush_screen.dart';
import 'package:fit_track/screens/sos_screen.dart';
import 'package:fit_track/screens/welcome_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  static const String screenRoute = 'setting_screen';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool light = true;
  bool light1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 32, 77, 1),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 60),
              child: Container(
                width: 340,
                height: 650,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff7fc7ce)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        addHorizontalSpace(115),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            "Setting",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 40,
                              //fontWeight: FontWeight.bold,
                              color: Color(0xff110f2d),
                              //decoration: TextDecoration.underline,
                              //decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ),
                        addHorizontalSpace(37),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, HomeTwoScreen.screenRoute);
                          },
                          child: Image.asset(
                            "assets/setting2.png",
                            width: 40,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(60),
                    MaterialButton(
                      onPressed: () {Navigator.pushNamed(
                            context, MessagePushScreen.screenRoute);},
                      child: Container(
                        width: 161,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(71, 17, 15, 45)),
                        child: Center(
                          child: Text(
                            "Message Push",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              color: Color.fromARGB(120, 17, 15, 45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, SosScreen.screenRoute);
                      },
                      child: Container(
                        width: 161,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(71, 17, 15, 45)),
                        child: Center(
                          child: Text(
                            "SOS Contacts",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              color: Color.fromARGB(120, 17, 15, 45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                  onTap: () {})), // Navigate to the HomeScreen
                        );
                      },
                      child: Container(
                        width: 161,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(71, 17, 15, 45)),
                        child: Center(
                          child: Text(
                            "Change Places",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              color: Color.fromARGB(120, 17, 15, 45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {Navigator.pushNamed(
                            context, DeviceScreen.screenRoute);},
                      child: Container(
                        width: 161,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(71, 17, 15, 45)),
                        child: Center(
                          child: Text(
                            "Device",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              color: Color.fromARGB(120, 17, 15, 45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        width: 161,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(71, 17, 15, 45)),
                        child: Center(
                          child: Row(
                            children: [
                              addHorizontalSpace(20),
                              Text(
                                "Vibrate Setting",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 16,
                                  color: Color.fromARGB(120, 17, 15, 45),
                                ),
                              ),
                              Switch(
                                activeColor: Color.fromARGB(255, 141, 222, 229),
                                activeTrackColor:
                                    Color.fromRGBO(35, 32, 77, 0.93),
                                inactiveThumbColor:
                                    Color.fromARGB(255, 141, 222, 229),
                                inactiveTrackColor:
                                    Color.fromRGBO(35, 32, 77, 0.827),
                                value: light,
                                onChanged: (value) {
                                  setState(() {
                                    light = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        width: 161,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(71, 17, 15, 45)),
                        child: Center(
                          child: Row(
                            children: [
                              addHorizontalSpace(40),
                              Text(
                                "Dark Mode",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 16,
                                  color: Color.fromARGB(120, 17, 15, 45),
                                ),
                              ),
                              addHorizontalSpace(5),
                              Switch(
                                activeColor: Color.fromARGB(255, 141, 222, 229),
                                activeTrackColor:
                                    Color.fromRGBO(35, 32, 77, 0.93),
                                inactiveThumbColor:
                                    Color.fromARGB(255, 141, 222, 229),
                                inactiveTrackColor:
                                    Color.fromRGBO(35, 32, 77, 0.827),
                                value: light1,
                                onChanged: (value) {
                                  setState(() {
                                    light1 = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, LanguagesScreen.screenRoute);
                      },
                      child: Container(
                        width: 161,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromARGB(71, 17, 15, 45)),
                        child: Center(
                          child: Text(
                            "Languages",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              color: Color.fromARGB(120, 17, 15, 45),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, WelcomeScreen.screenRoute);
                      },
                      child: Container(
                        width: 161,
                        height: 31,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(35, 32, 77, 1)),
                        child: Center(
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 17,
                              color: Color(0xff7fc7ce),
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
