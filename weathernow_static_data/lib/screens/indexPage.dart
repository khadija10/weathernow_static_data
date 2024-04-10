

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weathernow_static_data/models/weather.dart';
import 'package:weathernow_static_data/screens/detailPage.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00A1FF).withOpacity(0.5),
      body: Column(
        children: [
          CurrentWeather(),
          const TodayWeather(),
        ],
      ),
    );
  }
}


class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const Text("Aujourd'hui",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
          ),
          GestureDetector(

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(tommorowTemperature,cinqJoursDePlus);
              }));
            },
            child: Row(
              children: const [
                Text(" Voir plus",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Icon(Icons.arrow_forward_ios_outlined,
                color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          )
        ],
        ),
           const SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(bottom: 30,),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                WeatherWidget(todayMeteo[0]),
                WeatherWidget(todayMeteo[1]),
                WeatherWidget(todayMeteo[2]),
                WeatherWidget(todayMeteo[3]),
                WeatherWidget(todayMeteo[4]),
                WeatherWidget(todayMeteo[5]),
                WeatherWidget(todayMeteo[6]),
                WeatherWidget(todayMeteo[7]),
                WeatherWidget(todayMeteo[8]),
                WeatherWidget(todayMeteo[9]),
                WeatherWidget(todayMeteo[10]),
                WeatherWidget(todayMeteo[11]),
                WeatherWidget(todayMeteo[12]),
                WeatherWidget(todayMeteo[13]),
                WeatherWidget(todayMeteo[14]),
                WeatherWidget(todayMeteo[15]),
                WeatherWidget(todayMeteo[16]),
                WeatherWidget(todayMeteo[17]),
                WeatherWidget(todayMeteo[18]),
                WeatherWidget(todayMeteo[19]),
                WeatherWidget(todayMeteo[20]),
                WeatherWidget(todayMeteo[21]),
                WeatherWidget(todayMeteo[22]),
                WeatherWidget(todayMeteo[23]),
              ],
            ),
          )
      ],
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  WeatherWidget(this.weather);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.2,color: Colors.white),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        children: [
          Text(
            weather.current.toString()+"\u00B0",
            style: const TextStyle(fontSize: 15),),
          const SizedBox(height: 5,),
          Image(image: AssetImage(weather.image),
            width: 35, height: 35,),
          const SizedBox(height: 5,),
          Text(weather.time,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CurrentWeather extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      height: MediaQuery.of(context).size.height-185,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
      glowColor: const Color(0xff00A1FF).withOpacity(0.2),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      //color: Color(0xff00A1FF),
      spreadRadius: 5,
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(CupertinoIcons.building_2_fill,
          color: Colors.white,),
          Row(
            children: [
              Text("  "+currentTemperature.location, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              const Icon(CupertinoIcons.location,
                color: Colors.white,),
            ],),
            Row(
              children: const [
                Icon(CupertinoIcons.settings,
                  color: Colors.white,),
              ],),

        ],),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 0.2, color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text("Actualiser",
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 320,
            child: Stack(
              children: [
                Image(image: AssetImage(currentTemperature.image,),
                fit: BoxFit.fill),
                Positioned(bottom:0, right: 0, left: 0,
                  child: Center(
                    child: Column(
                      children: [
                        GlowText(
                          currentTemperature.current.toString(),
                          style: const TextStyle(height: 0.1, fontSize: 80,
                          fontWeight: FontWeight.bold),
                        ),
                        Text(currentTemperature.name,
                        style: const TextStyle(fontSize: 16),
                        ),
                        Text(currentTemperature.day,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),)
              ],
            ),
          ),
          const Divider(color: Colors.white,),
          const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          listDetail(CupertinoIcons.wind, currentTemperature.wind.toString(), " Km/h", "Vent"),
          listDetail(CupertinoIcons.wind, currentTemperature.humidity.toString(), " %", "Humidity"),
          listDetail(CupertinoIcons.wind, currentTemperature.chanceRain.toString(), " %", "Pluie"),
        ],
      ),
        ],),

    );
  }
}


listDetail(IconData icon, String value,  String mesure, String type){
  return
      Column(
        children: [
          Icon(icon,
            color: Colors.white,),
          const SizedBox(height: 8,),
          Text(value+" " + mesure,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const SizedBox(height: 8,),
          Text(type,
            style: const TextStyle(color: Colors.white,fontSize: 12),)
        ],
      );
}


