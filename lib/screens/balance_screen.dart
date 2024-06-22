import 'package:firebase_database/firebase_database.dart';
import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceScreen extends StatefulWidget {
  static const String screenRoute = 'balance_screen';
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {

  String situation = '' ;
  String sitC = '' ;
  String gyrx = "";
  String gyry = "";
  String gyrz = "";
  String acx = "";
  String acy = "";
  String acz = "";
  int color = 0;

  @override
  Widget build(BuildContext context) {

    final DatabaseReference databaseRefCapSituation =
    FirebaseDatabase.instance.ref().child('cap/balance/situation');
    databaseRefCapSituation.onValue.listen((event) {
      setState(() {
        situation = event.snapshot.value.toString();
      });
    });

final DatabaseReference databaseRefCapSitC =
    FirebaseDatabase.instance.ref().child('cap/balance/sitC');
    databaseRefCapSitC.onValue.listen((event) {
      setState(() {
        sitC = event.snapshot.value.toString();
      });
    });
color = int.parse('$sitC' );
    final DatabaseReference databaseRefCapGyrx =
    FirebaseDatabase.instance.ref().child('cap').child('balance').child('gyroscope').child('gyrx');
    databaseRefCapGyrx.onValue.listen((event) {
      setState(() {
        gyrx = event.snapshot.value.toString();
      });
    });

    final DatabaseReference databaseRefCapGyry =
    FirebaseDatabase.instance.ref().child('cap/balance/gyroscope/gyry');
    databaseRefCapGyry.onValue.listen((event) {
      setState(() {
        gyry = event.snapshot.value.toString();
      });
    });

    final DatabaseReference databaseRefCapGyrz =
    FirebaseDatabase.instance.ref().child('cap/balance/gyroscope/gyrz');
    databaseRefCapGyrz.onValue.listen((event) {
      setState(() {
        gyrz = event.snapshot.value.toString();
      });
    });

final DatabaseReference databaseRefCapAcx =
    FirebaseDatabase.instance.ref().child('cap').child('balance').child('accelerometer').child('acx');
    databaseRefCapAcx.onValue.listen((event) {
      setState(() {
        acx = event.snapshot.value.toString();
      });
    });

    final DatabaseReference databaseRefCapAcy =
    FirebaseDatabase.instance.ref().child('cap/balance/accelerometer/acy');
    databaseRefCapAcy.onValue.listen((event) {
      setState(() {
        acy = event.snapshot.value.toString();
      });
    });

    final DatabaseReference databaseRefCapAcz =
    FirebaseDatabase.instance.ref().child('cap/balance/accelerometer/acz');
    databaseRefCapAcz.onValue.listen((event) {
      setState(() {
        acz = event.snapshot.value.toString();
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
                      color: Color(0xFFFFFFFF),
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
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Balance",
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 35,
                                      //fontWeight: FontWeight.bold,
                                      color: Color(0xff110f2d),
                                    ),
                                  ),
                                ),
                                addHorizontalSpace(20),
                                Image.asset(
                                  'assets/balance.png',
                                  height: 70,
                                ),
                              ],
                            ),
                            addVerticalSpace(30),
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
                                    TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Situation',
          style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 20),
        ),
      ),
      addHorizontalSpace(25),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$situation',
          
          style: GoogleFonts.bebasNeue(color: Color(color), fontSize: 20),
        ),
      )
    ],
  ),
                                    

                                  ],
                                ),
                              ),
                            ),
                            addVerticalSpace(10),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                "Gyroscope",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                      ),
                            ),
                            addVerticalSpace(10),
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
                                    _buildTableRow("      X  :", '$gyrx' ),
                                    _buildTableRow("      Y  :", '$gyry' ),
                                    _buildTableRow("      Z  :", '$gyrz' ),
                                  ],
                                ),
                              ),
                            ),
                            addVerticalSpace(10),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                "Accelerometer",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                                ),
                            ),
                            addVerticalSpace(10),
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
                                    _buildTableRow("      X  :", '$acx' ),
                                    _buildTableRow("      Y  :", '$acy' ),
                                    _buildTableRow("      Z  :", '$acz' ),
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
