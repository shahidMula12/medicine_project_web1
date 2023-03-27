import 'package:flutter/material.dart';
import 'package:medicine_project/utils/controller.dart';

import '../view/widgets.dart';

Widget customColumnNameEmail(size) {
  return Column(
    children: [
      customColumn(
        textFeildcontroller: namecustomerAddcontroller,
        heading: "Name:",
        sizeboxheight: size.height * 0.007,
        textfieldheight: size.height * 0.06,
        // textfieldwidth: size.width * 0.3
      ),
      SizedBox(height: 10),
      customColumn(
        textFeildcontroller: emailcustomerAddcontroller,
        heading: "Email:",
        sizeboxheight: size.height * 0.007,
        textfieldheight: size.height * 0.06,
        // textfieldwidth: size.width * 0.3
      ),
    ],
  );
}

Widget customColumnPhoneLicense(size) {
  return Column(
    children: [
      customColumn(
        textFeildcontroller: namecustomerAddcontroller,
        heading: "Phone no.",
        sizeboxheight: size.height * 0.007,
        textfieldheight: size.height * 0.06,
        // textfieldwidth: size.width * 0.3
      ),
      SizedBox(height: 10),
      customColumn(
        textFeildcontroller: emailcustomerAddcontroller,
        heading: "License:",
        sizeboxheight: size.height * 0.007,
        textfieldheight: size.height * 0.06,
        // textfieldwidth: size.width * 0.3
      ),
      SizedBox(height: 10),
    ],
  );
}
