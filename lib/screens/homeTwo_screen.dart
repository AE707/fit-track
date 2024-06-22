import 'package:fit_track/screens/balance_screen.dart';
import 'package:fit_track/screens/heartBeat_screen.dart';
import 'package:fit_track/screens/lifeWater_screen.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/screens/sleepy_screen.dart';
import 'package:fit_track/screens/temperature_screen.dart';
import 'package:fit_track/screens/whereAmI_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTwoScreen extends StatefulWidget {
  static const String screenRoute = 'homeTwo_screen';
  const HomeTwoScreen({super.key});

  @override
  State<HomeTwoScreen> createState() => _HomeTwoScreenState();
}

class _HomeTwoScreenState extends State<HomeTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 32, 77, 1),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          //left: 15,
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
                addHorizontalSpace(247.5),
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
            addVerticalSpace(35),
            Padding(
              padding: const EdgeInsets.only(left: 50,top:30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 160,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: Color(0x8c7fc7ce),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, HeartBeatScreen.screenRoute);
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: Image.asset(
                                  "assets/heart.png",
                                  width: 100,
                                  height: 130,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90),
                                child: Image.asset(
                                  "assets/heart1.png",
                                  width: 25,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 90, top: 8),
                                child: Image.asset(
                                  "assets/heart2.png",
                                  width: 25,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 35, top: 30),
                                child: Text(
                                  "86",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 65,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff110f2d),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      addHorizontalSpace(8),
                      Container(
                        width: 160,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: Color(0x8c7fc7ce),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, TemperatureScreen.screenRoute);
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 85, bottom: 105),
                                child: Image.asset(
                                  "assets/tem.png",
                                  width: 30,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 32.5),
                                child: Text(
                                  "36,8",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff110f2d),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(15),
                  Row(
                    children: [
                      Container(
                        width: 160,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: Color(0x8c7fc7ce),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, WhereAmIScreen.screenRoute);
                          },
                          child: Center(
                            child: Image.asset(
                              'assets/localisation.png',
                              height: 130,
                            ),
                          ),
                        ),
                      ),
                      addHorizontalSpace(8),
                      Container(
                        width: 160,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: Color(0x8c7fc7ce),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, BalanceScreen.screenRoute);
                          },
                          child: Center(
                            child: Image.asset(
                              'assets/balance.png',
                              height: 90,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(15),
                  Row(
                    children: [
                      Container(
                        width: 160,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: Color(0x8c7fc7ce),
                        ),
                        child: MaterialButton(
                          onPressed: () {Navigator.pushNamed(
                                context, LifeWaterScreen.screenRoute);},
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  "H",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff110f2d),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 65),
                                child: Text(
                                  "O",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff110f2d),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 45, top: 45),
                                child: Text(
                                  "2",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff110f2d),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      addHorizontalSpace(8),
                      Container(
                        width: 160,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          color: Color(0x8c7fc7ce),
                        ),
                        child: MaterialButton(
                          onPressed: () {Navigator.pushNamed(
                                context, SleepyScreen.screenRoute);},
                          child: Center(
                            child: Image.asset(
                              'assets/sleep.png',
                              height: 120,
                            ),
                          ),
                        ),
                      ),
                    ],
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
