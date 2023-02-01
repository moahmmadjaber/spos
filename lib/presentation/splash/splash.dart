import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spos/utilis/routes.dart';
import 'package:spos/utilis/shared_pref.dart';
import 'package:flutter_gif/flutter_gif.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
@override
State<Splash> createState() => _SplashState();

}

class _SplashState extends State<Splash>with TickerProviderStateMixin{
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 5000), _goNext);}
    void _goNext() async{
      if(await SharedPref.haveLogin()){
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      }else{
        Navigator.pushReplacementNamed(context, Routes.IntroRoute);
      }
    }

    @override
    void initState() {

        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,

        ]);

      super.initState();
      _startDelay();
    }
  Widget build(BuildContext context) {
    return Scaffold(body:
    Container(child: Image.asset("assets/gif/splash.gif") ,));
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

