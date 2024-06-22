import 'package:firebase_database/firebase_database.dart';
import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemperatureScreen extends StatefulWidget {
  static const String screenRoute = 'temperature_screen';
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {

  String tempW = "";
  String tempH = "";

  @override
  Widget build(BuildContext context) {

    final DatabaseReference databaseRefCapTemperatureW =
    FirebaseDatabase.instance.ref().child('cap/temperature/tempweather');
    databaseRefCapTemperatureW.onValue.listen((event) {
      setState(() {
        tempW = event.snapshot.value.toString();
      });
    });

    final DatabaseReference databaseRefCapTemperatureH =
    FirebaseDatabase.instance.ref().child('cap/temperature/temphuman');
    databaseRefCapTemperatureH.onValue.listen((event) {
      setState(() {
        tempH = event.snapshot.value.toString();
      });
    });

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
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 20, top: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Temperature",
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 30,
                                      //fontWeight: FontWeight.bold,
                                      color: Color(0xff110f2d),
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 85, bottom: 105),
                                      child: Image.asset(
                                        "assets/tem.png",
                                        width: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 25, top: 15),
                                      child: Text(
                                        "36,8",
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff110f2d),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            addVerticalSpace(20),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 400,
                                //color: Color(0x8c7fc7ce),
                                child: Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(1),
                                  },

                                  children: [
                                    _buildTableRow("Weather Temperature", '$tempW' + ' °'),
                                    _buildTableRow("Human Temperature ", '$tempH' + ' °C'),
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }
}
TableRow _buildTableRow(String deviceName, String value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          deviceName,
          style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 20),
        ),
      ),
      addHorizontalSpace(25),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  );
}