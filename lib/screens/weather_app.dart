import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:intl/intl.dart';

import '../models/weather_locations.dart';
import '../widgets/buildin_transform.dart';
import '../widgets/single_weather.dart';

class WeatherApp extends StatefulWidget {
  final data;
  WeatherApp(this.data);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late String condition;

  int _currentPage = 0;
  late String bgImg1;
  late String bgImg2;
  late String bgImg3;
  late String bgImg4;

  late List send;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateApp(widget.data);
    send = createList(widget.data);
  }

  updateApp(dynamic weatherData) {
    condition = weatherData['current']['weather'][0]['main'];
    if (condition == 'Clear') {
      bgImg1 = 'assets/sunny.jpg';
    } else if (condition == 'Rain' ||
        condition == 'Thunderstorm' ||
        condition == 'Drizzle') {
      bgImg1 = 'assets/rainy.jpg';
    } else if (condition == 'Clouds') {
      bgImg1 = 'assets/cloudy.jpeg';
    } else {
      bgImg1 = 'assets/disaster.jpeg';
    }

    condition = weatherData['daily'][1]['weather'][0]['main'];
    if (condition == 'Clear') {
      bgImg2 = 'assets/sunny.jpg';
    } else if (condition == 'Rain' ||
        condition == 'Thunderstorm' ||
        condition == 'Drizzle') {
      bgImg2 = 'assets/rainy.jpg';
    } else if (condition == 'Clouds') {
      bgImg2 = 'assets/cloudy.jpeg';
    } else {
      bgImg2 = 'assets/disaster.jpeg';
    }

    condition = weatherData['daily'][2]['weather'][0]['main'];
    if (condition == 'Clear') {
      bgImg3 = 'assets/sunny.jpg';
    } else if (condition == 'Rain' ||
        condition == 'Thunderstorm' ||
        condition == 'Drizzle') {
      bgImg3 = 'assets/rainy.jpg';
    } else if (condition == 'Clouds') {
      bgImg3 = 'assets/cloudy.jpeg';
    } else {
      bgImg3 = 'assets/disaster.jpeg';
    }

    condition = weatherData['daily'][3]['weather'][0]['main'];
    if (condition == 'Clear') {
      bgImg4 = 'assets/sunny.jpg';
    } else if (condition == 'Rain' ||
        condition == 'Thunderstorm' ||
        condition == 'Drizzle') {
      bgImg4 = 'assets/rainy.jpg';
    } else if (condition == 'Clouds') {
      bgImg4 = 'assets/cloudy.jpeg';
    } else {
      bgImg4 = 'assets/disaster.jpeg';
    }
  }

  createList(Map weather) {
    Map weatherData = weather;
    return [
      WeatherLocation(
          city: weatherData['timezone'],
          dateTime: DateFormat('HH:mm a - EEEE dd/MM/yyyy').format(
              DateTime.fromMillisecondsSinceEpoch(
                  weatherData["current"]["dt"].toInt() * 1000)),
          temparature:
              weatherData['current']['temp'].toInt().toString() + "\u2103",
          weatherType: weatherData['current']['weather'][0]['main'],
          iconUrl: "http://openweathermap.org/img/w/" +
              weatherData['current']['weather'][0]['icon'] +
              ".png",
          img: bgImg1,
          wind: weatherData['current']['wind_speed'].toInt(),
          rain: weatherData['current']['dew_point'].toInt(),
          humidity: weatherData['current']['humidity'].toInt()),
      WeatherLocation(
          city: weatherData['timezone'],
          dateTime: DateFormat('EEEE dd/MM/yyyy').format(
              DateTime.fromMillisecondsSinceEpoch(
                  weatherData["daily"][1]["dt"].toInt() * 1000)),
          temparature:
              weatherData['daily'][1]['temp']['day'].toInt().toString() +
                  "\u2103",
          weatherType: weatherData['daily'][1]['weather'][0]['main'],
          iconUrl: "http://openweathermap.org/img/w/" +
              weatherData['daily'][1]['weather'][0]['icon'] +
              ".png",
          img: bgImg3,
          wind: weatherData['daily'][1]['wind_speed'].toInt(),
          rain: weatherData['daily'][1]['dew_point'].toInt(),
          humidity: weatherData['daily'][1]['humidity'].toInt()),
      WeatherLocation(
          city: weatherData['timezone'],
          dateTime: DateFormat('EEEE dd/MM/yyyy').format(
              DateTime.fromMillisecondsSinceEpoch(
                  weatherData["daily"][2]["dt"].toInt() * 1000)),
          temparature:
              weatherData['daily'][2]['temp']['day'].toInt().toString() +
                  "\u2103",
          weatherType: weatherData['daily'][2]['weather'][0]['main'],
          iconUrl: "http://openweathermap.org/img/w/" +
              weatherData['daily'][2]['weather'][0]['icon'] +
              ".png",
          img: bgImg4,
          wind: weatherData['daily'][2]['wind_speed'].toInt(),
          rain: weatherData['daily'][2]['dew_point'].toInt(),
          humidity: weatherData['daily'][2]['humidity'].toInt()),
      WeatherLocation(
          city: weatherData['timezone'],
          dateTime: DateFormat('EEEE dd/MM/yyyy').format(
              DateTime.fromMillisecondsSinceEpoch(
                  weatherData["daily"][3]["dt"].toInt() * 1000)),
          temparature:
              weatherData['daily'][3]['temp']['day'].toInt().toString() +
                  "\u2103",
          weatherType: weatherData['daily'][3]['weather'][0]['main'],
          iconUrl: "http://openweathermap.org/img/w/" +
              weatherData['daily'][3]['weather'][0]['icon'] +
              ".png",
          img: bgImg2,
          wind: weatherData['daily'][3]['wind_speed'].toInt(),
          rain: weatherData['daily'][3]['dew_point'].toInt(),
          humidity: weatherData['daily'][3]['humidity'].toInt()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        /*leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ), */
        /*  actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Menu Clicked!'),
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ], */
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 1, 13, 48)),
        child: Stack(
          children: [
            TransformerPageView(
              scrollDirection: Axis.horizontal,
              transformer: ScaleAndFadeTransformer(),
              viewportFraction: 0.8,
              onPageChanged: _onPageChanged,
              itemCount: 4,
              itemBuilder: (ctx, i) =>
                  SingleWeather(i, send, _onPageChanged, _currentPage),
            ),
          ],
        ),
      ),
    );
  }
}
