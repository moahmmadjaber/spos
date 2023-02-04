import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:spos/business_logic/login/cubit/login_cubit.dart';
import 'package:spos/constants/enum_constant.dart';
import 'package:spos/constants/my_constant.dart';
import 'package:spos/utilis/routes.dart';
import 'package:spos/utilis/shared_pref.dart';

class Login extends StatefulWidget {
  const Login({super.key, title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int counter = 0;
  final _qrKey = GlobalKey<FormState>(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginInitial) {
            controller?.resumeCamera();
            form();
          } else if (state is LoginLoading) {
            form();
          } else if (state is LoginComplete) {
            EasyLoading.dismiss();
            showToast('تم التسجبل', ToastType.success);
            if (state.model.status == false) {
              showToast('رقم المحسن غير صحيح', ToastType.error);
            } else {
              await SharedPref.setUser(result!.code,
                  state.model.first_name.toString(), state.model.status);
              Navigator.pushReplacementNamed(context, Routes.homeRoute);
            }
          } else if (state is LoginError) {
            controller?.resumeCamera();
            showToast(state.err, ToastType.error);
            form();
          }
        },
        child: form());
  }

  Widget form() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Center(
            child: Text('مؤسسة العين للرعاية الاجتماعية',
                style: GoogleFonts.tajawal(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ))),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              child: QRView(
                key: _qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderLength: h * 0.05,
                  borderRadius: 10,
                  borderColor: Colors.blueAccent,
                  borderWidth: 10,
                  cutOutSize: MediaQuery.of(context).size.width * .7,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'QR الرجاء قم بقرائة رمز',
                  style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    if (counter == 0) {
      startup(counter);
    }

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null) {
          controller.pauseCamera();
          BlocProvider.of<LoginCubit>(context).login(result!.code);
          showToast('يرجى الانتظار', ToastType.load);
        }
      });
    });
  }

  Future<int> startup(counter) async {
    {
      counter = counter + 1;
      controller?.pauseCamera();
      controller?.resumeCamera();
      return counter;
    }
  }
}
