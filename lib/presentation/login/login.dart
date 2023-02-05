import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spos/constants/app_strings.dart';
import 'package:spos/constants/my_color.dart';
import 'package:spos/utilis/cliper_shaip.dart';
import 'package:spos/utilis/routes.dart';
import 'package:flutter/services.dart';
import 'package:spos/widgets/gradient_ball.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:spos/widgets/my_button.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
              const Positioned(
                top: 50,
                left: 10,
                child: GradientBall(
                  colors: [
                    MyColor.colorPrimary,
                    MyColor.colorPrimary2,
                  ],
                  size: Size.square(120),
                ),
              ),
              Positioned(
                top: 20,
                left: MediaQuery
                    .of(context)
                    .size
                    .width - 80,
                child: const GradientBall(
                  colors: [
                    MyColor.colorLightBlue,
                    MyColor.colorTeal
                  ],
                  size: Size.square(100),
                ),
              ),
              Positioned(
                top: 310,
                left: MediaQuery
                    .of(context)
                    .size
                    .width - 160,
                child: GradientBall(
                  colors: [
                    MyColor.deepWhite,
                    MyColor.colorBlueAccent
                  ],
                  size: const Size.square(150),
                ),
              ),
              BlurryContainer(
                blur: 9,
                width: double.infinity,
                height: double.infinity,
                elevation: 0,
                color: Colors.transparent,
                child: Container(),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 200),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child:const Text(
                        AppStrings.howTitleLogin,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ).tr() ,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child:const Text(
                        AppStrings.howContentLogin,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: MyColor.colorBlack,),
                      ).tr(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: MyButton(
                        text: const Text(
                          AppStrings.btnLogin,
                          style: TextStyle(color: MyColor.colorWhite, fontSize: 18),
                        ).tr(),
                        color:  MyColor.colorPrimary,
                        icon: Icons.qr_code,
                        iconColor: MyColor.colorWhite,
                        onPressed: (){
                          Navigator.of(context).pushNamedAndRemoveUntil(Routes.qrRoute, (route) => false);
                        },
                      ),
                    )
                  ]
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 250,
                    child: ClipPath(
                      clipper: ClipperShape(),
                      child: Container(
                        color: MyColor.colorPrimary,
                      ),
                    ),
                  )),
            ]
            )
        )
    );
  }
}