import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/range_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:fit_track/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String screenRoute = 'home_screen';
  final Function()? onTap;
  const HomeScreen({super.key, required this.onTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                addHorizontalSpace(54),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "Safe Area",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 44,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                addHorizontalSpace(50),
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
            Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Container(
                height: 480,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Select your safe area",
                          style: GoogleFonts.bebasNeue(
                            fontSize: 25,
                            color: Color(0xff110f2d),
                          ),
                        ),
                      ),
                      addVerticalSpace(20),
                      MyButton(
                        sizeT: 20,
                        color: Color.fromRGBO(35, 32, 77, 1),
                        colorT: Color.fromRGBO(127, 199, 206, 1),
                        height: 2,
                        width: 80,
                        title: 'Select',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RangeScreen.screenRoute);
                        },
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
