import 'dart:math';


import 'package:animation_1/Pages/Show_page.dart';
import 'package:animation_1/model/Boxes.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../Widgets/frosted_appbar.dart';
import '../model/Qrcode_data.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 75.0,
          height: 75.0,
          child: new RawMaterialButton(
            fillColor: Color.fromARGB(255, 255, 5, 5),
            focusColor: Color.fromARGB(255, 255, 18, 30),
            shape: new CircleBorder(),
            elevation: 0.0,
            // ignore: prefer_const_constructors
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('genrating_page');
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        color: Color.fromARGB(254, 46, 45, 45),
        notchMargin: 8.0,
        child: Container(
          height: kBottomNavigationBarHeight,
          decoration: BoxDecoration(),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 19, 18, 18),
                border: Border(
                    top: BorderSide(
                        color: Color.fromARGB(255, 44, 41, 41), width: 0.5))),
          ),
        ),
      ),
      body: 
          ValueListenableBuilder<Box<qrcode_data>>(
              valueListenable: Boxes.getAdd_to_list().listenable(),
              builder: ((context, box, child) {
                final items = box.values.toList().cast<qrcode_data>();

                return build_the_widet(items);
              }))
      
    );
  }

  Widget build_the_widet(List<qrcode_data> items) {
    if (items.isEmpty) {
      return Scaffold(appBar: AppBar(backgroundColor: Colors.black38,title: Text('Homescreen',style: TextStyle(color: Colors.white),)),backgroundColor: Colors.black,
        body: Center(
            child: Container(
                child: Text(
          "Empty",
          style: TextStyle(fontSize: 30,color: Colors.white),
        ))),
      );
    }

    return CustomScrollView(slivers: [
      frosted_appbar(url: 'Homescreen'),
       SliverList(
            delegate: SliverChildListDelegate(List.generate(
                items.length,
                (i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return home_screen(item: items[i],
                          );
                        }));
                      },
                      child: Container(
                        child: Center(
                            child: Text(
                          items[i].name!,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                        width: 350,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]),
                      ),
                    )))))
    ],) ;
  }
}
