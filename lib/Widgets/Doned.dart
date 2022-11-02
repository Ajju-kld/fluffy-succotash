import 'dart:async';

import 'package:animation_1/Pages/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class doned extends StatefulWidget {
  const doned({super.key});

  @override
  State<doned> createState() => _donedState();
}

class _donedState extends State<doned> {
   void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).pop());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
    body: Center(child: Lottie.asset('Asset/images/99141-done-animation.json',width: 400,height: 400)),);
  }
}