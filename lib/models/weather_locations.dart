import 'package:flutter/material.dart';

class WeatherLocation {
  final String city;
  final String dateTime;
  final String temparature;
  final String weatherType;
  final String iconUrl;
  final String img;
  final int wind;
  final int rain;
  final int humidity;

  WeatherLocation({
    required this.city,
    required this.dateTime,
    required this.temparature,
    required this.weatherType,
    required this.iconUrl,
    required this.img,
    required this.wind,
    required this.rain,
    required this.humidity,
  });
}










// final gdat = {lat: 6.5569, lon: 3.3686, timezone: Africa/Lagos, timezone_offset: 3600, 
//current: {dt: 1659465988, sunrise: 1659418847, sunset: 1659463482, temp: 25.01, feels_like: 25.6, pressure: 1014, humidity: 78, dew_point: 20.91, uvi: 0, clouds: 20, visibility: 10000, wind_speed: 4.63, wind_deg: 250, 
//  weather: [{id: 801, main: Clouds, description: few clouds, icon: 02n}]}, 
//daily: [
//  {dt: 1659438000, sunrise: 1659418847, sunset: 1659463482, moonrise: 1659431880, moonset: 1659476340, moon_phase: 0.15, temp: {day: 26.7, min: 23.68, max: 26.71, night: 24.79, eve: 25.17, morn: 23.8}, feels_like: {day: 27.96, night: 25.28, eve: 25.67, morn: 24.27}, pressure: 1015, humidity: 64, dew_point: 19.3, wind_speed: 5.19, wind_deg: 224, wind_gust: 6.51, 
//    weather: [{id: 804, main: Clouds, description: overcast clouds, icon: 04d}], clouds: 99, pop: 0.1, uvi: 7.78}, 
//  {dt: 1659524400, sunrise: 1659505251, sunset: 1659549870, moonrise: 1659521040, moonset: 1659565200, moon_phase: 0.18, temp: {day: 26.3, min: 23.75, max: 27.17, night: 24.11, eve: 25.54, morn: 23.75}, feels_like: {day: 26.3, night: 24.61, eve: 25.98, morn: 24.24}, pressure: 1015, humidity: 68, dew_point: 19.86, wind_speed: 6.7, wind_deg: 225, wind_gust: 7.75, 
//    weather: [{id: 804, main: Clouds, description: overcast clouds, icon: 04d}], clouds: 99, pop: 0.13, uvi: 7.68}, 
//  {dt: 1659610800, sunrise: 1659591655, sunset: 1659636258, moonrise: 1659610320, moonset: 0, moon_phase: 0.22, temp: {day: 25.38, min: 23.62, max: 26.44, night: 24.26, eve: 25.29, morn: 23.75}, feels_like: {day: 25.83, night: 24.73, eve: 25.7, morn: 24.19}, pressure: 1015, humidity: 71, dew_point: 19.74, wind_speed: 5.88, wind_deg: 224, wind_gust: 7.08, 
//    weather: [{id: 804, main: Clouds, description: overcast clouds, icon: 04d}], clouds: 100, pop: 0.1, uvi: 5}, 
//  {dt: 1659697200, sunrise: 1659678059, sunset: 1659722644, moonrise: 1659699720, moonset: 1659654180, moon_phase: 0.25, temp: {day: 28.13, min: 23.46, max: 28.38, night: 24.89, eve: 25.66, morn: 23.53}, feels_like: {day: 29.2, night: 25.29, eve: 26, morn: 23.98}, pressure: 1015, humidity: 56, dew_point: 18.22, wind_speed: 5.73, wind_deg: 212, wind_gust: 6.55, 
//    weather: [{id: 804, main: Clouds, description: overcast clouds, icon: 04d}], clouds: 93, pop: 0.03, uvi: 11.14}, 
//  {dt: 1659783600, sunrise: 1659764462, sunset: 1659809030, moonrise: 1659789480, moonset: 1659743400, moon_phase: 0.29, temp: {day: 26.16, min: 23.39, max: 26.38, night: 24.46, eve: 24.81, morn: 23.39}, feels_like: {day: 26.16, night: 24.97, eve: 25.28, morn: 23.87}, pressure: 1015, humidity: 68, dew_point: 19.72, wind_speed: 5.22, wind_deg: 214, wind_gust: 5.63, 
//    weather: [{id: 804, main: Clouds, description: overcast clouds, icon: 04d}], clouds: 93, pop: 0, uvi: 8.54}, 
//  {dt: 1659870000, sunrise: 1659850864, sunset: 1659895416, moonrise: 1659879420, moonset: 1659832980, moon_phase: 0.32, temp: {day: 26.14, min: 24.04, max: 26.14, night: 24.26, eve: 24.97, morn: 24.04}, feels_like: {day: 26.14, night: 24.73, eve: 25.4, morn: 24.56}, pressure: 1014, humidity: 68, dew_point: 19.85, wind_speed: 6.06, wind_deg: 223, wind_gust: 6.84, 
//    weather: [{id: 500, main: Rain, description: light rain, icon: 10d}], clouds: 98, pop: 0.2, rain: 0.12, uvi: 7.16}, 
//  {dt: 1659956400, sunrise: 1659937266, sunset: 1659981800, moonrise: 1659969720, moonset: 1659922860, moon_phase: 0.36, temp: {day: 26.12, min: 23.46, max: 26.9, night: 24.42, eve: 25.05, morn: 23.46}, feels_like: {day: 26.12, night: 24.88, eve: 25.44, morn: 23.95}, pressure: 1014, humidity: 67, dew_point: 19.35, wind_speed: 5.03, wind_deg: 230, wind_gust: 6.26, 
//    weather: [{id: 500, main: Rain, description: light rain, icon: 10d}], clouds: 98, pop: 0.2, rain: 0.1, uvi: 8}, 
//  {dt: 1660042800, sunrise: 1660023668, sunset: 1660068184, moonrise: 1660060020, moonset: 1660013100, moon_phase: 0.4, temp: {day: 27.82, min: 23.35, max: 27.82, night: 24.77, eve: 25.15, morn: 23.35}, feels_like: {day: 29.4, night: 25.29, eve: 25.63, morn: 23.78}, pressure: 1014, humidity: 62, dew_point: 19.57, wind_speed: 5.57, wind_deg: 211, wind_gust: 6.31, 
//    weather: [{id: 803, main: Clouds, description: broken clouds, icon: 04d}], clouds: 84, pop: 0, uvi: 8}
// ]}
