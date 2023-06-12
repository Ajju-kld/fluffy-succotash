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

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key, required this.item}) : super(key: key);
  final qrcode_data item;

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  late File file;
  late dynamic path;
  

  @override
  void dispose() async {
    _deleteTheFile();
    super.dispose();
  }

  void _storeTheFile() async {
    final controller = ScreenshotController();
    Uint8List bytes = await controller.captureFromWidget(buildcard());
    path = await getApplicationDocumentsDirectory();

    file = File('${path.path}/image.png');

    file.writeAsBytes(bytes);
  }

  @override
  Widget build(BuildContext context) {
    _storeTheFile();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Qr Code'),
        backgroundColor: const Color.fromARGB(255, 25, 21, 21),
      ),
      backgroundColor: const Color.fromARGB(255, 25, 21, 21),
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
                              style: const TextStyle(
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
                                      color:
                                          const Color.fromARGB(255, 28, 22, 22),
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
                                          style: const TextStyle(
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
                                      Clipboard.setData(ClipboardData(
                                          text: widget.item.url!));
                                      Fluttertoast.showToast(
                                          msg: "copied",
                                          toastLength: Toast.LENGTH_SHORT);
                                    },
                                    icon: const Icon(
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
                      Share.shareFiles(['${path.path}/image.png']);
                    }),
                    icon: const Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    )),
                IconButton(
                    iconSize: 40,
                    onPressed: (() async {
                      _deleteFile();
                    }),
                    icon: const Icon(
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
  QrEyeStyle _eyeStyle(bool b) {
    if (b == true) {
      return QrEyeStyle(
          eyeShape: QrEyeShape.circle,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);
    }
    return QrEyeStyle(
        eyeShape: QrEyeShape.square,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)]);
  }

  QrDataModuleStyle _dataModuleStyle(bool b) {
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
                color: const Color.fromARGB(255, 38, 34, 34),
                spreadRadius: 5),
            BoxShadow(
                offset: Offset.fromDirection(1.12),
                color: const Color.fromARGB(255, 31, 28, 28),
                blurRadius: 5,
                spreadRadius: 8,
                blurStyle: BlurStyle.solid),
            BoxShadow(
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
              spreadRadius: 10,
              offset: Offset.fromDirection(1.12),
              color: const Color.fromARGB(255, 34, 29, 29),
            )
          ],
          color: const Color.fromARGB(232, 27, 25, 25),
          borderRadius: BorderRadius.circular(20)),
      child: QrImage(
        size: 1,
        data: widget.item.url!,
        eyeStyle: _eyeStyle(widget.item.eye_style!),
        dataModuleStyle: _dataModuleStyle(widget.item.style!),
      ),
    );
  }

  void _deleteTheFile() async {
    await file.delete();
  }

  void _deleteFile() {
    showDialog(
        context: context,
        builder: ((context) {
          return Center(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: const Color.fromARGB(255, 43, 42, 42),
                  contentPadding: const EdgeInsets.all(20),
                  content: SingleChildScrollView(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 30, 10),
                        child: Text(
                          "Do you want to delete this link ?",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                widget.item.delete();
                                Navigator.pop(context);
                                Navigator.pop(context);
                                _deleteTheFile();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(fontSize: 18),
                              )),
                          TextButton(
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                              child: const Text(
                                "No",
                                style: TextStyle(fontSize: 18),
                              ))
                        ],
                      )
                    ],
                  )),
                )),
          );
        }));
  }
}
