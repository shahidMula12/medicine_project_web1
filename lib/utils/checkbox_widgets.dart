import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utils/constants.dart';

class CustomCheckBox extends StatelessWidget {
  final isAdded, onPressed;
  const  CustomCheckBox({this.isAdded, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: primaryColor,
      // checkColor: Color(0xff1D515C),
      value: isAdded,
      onChanged: onPressed,
    );
  }
}
