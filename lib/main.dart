import 'package:animation_1/Pages/HomeScreen.dart';
import 'package:animation_1/Widgets/Qr_generated.dart';

import 'package:animation_1/model/Qrcode_data.dart';
import 'package:animation_1/model/Qrcode_data.g.hive_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:lottie/lottie.dart';
import 'dart:async';

import 'Pages/genrating_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(qrcodedataAdapter());
  await Hive.openBox<qrcode_data>('list_items');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: splash_screen(),
      routes: {
        "genrating_page": (ctx) {
          return genrating_page();
        },
        "generated_animation": (context) {
          return qr_generated();
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class splash_screen extends StatefulWidget {
  splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset('Asset/images/RWlFKHg56D.json',
            width: 500, height: 500),
      ),
    );
  }
}
