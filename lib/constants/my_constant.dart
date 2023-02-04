
import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:spos/constants/custom_indicator.dart';
import 'package:spos/constants/enum_constant.dart';
import 'package:spos/constants/my_color.dart';

void showToast(txt, ToastType type) {
  switch (type) {
    case ToastType.load:
      EasyLoading.instance
        ..indicatorType = EasyLoadingIndicatorType.circle
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..backgroundColor = Colors.black54
        ..indicatorColor = Colors.blueAccent
        ..textColor = Colors.white70
        ..maskColor = Colors.black54.withOpacity(0.6)
        ..userInteractions = false
        ..dismissOnTap = false
        ..customAnimation = CustomIndicator();
      EasyLoading.show(status: txt, maskType: EasyLoadingMaskType.custom);
      break;
    case ToastType.success:
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..backgroundColor = Colors.black54
        ..indicatorColor = Colors.green
        ..textColor = Colors.green
        ..maskColor = Colors.black54.withOpacity(0.6)
        ..userInteractions = false
        ..dismissOnTap = false
        ..customAnimation = CustomIndicator();
      EasyLoading.showSuccess(txt, maskType: EasyLoadingMaskType.custom);
      break;
    case ToastType.error:
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..backgroundColor = Colors.black54
        ..indicatorColor = Colors.redAccent
        ..textColor = Colors.redAccent
        ..maskColor = Colors.black54.withOpacity(0.6)
        ..userInteractions = false
        ..dismissOnTap = false
        ..customAnimation = CustomIndicator();
      EasyLoading.showError(txt, maskType: EasyLoadingMaskType.custom);
      break;
    case ToastType.info:
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..backgroundColor = Colors.black54
        ..indicatorColor = Colors.yellowAccent
        ..textColor = Colors.yellowAccent
        ..maskColor = Colors.black54.withOpacity(0.6)
        ..userInteractions = false
        ..dismissOnTap = false
        ..customAnimation = CustomIndicator();
      EasyLoading.showInfo(txt, maskType: EasyLoadingMaskType.custom);
      break;
    case ToastType.toast:
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..backgroundColor = Colors.black54
        ..indicatorColor = Colors.white70
        ..textColor = Colors.white70
        ..maskColor = Colors.black54.withOpacity(0.6)
        ..userInteractions = false
        ..dismissOnTap = false
        ..customAnimation = CustomIndicator();
      EasyLoading.showToast(txt, maskType: EasyLoadingMaskType.custom);
      break;
  }
}

Widget failed(callBack) {
  return Container(color: Colors.lightBlue,child:
    Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       Text(
        'تعذر الاتصال بالخادم..تأكد من اتصال الشبكة', style:GoogleFonts.tajawal(
          fontWeight: FontWeight.bold,color: Colors.white,
          fontSize: 15))
      ,
      Center(
        child: TextButton.icon(
          // <-- TextButton
          onPressed: callBack,
          icon: const Icon(
            Icons.refresh,
            size: 24.0,
            color: MyColor.colorMain,
          ),
          label: const Text(
            'اعادة المحاولة',
            style: TextStyle(color: MyColor.colorMain),
          ),
        ),
      )
    ],
    )
  );
}



Widget noData() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Center(
        child: Text('لا تتوفر بيانات'),
      )
    ],
  );
}
