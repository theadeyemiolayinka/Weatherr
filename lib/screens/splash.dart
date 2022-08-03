import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import 'weather_app.dart';
import '../network.dart';
import '../location.dart';

const apikey = '0a765840c0d621e8233372c416edc6cf';
const weatherapi = 'https://api.openweathermap.org/data/2.5/onecall';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? errormsg = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Location location = Location();
    await location.getCurrentLocation();

    if (location.latitude == null || location.longitude == null) {
      setState(() {
        errormsg = location.error == null
            ? "Please, check your internet connectivity."
            : location.error;
      });
    } else {
      NetworkHandler networkHandler = NetworkHandler(
        '$weatherapi?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly&appid=$apikey&units=metric',
      );
      var weatherData = await networkHandler.getData();
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return WeatherApp(weatherData);
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 13, 48),
      body: Center(
        child: errormsg != null
            ? AlertDialog(
                title: Text(
                  'Error',
                  style: TextStyle(color: Color.fromRGBO(200, 10, 10, 0.8)),
                ),
                content: Text(errormsg.toString()))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Weatherr',
                    style: GoogleFonts.lato(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(200, 200, 200, 0.8),
                    ),
                  ),
                  Container(
                      width: 200,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.yellow,
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 12.5, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 12.5, 0, 0),
                    child: GestureDetector(
                      child: Text(
                        'TheAdeyemiOlayinka',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () async {
                        if (await canLaunch(
                            "https://github.com/theadeyemiolayinka")) {
                          await launch("https://github.com/theadeyemiolayinka");
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
