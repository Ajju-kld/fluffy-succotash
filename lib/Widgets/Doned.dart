import 'dart:async';


import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class Doned extends StatefulWidget {
  const Doned({super.key});

  @override
  State<Doned> createState() => _DonedState();
}

class _DonedState extends State<Doned> {

  @override
   void initState() {

    super.initState();
    Timer(
       const Duration(seconds: 1),
        () => Navigator.of(context).pop());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
    body: Center(child: Lottie.asset('Asset/images/99141-done-animation.json',width: 400,height: 400)),);
  }
}