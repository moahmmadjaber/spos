import 'package:flutter/material.dart';

class GradientBall extends StatelessWidget {
  final List<Color> colors;
  final Size size;
  
  const GradientBall({Key? key,
  required this.colors,
    this.size = const Size.square(150)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: size.height,
      width: size.width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        gradient: LinearGradient(begin: Alignment.topCenter, stops: [
              0.1,
              0.9
            ], colors: [
              Colors.blue.withOpacity(.8),
              Colors.teal.withOpacity(.1)
            ])
        ),


        );

  }
}
