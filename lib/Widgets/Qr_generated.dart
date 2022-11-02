import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import '../Pages/HomeScreen.dart';
import 'Doned.dart';

class qr_generated extends StatefulWidget {
  const qr_generated({super.key});

  @override
  State<qr_generated> createState() => _qr_generatedState();
}

class _qr_generatedState extends State<qr_generated> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => doned())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,body: Center(child: Lottie.asset("Asset/images/117347-microinteractions-icon-10.json",width: 200,height: 200),));
  }
}