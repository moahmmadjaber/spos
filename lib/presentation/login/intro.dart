import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spos/utilis/routes.dart';
import 'package:flutter/services.dart';
class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);
  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,

    ]);
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Column(
        children: [
          Flexible(flex: 1,
              child: Container(margin: EdgeInsets.only(
                  left: w * 0.1, right: w * 0.13, top: h * 0.2),
                  child: Image.asset('assets/images/logo.png')))
          ,
          Flexible(child:
          GestureDetector(onTap:()  {Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute,(route)=>false);
          },
              child: Container(decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(12))
                  ,
                  height: h * 0.05,
                  margin: EdgeInsets.only(right: w * 0.1, left: w * 0.1),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Icon(Icons.qr_code, color: Colors.white,),
                        Text('QR تسجيل الدخول من خلال قرائة رمز',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.tajawal(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                            ,),)
                      ]))))
        ]
        ,
      ),

    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}



