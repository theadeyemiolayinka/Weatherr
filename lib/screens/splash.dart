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

const apikey = '96504c52c6474be325d69d4514700004';
const weatherapi = 'https://api.openweathermap.org/data/2.5/onecall';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHandler networkHandler = NetworkHandler(
        '$weatherapi?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly&appid=$apikey&units=metric'
        // 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric',
        );
    var weatherData = await networkHandler.getData();

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return WeatherApp(weatherData);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 13, 48),
      body: Center(
        child: Column(
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


//  double temperature = decodedData['main']['temp'];
//       int condition = decodedData['weather'][0]['id'];
//       String cityName = decodedData['name'];

//       print(temperature);
//       print(condition);
//       print(cityName);
