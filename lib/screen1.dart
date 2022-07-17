import 'package:animation_1/chart.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class screen1 extends StatefulWidget {
  screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  final page = [
    Container(height: double.infinity,
    width: double.infinity,
      child: Center(child: chart(),),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xff4563db),
              Color(0xff5b16d0),
              Color(0xff5036d5),
              Color(0xff3594dd)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.8, 1]),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 202, 69, 219),
              Color.fromARGB(255, 130, 67, 238),
              Color.fromARGB(255, 213, 91, 54),
              Color.fromARGB(230, 221, 210, 53)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.8, 1]),
      ),
    ),
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 48, 205, 211),
              Color.fromARGB(255, 50, 226, 117),
              Color.fromARGB(255, 99, 235, 8),
              Color.fromARGB(255, 235, 225, 84)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.8, 1]),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidSwipe(
      pages: page,
      enableLoop: true,
      fullTransitionValue: 800,
      enableSlideIcon: false,
      waveType: WaveType.liquidReveal,
      positionSlideIcon: 0.5,
    ));
  }
}
