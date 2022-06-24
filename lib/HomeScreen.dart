import 'package:animatedroute/animatedroute.dart';
import 'package:animation_1/screen1.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xff1c1c1e),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                      child: SizedBox(
                          width: 350, height: 350, child: Lottie.asset("Asset/61230-smartwatch.json")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                      child: Text(
                        "Welcome to Health",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        "This app brings your health information\n \t               together in one place",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 80),
                      child: Text(
                        "You can see important changes or alerts,\n   get insights from your data and learn  \n                 about essential topics.",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                    SizedBox(
                      width: 310,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(AnimatedRoute(duration: Duration(milliseconds:200),widget: screen1(),curves:Curves.easeOut,alignment:Alignment.center));
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 18.2,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                              side: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
