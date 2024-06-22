import 'package:fit_track/pages/app_localizations.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguagesScreen extends StatefulWidget {
  static const String screenRoute = 'languages_screen';
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  // Store the current locale
  Locale _currentLocale = Locale('en', '');

  // Function to change the app's locale
  void _changeLocale(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

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
              padding: const EdgeInsets.only(left: 300, top: 10),
              child: MaterialButton(
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
            addVerticalSpace(100),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Languages",
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
                  color: Color(0xff7fc7ce)),
              child: Column(
                children: [
                  addVerticalSpace(60),
                  MaterialButton(
                    onPressed: () {
                      _changeLocale(Locale('ar', '')); // Change to Arabic
                    },
                    child: Container(
                      width: 170,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0x33110f2d)),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('ar'), // Translate 'Arabic'
                          style: GoogleFonts.bebasNeue(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(159, 17, 15, 45),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  MaterialButton(
                    onPressed: () {
                      _changeLocale(Locale('en', '')); // Change to English
                    },
                    child: Container(
                      width: 170,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0x33110f2d)),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('en'), // Translate 'English'
                          style: GoogleFonts.bebasNeue(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(159, 17, 15, 45),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  MaterialButton(
                    onPressed: () {
                      _changeLocale(Locale('fr', '')); // Change to French
                    },
                    child: Container(
                      width: 170,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0x33110f2d)),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('fr'), // Translate 'French'
                          style: GoogleFonts.bebasNeue(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(159, 17, 15, 45),
                          ),
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
