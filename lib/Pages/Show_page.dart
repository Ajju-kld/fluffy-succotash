import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:animation_1/model/Qrcode_data.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class home_screen extends StatefulWidget {
  home_screen({Key? key, required this.item}) : super(key: key);
  final qrcode_data item;

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  var file;

  @override
  void dispose() async {
    // TODO: implement dispose
    Delete_the_file();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Qr Code'),
        backgroundColor: Color.fromARGB(255, 25, 21, 21),
      ),
      backgroundColor: Color.fromARGB(255, 25, 21, 21),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Center(
              child: Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
// Details box with title and url

                    Container(
                      width: 330,
                      height: 270,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                            child: Text(
                              widget.item.name!,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 28, 22, 22),
                                      borderRadius: BorderRadius.circular(11)),
                                  height: 50,
                                  width: 240,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 15, 5, 0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(widget.item.url!,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 18),
                                          overflow: TextOverflow.fade),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    splashColor: Colors.black,
                                    splashRadius: 0.2,
                                    onPressed: () {
                                      Clipboard.setData(
                                          ClipboardData(text: widget.item.url));
                                      Fluttertoast.showToast(
                                          msg: "copied",
                                          toastLength: Toast.LENGTH_SHORT);
                                    },
                                    icon: Icon(
                                      Icons.copy_outlined,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // QrImage widget inside a container
                    //
                    //

                    Positioned(
                      bottom: 170,
                      child: buildcard(),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    iconSize: 40,
                    onPressed: (() async {
                      final controller = ScreenshotController();
                      Uint8List bytes =
                          await controller.captureFromWidget(buildcard());
                      final storage_place =
                          await getApplicationDocumentsDirectory();

                      file = File('${storage_place.path}/image.png');

                      file.writeAsBytes(bytes);
                      Share.shareFiles(['${storage_place.path}/image.png']);
                    }),
                    icon: Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    )),
                IconButton(
                    iconSize: 40,
                    onPressed: (() async {
                      Delete();
                    }),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  // this are the functions for style of qrcode
  QrEyeStyle eye_style(bool b) {
    if (b == true) {
      return QrEyeStyle(
          eyeShape: QrEyeShape.circle,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);
    }
    return QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);
  }

  QrDataModuleStyle data_module_style(bool b) {
    if (b == true) {
      return QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.circle,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);
    }
    return QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.square,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);
  }

// the qrcode widget

  Widget buildcard() {
    return Container(
      width: 215,
      height: 215,
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
        size: 1,
        data: widget.item.url!,
        eyeStyle: eye_style(widget.item.eye_style!),
        dataModuleStyle: data_module_style(widget.item.style!),
      ),
    );
  }

  void Delete_the_file() async {
    await file.delete();
  }

  void Delete() {
    showDialog(
        context: context,
        builder: ((context) {
          return Center(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AlertDialog(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),backgroundColor: Color.fromARGB(255, 43, 42, 42),contentPadding: EdgeInsets.all(20),
                  content: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 10),
                        child: Text("Do you want to delete this link ?",style: TextStyle(color: Colors.white,fontSize: 19),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                widget.item.delete();
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Delete_the_file();
                              },
                              child: Text("Yes",style: TextStyle(fontSize: 18),)),
                          TextButton(
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                              child: Text("No",style:TextStyle(fontSize: 18),))
                        ],
                      )
                    ],
                  )),
                )),
          );
        }));
  }
}
