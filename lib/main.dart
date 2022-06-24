import 'package:animation_1/screen1.dart';
import 'package:flutter/material.dart';


import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple),
        home: HomeScreen(),
        routes: {
          "screen1": (ctx) {
            return screen1();
          },
          
        },debugShowCheckedModeBanner: false,);
  }
}
