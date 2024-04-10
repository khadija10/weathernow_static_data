import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class Weather {
  final int max;
  final int min;
  final int current;
  final String name;
  final String day;
  final int wind;
  final int humidity;
  final int chanceRain;
  final String image;
  final String time;
  final String location;


   Weather({required this.max, required this.min, required this.current, required this.name, required this.day, required this.wind,
      required this.humidity, required this.chanceRain, required this.image, required this.time, required this.location});

}

List<Weather> todayMeteo = [
    Weather(max: 0, min: 0, current: 20, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/rainy_2d.png", time: "10:00", location: ""),
    Weather(max: 0, min: 0, current: 23, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/thunder_2d.png", time: "11:00", location: ""),
    Weather(max: 0, min: 0, current: 22, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/rainy_2d.png", time: "12:00", location: ""),
    Weather(max: 0, min: 0, current: 19, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/thunder_2d.png", time: "13:00", location: ""),
    Weather(max: 0, min: 0, current: 20, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/sunny_2d.png", time: "14:00", location: ""),
    Weather(max: 0, min: 0, current: 21, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/thunder_2d.png", time: "15:00", location: ""),
    Weather(max: 0, min: 0, current: 22, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/rainy_2d.png", time: "16:00", location: ""),
    Weather(max: 0, min: 0, current: 18, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/sunny_2d.png", time: "17:00", location: ""),
    Weather(max: 0, min: 0, current: 24, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/rainy_2d.png", time: "18:00", location: ""),
    Weather(max: 0, min: 0, current: 25, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/rainy_2d.png", time: "19:00", location: ""),
    Weather(max: 0, min: 0, current: 26, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/sunny_2d.png", time: "20:00", location: ""),
    Weather(max: 0, min: 0, current: 27, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/sunny_2d.png", time: "21:00", location: ""),
    Weather(max: 0, min: 0, current: 28, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/sunny_2d.png", time: "22:00", location: ""),
    Weather(max: 0, min: 0, current: 29, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/sunny_2d.png", time: "20:00", location: ""),
    Weather(max: 0, min: 0, current: 27, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/sunny_2d.png", time: "00:00", location: ""),
    Weather(max: 0, min: 0, current: 26, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/sunny_2d.png", time: "01:00", location: ""),
    Weather(max: 0, min: 0, current: 24, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/thunder_2d.png", time: "02:00", location: ""),
    Weather(max: 0, min: 0, current: 23, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/thunder_2d.png", time: "03:00", location: ""),
    Weather(max: 0, min: 0, current: 8, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/snow_2d.png", time: "04:00", location: ""),
    Weather(max: 0, min: 0, current: 9, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/snow_2d.png", time: "05:00", location: ""),
    Weather(max: 0, min: 0, current: 12, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/snow_2d.png", time: "06:00", location: ""),
    Weather(max: 0, min: 0, current: 11, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/snow_2d.png", time: "7:00", location: ""),
    Weather(max: 0, min: 0, current: 10, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/snow_2d.png", time: "8:00", location: ""),
    Weather(max: 0, min: 0, current: 10, name: "", day: "", wind: 0, humidity: 0, chanceRain: 0, image: "assets/snow_2d.png", time: "9:00", location: ""),

  ];
Weather currentTemperature = Weather(max: 0, min: 0, current: 21, name: "Orage", day: "Vendredi, 03 Juin", wind: 14, humidity: 20, chanceRain: 90, image: "assets/thunder.png", time: "", location: "Cité port");

Weather tommorowTemperature = Weather(max: 15, min: 10, current: 0, name: "Pluie", day: "", wind: 12, humidity: 20, chanceRain: 99, image: "assets/rainy.png", time: "", location: "");

List<Weather> cinqJoursDePlus = [
  Weather(max: 15, min: 10, current: 0, name: "Pluie", day: "Lun", wind: 12, humidity: 20, chanceRain: 99, image: "assets/rainy.png", time: "", location: ""),
  Weather(max: 15, min: 10, current: 0, name: "Pluie", day: "Mar", wind: 12, humidity: 20, chanceRain: 99, image: "assets/rainy.png", time: "", location: ""),
  Weather(max: 15, min: 10, current: 0, name: "Pluie", day: "Mer", wind: 12, humidity: 20, chanceRain: 99, image: "assets/rainy.png", time: "", location: ""),
  Weather(max: 15, min: 10, current: 0, name: "Pluie", day: "Jeu", wind: 12, humidity: 20, chanceRain: 99, image: "assets/rainy.png", time: "", location: ""),
  Weather(max: 15, min: 10, current: 0, name: "Pluie", day: "Vend", wind: 12, humidity: 20, chanceRain: 99, image: "assets/rainy.png", time: "", location: "")
];

