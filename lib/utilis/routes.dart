import 'package:flutter/material.dart';
import 'package:spos/Data/repository/home/home_repository.dart';
import 'package:spos/Data/repository/login/login_repository.dart';
import 'package:spos/business_logic/home/cubit/home_cubit.dart';
import 'package:spos/business_logic/login/cubit/login_cubit.dart';
import 'package:spos/presentation/home/home.dart';
import 'package:spos/presentation/intro/intro.dart';
import 'package:spos/presentation/notification/notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spos/presentation/login/login.dart';
import 'package:spos/presentation/splash/splash.dart';

class Routes{
  static const String splashRoute='/splash';
  static const String loginRoute="/login";
  static const String signupRoute="/signup";
  static const String homeRoute="/home";
  static const String NotificationRoute="/notification";
  static const String IntroRoute="/intro";

}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.IntroRoute :
        return MaterialPageRoute(builder: (context) => const Intro());
      case Routes.splashRoute :
        return MaterialPageRoute(builder: (context) => const Splash());
      case Routes.loginRoute :
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (_) => LoginCubit(LoginRepository()),
              child: const Login(),

            )
        );
      case Routes.homeRoute :
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
                create: (_) => HomeCubit(HomeRepository()),
                child: const Home()));
      case Routes.NotificationRoute:
        return MaterialPageRoute(builder: (context)=>
        const NoificationPage());

      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('no Route Found'),
          ),
          body: const Center(child: Text('no Route Found')),
        ));
  }
}