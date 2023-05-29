import 'dart:async';

import 'package:flutter/material.dart';


import 'package:lottie/lottie.dart';

import 'Doned.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  @override
  void initState() {
 
    super.initState();
       Timer(
       const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Doned())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,body: Center(child: Lottie.asset("Asset/images/117347-microinteractions-icon-10.json",width: 200,height: 200),));
  }
}