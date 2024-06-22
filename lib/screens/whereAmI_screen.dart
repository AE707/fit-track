import 'dart:async';

import 'package:fit_track/helpers/location-helper.dart';
import 'package:fit_track/screens/homeTwo_screen.dart';
import 'package:fit_track/screens/profil_screen.dart';
import 'package:fit_track/screens/setting_screen.dart';
import 'package:fit_track/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WhereAmIScreen extends StatefulWidget {
  static const String screenRoute = 'whereAmI_screen';
  const WhereAmIScreen({super.key});

  @override
  State<WhereAmIScreen> createState() => _WhereAmIScreenState();
}



class _WhereAmIScreenState extends State<WhereAmIScreen> {

  static Position? position;

  Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
    );

  Future<void> getCurrentLocation() async{
    await locationHelper.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
        
      });
      
    }

    @override
    iniState() {
    super.initState();
    getCurrentLocation();
}

    Widget BuildMap(){
      return GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition:  _myCurrentLocationCameraPosition,
        onMapCreated: (GoogleMapController controller){
            _mapController.complete(controller);
        },
      );
    }
  
  Future<void> _goToMyCurrentLocation () async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
    
  }
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
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 20, top: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Where Am I ?",
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 35,
                                      //fontWeight: FontWeight.bold,
                                      color: Color(0xff110f2d),
                                    ),
                                  ),
                                ),
                                addHorizontalSpace(20),
                                Image.asset(
                                  'assets/localisation.png',
                                  height: 80,
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                position != null ? BuildMap() : Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                  )
                              ],
                            ),
                              Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
                              child: FloatingActionButton(
                                backgroundColor: Colors.blue,
                                onPressed: _goToMyCurrentLocation,
                                child: Icon(Icons.place, color: Colors.white),
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
