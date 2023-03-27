import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constants.dart';
const double _kSize = 100;

class Loader {
  static AnimationLoader(context){
    final AnimationLoader =   Center(
        child: LoadingAnimationWidget.discreteCircle(
          // leftDotColor: const Color(0xFF1A1A3F),
          // rightDotColor: const Color(0xFFEA3799),
          color: jamenColor,
          size: 200,
        ),
    );
     showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimationLoader;
      },
    );
  }
  }

