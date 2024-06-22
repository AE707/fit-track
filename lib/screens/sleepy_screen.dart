import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepyScreen extends StatefulWidget {
  static const String screenRoute = 'sleepy_screen';
  const SleepyScreen({super.key});

  @override
  State<SleepyScreen> createState() => _SleepyScreenState();
}

class _SleepyScreenState extends State<SleepyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 32, 77, 1),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          //left: 80,
          //right: 20,
          //bottom: 70,
        ),
        child: Column(
          children: [
            Row(
              children: [
                //addHorizontalSpace(8),
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
                addHorizontalSpace(65),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Fit Track",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 44,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                addHorizontalSpace(48.5),
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
            addVerticalSpace(80),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeTwoScreen.screenRoute);
                    },
                    child: Container(
                      width: 325,
                      height: 550,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                        color: Color(0x8c7fc7ce),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 40, top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    "Sleepy",
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 35,
                                      //fontWeight: FontWeight.bold,
                                      color: Color(0xff110f2d),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  'assets/sleep.png',
                                  height: 90,
                                ),
                              ],
                            ),
                          ),
                          addVerticalSpace(40),
                          Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: Text(
                              "Approximately 75% of sleep is spent in the NREM stages, with the majority spent in the N2 stage.[14] A typical night's sleep consists of 4 to 5 sleep cycles, with the progression of sleep stages in the following order: N1, N2, N3, N2, REM.[15] A complete sleep cycle takes roughly 90 to 110 minutes.",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 20,
                                color: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
