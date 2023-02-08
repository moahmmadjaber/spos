import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:spos/business_logic/login/cubit/login_cubit.dart';
import 'package:spos/constants/app_strings.dart';
import 'package:spos/constants/enum_constant.dart';
import 'package:spos/constants/my_color.dart';
import 'package:spos/constants/my_constant.dart';
import 'package:spos/utilis/cliper_shaip.dart';
import 'package:spos/utilis/routes.dart';
import 'package:spos/utilis/shared_pref.dart';
import 'package:easy_localization/easy_localization.dart';

class Qr extends StatefulWidget {
  const Qr({super.key, title});

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
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
      controller!.resumeCamera();
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
                  state.model.first_name.toString(),state.model.token);
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
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                _buildQrView(context),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 150,
                      child: ClipPath(
                        clipper: ClipperShape(),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          color: MyColor.colorPrimary,
                          child: const Text(
                            AppStrings.qrInstructions,
                            style:  TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColor.colorWhite,
                              fontSize: 16,
                            ),
                          ).tr(),
                        ),
                      ),
                    )),

                Container(alignment:Alignment.center,margin:EdgeInsets.only(top: h*0.38,right: w*0.25),height: h*0.2,width: w*0.5,child: Image.asset('assets/images/gray.png',color: Colors.white.withOpacity(0.15),fit: BoxFit.fill,),) ],
            )
        )
    );
  }

  // This trailing comma makes auto-formatting nicer for build methods.
  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery
        .of(context)
        .size
        .width < 400 ||
        MediaQuery
            .of(context)
            .size
            .height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: MyColor.colorGreen,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
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