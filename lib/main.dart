import 'package:firebase_core/firebase_core.dart';
import 'package:fit_track/screens/balance_screen.dart';
import 'package:fit_track/screens/changePass_screen.dart';
import 'package:fit_track/screens/device_screen.dart';
import 'package:fit_track/screens/forgotPassword_screen.dart';
import 'package:fit_track/screens/heartBeat_screen.dart';
import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/languages_screen.dart';
import 'package:fit_track/screens/lifeWater_screen.dart';
import 'package:fit_track/screens/messagePush_screen.dart';
import 'package:fit_track/screens/range_screen.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/screens/sleepy_screen.dart';
import 'package:fit_track/screens/sos_screen.dart';
import 'package:fit_track/screens/temperature_screen.dart';
import 'package:fit_track/screens/welcome_screen.dart';
import 'package:fit_track/screens/whereAmI_screen.dart';
//import 'package:fit_track/theme/theme_constants.dart';
import 'package:fit_track/theme/theme_manager.dart';
//import 'package:app_pfe/widgets/my_menuButton.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    
    home: const WelcomeScreen(),
    routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        ForgotPasswordScreen.screenRoute: (context) => ForgotPasswordScreen(),
        HomeTwoScreen.screenRoute: (context) => HomeTwoScreen(),
        ProfilScreen.screenRoute: (context) => ProfilScreen(),
        SettingScreen.screenRoute: (context) => SettingScreen(),
        LanguagesScreen.screenRoute: (context) => LanguagesScreen(),
        ChangePassScreen.screenRoute: (context) => ChangePassScreen(),
        HeartBeatScreen.screenRoute: (context) => HeartBeatScreen(),
        TemperatureScreen.screenRoute: (context) => TemperatureScreen(),
        WhereAmIScreen.screenRoute: (context) => WhereAmIScreen(),
        BalanceScreen.screenRoute: (context) => BalanceScreen(),
        LifeWaterScreen.screenRoute: (context) => LifeWaterScreen(),
        SleepyScreen.screenRoute: (context) => SleepyScreen(),
        RangeScreen.screenRoute: (context) => RangeScreen(),
        SosScreen.screenRoute: (context) => SosScreen(),
        MessagePushScreen.screenRoute: (context) => MessagePushScreen(),
        DeviceScreen.screenRoute: (context) => DeviceScreen(),
      },

    );
  }
}
