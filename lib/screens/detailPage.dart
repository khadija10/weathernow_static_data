import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weathernow_static_data/models/weather.dart';
import 'package:weathernow_static_data/screens/indexPage.dart';
class DetailPage extends StatelessWidget {

  Weather tommorowTemperature;
  final List<Weather> cinqJoursDePlus;

  DetailPage(this.tommorowTemperature,this.cinqJoursDePlus);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00A1FF).withOpacity(0.5),
      body: Column(
        children: [
          TommorowMeteo(tommorowTemperature),
          CinqJours(cinqJoursDePlus),
        ],
      ),
    );
  }
}

class TommorowMeteo extends StatelessWidget {

  final Weather tommorowTemperature;
  TommorowMeteo(this.tommorowTemperature);
  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      glowColor: const Color(0xff00A1FF).withOpacity(0.2),
      color: const Color(0xff00A1FF).withOpacity(0.2),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                ),
                Row(
                  children: const [
                    Text("5 jours", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                  ],
                ),
                const Icon(Icons.more_vert,color: Colors.white,),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(tommorowTemperature.image))
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Demain",
                        style: TextStyle(fontSize: 27,height: 0.1)),
                    Container(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText(
                            tommorowTemperature.max .toString(),
                            style: const TextStyle(fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("/"+tommorowTemperature.min.toString()+"\u00B0",
                          style: TextStyle(color: Colors.black26.withOpacity(0.3),
                          fontSize: 30, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(" "+tommorowTemperature.name,
                    style: const TextStyle(fontSize: 15,),),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20, right: 50, left: 50
            ),
            child: Column(
              children: [
                const Divider(color: Colors.white),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    listDetail(CupertinoIcons.wind, tommorowTemperature.wind.toString(), "Km/h", "Vent"),
                    listDetail(CupertinoIcons.wind, tommorowTemperature.humidity.toString(), "%", "Humidity"),
                    listDetail(CupertinoIcons.wind, tommorowTemperature.chanceRain.toString(), "%", "Pluie"),
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class CinqJours extends StatelessWidget {
  final List<Weather> cinqJoursDePlus;
  CinqJours(this.cinqJoursDePlus);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: cinqJoursDePlus.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cinqJoursDePlus[index].day,
                  style: const TextStyle(fontSize: 17),),
                  Container(
                    width: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(
                                cinqJoursDePlus[index].image
                            ),
                            width: 60,
                          ),
                          const SizedBox(width: 10,),
                          Text(cinqJoursDePlus[index].name,
                          style: const TextStyle(fontSize: 17),)
                        ],
                      ),
                  ),
                  Row(
                    children: [
                      Text(cinqJoursDePlus[index].max.toString()+"\u00B0",
                      style: const TextStyle(fontSize: 17),),
                      Text("/"+cinqJoursDePlus[index].min.toString()+"\u00B0",
                        style: const TextStyle(fontSize: 16, color: Colors.grey),),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

