import 'package:fit_track/theme/theme_manager.dart';
import 'package:flutter/material.dart';
//import 'package:app_pfe/theme/theme_constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeManager _themeManager = ThemeManager();
class MyMenuButton extends StatefulWidget {
  const MyMenuButton({super.key});

  @override
  State<MyMenuButton> createState() => _MyMenuButtonState();
}

class _MyMenuButtonState extends State<MyMenuButton> {
  //bool isSwitched = false;
  @override
void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }
@override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    //TextTheme _textTheme = Theme.of(context).textTheme;
    //bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 55, left: 350),
      child: PopupMenuButton(
        color: Color.fromRGBO(127, 199, 206, 1),
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Row(
              children: [
                Icon(
                  Icons.translate_rounded,
                  size: 20,
                  color: Color.fromRGBO(35, 32, 77, 1),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Language',
                  style:  GoogleFonts.bebasNeue(
                          fontSize: 22,
                          color: Color.fromARGB(120, 17, 15, 45),
                        ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Icon(
                  Icons.brightness_4_outlined,
                  size: 20,
                  color: Color.fromRGBO(35, 32, 77, 1),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Dark Mode',
                  style: GoogleFonts.bebasNeue(
                          fontSize: 22,
                          
                          color: Color.fromARGB(120, 17, 15, 45),
                        ),
                ),
                SizedBox(
                  width: 20,
                ),
                Switch(

                  activeColor: Colors.white,
                  activeTrackColor: Color.fromRGBO(35, 32, 77, 0.785),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Color.fromRGBO(35, 32, 77, 1),

                  value: _themeManager.themeMode == ThemeMode.dark,
                  onChanged: (newValue) {
                    _themeManager.toggleTheme(newValue);
                  },
                ),
              ],
            ),
          ),
        ],
        child: Icon(
          Icons.more_vert,
          size: 28.0,
          color: Color.fromRGBO(127, 199, 206, 1),
        ),
      ),
    );
  }
}


