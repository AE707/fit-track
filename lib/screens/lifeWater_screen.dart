import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LifeWaterScreen extends StatefulWidget {
  static const String screenRoute = 'lifeWater_screen';
  const LifeWaterScreen({super.key});

  @override
  State<LifeWaterScreen> createState() => _LifeWaterScreenState();
}

class _LifeWaterScreenState extends State<LifeWaterScreen> {
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
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                          padding:
                              const EdgeInsets.only(left: 40, right: 30, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  "Life Water",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 35,
                                    //fontWeight: FontWeight.bold,
                                    color: Color(0xff110f2d),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "H",
                                      style: GoogleFonts.bebasNeue(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff110f2d),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 55),
                                    child: Text(
                                      "O",
                                      style: GoogleFonts.bebasNeue(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff110f2d),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 40, top: 45),
                                    child: Text(
                                      "2",
                                      style: GoogleFonts.bebasNeue(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff110f2d),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpace(25),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: Text(
                                        "Up to 60% of the human adult body is water. According to Mitchell and others (1945), the brain and heart are composed of 73% water, and the lungs are about 83% water. The skin contains 64% water, muscles and kidneys are 79%, and even the bones are watery: 31%.",
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 20,
                                          
                                          color: Colors.white,
                                        ),
                                      ),
                ),
                ],),
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
