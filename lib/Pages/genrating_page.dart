import 'dart:async';

import 'package:animation_1/model/Boxes.dart';
import 'package:animation_1/model/Qrcode_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';

class genrating_page extends StatefulWidget {
  const genrating_page({Key? key}) : super(key: key);

  @override
  State<genrating_page> createState() => _genrating_pageState();
}

class _genrating_pageState extends State<genrating_page> {
  bool shape_of_eye = false;
  bool data_module = false;
  final check_box = TextStyle(color: Colors.white, fontSize: 20);
  final Check_box_heading = TextStyle(color: Colors.white, fontSize: 24);
  final FieldHead = TextStyle(color: Colors.white, fontSize: 30);

  @override
  void initState() {
    super.initState();
    _url_controller.addListener(() {
      setState(() {
        name = _url_controller.text;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.

    super.dispose();
  }

  final _title_controller = TextEditingController();
  final _url_controller = TextEditingController();

  String name = " ";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 11, 11, 11),
          body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 350, 20),
                  child: IconButton(
                    onPressed: () => {
                      shape_of_eye = false,
                      Navigator.of(context).pop(),
                      dispose()
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    iconSize: 55,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 20),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurStyle: BlurStyle.outer,
                              offset: Offset.fromDirection(1.12),
                              color: Color.fromARGB(255, 38, 34, 34),
                              spreadRadius: 5),
                          BoxShadow(
                              offset: Offset.fromDirection(1.12),
                              color: Color.fromARGB(255, 31, 28, 28),
                              blurRadius: 5,
                              spreadRadius: 8,
                              blurStyle: BlurStyle.solid),
                          BoxShadow(
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 10,
                            offset: Offset.fromDirection(1.12),
                            color: Color.fromARGB(255, 34, 29, 29),
                          )
                        ],
                        color: Color.fromARGB(232, 27, 25, 25),
                        borderRadius: BorderRadius.circular(20)),
                    child: QrImage(
                      data: name,
                      size: 300,
                      eyeStyle: eye(shape_of_eye),
                      dataModuleStyle: eye_2(data_module),
                      backgroundColor: Color.fromARGB(0, 0, 0, 0),
                      foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 240, 11),
                        child: Text(
                          "Title :-",
                          style: FieldHead,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                        child: SizedBox(
                            width: 300,
                            child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Enter Title",
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    border: OutlineInputBorder(
                                        gapPadding: 0,
                                        borderRadius: BorderRadius.circular(8)),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 68, 58, 58)),
                                controller: _title_controller,
                                style: const TextStyle(
                                    fontSize: 20,
                                    backgroundColor: Colors.transparent,
                                    color: Colors.white))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 250, 11),
                        child: Text(
                          "Url :-",
                          style: FieldHead,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                        child: SizedBox(
                            width: 300,
                            child: TextFormField(
                                toolbarOptions: ToolbarOptions(
                                    paste: true, selectAll: true),
                                cursorHeight: 30,
                                decoration: InputDecoration(
                                    labelText: "Enter url",
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    border: OutlineInputBorder(
                                        gapPadding: 0,
                                        borderRadius: BorderRadius.circular(8)),
                                    filled: true,
                                    fillColor: Color.fromARGB(255, 68, 58, 58)),
                                controller: _url_controller,
                                style: TextStyle(
                                    fontSize: 20,
                                    backgroundColor: Colors.transparent,
                                    color: Colors.white))),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Text(
                            "Eye style",
                            style: Check_box_heading,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 0, 30),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  "Circle",
                                  style: check_box,
                                ),
                                Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      fillColor: MaterialStateProperty.all(
                                          Color.fromARGB(255, 155, 28, 28)),
                                      value: this.shape_of_eye,
                                      onChanged: (shape_of_eye) => {
                                            setState(() {
                                              this.shape_of_eye =
                                                  shape_of_eye ?? true;
                                            })
                                          }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(
                            "Datamodule style",
                            style: Check_box_heading,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "Circle",
                                    style: check_box,
                                  ),
                                  Transform.scale(
                                    scale: 1.3,
                                    child: Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        fillColor: MaterialStateProperty.all(
                                            Color.fromARGB(255, 155, 28, 28)),
                                        value: data_module,
                                        onChanged: (eye) => {
                                              setState(() {
                                                data_module = eye ?? true;
                                              })
                                            }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      child: Text("generate"),
                      onPressed: () => {
                        
                         WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
                        generate()}),
                )
              ]))),
    );
  }

  QrEyeStyle eye(bool? b) {
    if (b == true) {
      return const QrEyeStyle(eyeShape: QrEyeShape.circle);
    }
    return const QrEyeStyle(eyeShape: QrEyeShape.square);
  }

  QrDataModuleStyle eye_2(bool? b) {
    if (b == true) {
      return const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.circle);
    }
    return const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square);
  }

  void generate() {
    if (_url_controller.text.isEmpty) {
      return;
    }

    qrcode_data r = new qrcode_data(
        name: _title_controller.text,
        url: _url_controller.text,
        style: data_module,
        eye_style: shape_of_eye);

    final box = Boxes.getAdd_to_list();
    box.add(r);
    Navigator.of(context).pushNamed("generated_animation");

    delays();

  }

  Future delays() async {
       
    await Future.delayed(Duration(seconds: 2,milliseconds:20,microseconds: 200));

    return Navigator.of(context).pop();
  }
}

