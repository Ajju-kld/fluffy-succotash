import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(100),
        child: appbar(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: SizedBox(
                    height: 70,
                    child: AppBar(
                      backgroundColor:
                          Colors.transparent,
                    )))),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 100,
            child: Card(
              child: Center(
                child: Text("Item $index"),
              ),
            ),
          );
        },
      ),
    );
    
  }
  Widget appbar() {
    return Container(
        height: 30,
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Text("Home Screen"),
            )));
  }
}
