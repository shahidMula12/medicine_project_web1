import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine_project/utils/constants.dart';

import '../view/widgets.dart';

const drawerSwitchBreakPoint = 1320.0;
const drawerWidth = 230.0;

drawerSwitchChecker(size) {
  return size.width <= drawerSwitchBreakPoint;
}

var textFieldwidth = 475;

const addStockBreakPoint = 510;

addStockBreakPointChecker(size) {
  return size.width <= addStockBreakPoint;
}

textFieldsBreakpoint(size) {
  return size.width <= textFieldwidth;
}

var tablelistbreakpoints = 1171;

tablelistbreakpointsChecker(size) {
  return size.width <= tablelistbreakpoints;
}

var signuptextfieldwidth = 1180;
const signUpBreakPoint = 1300;
signUpBreakPointChecker(size) {
  return size.width > signuptextfieldwidth;
}

var logintextfieldwidth = 750;
loginBreakPointChecker(size) {
  return size.width > logintextfieldwidth;
}

Widget customDetailRow() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CustomText(
                words: "Name",
                fontsize: 20,
                fontweight: FontWeight.bold,
                color: primaryColor),
            SizedBox(height: 17),
            CustomText(
                words: "Address",
                fontsize: 20,
                fontweight: FontWeight.bold,
                color: primaryColor),
            SizedBox(height: 17),
            CustomText(
                words: "Phone No.",
                fontsize: 20,
                fontweight: FontWeight.bold,
                color: primaryColor),
            SizedBox(height: 17),
            CustomText(
                words: "Date",
                fontsize: 20,
                fontweight: FontWeight.bold,
                color: primaryColor),
            SizedBox(height: 17),
            CustomText(
                words: "License number",
                fontsize: 20,
                fontweight: FontWeight.bold,
                color: primaryColor)
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6),
              child: CustomText(words: "Rehan", color: Color(0xff9F9F9F)),
            ),
            SizedBox(height: 23),
            CustomText(words: "Samnabad Lahore", color: Color(0xff9F9F9F)),
            SizedBox(height: 22),
            CustomText(words: "+92347494903", color: Color(0xff9F9F9F)),
            SizedBox(height: 23),
            CustomText(words: "DD/MM/YYYY", color: Color(0xff9F9F9F)),
            SizedBox(height: 25),
            CustomText(words: "546321", color: Color(0xff9F9F9F)),
          ],
        ),
      ]);
}

Widget customButtonsRow() {
  return Row(children: [
    Column(
      children: [
        Row(
          children: [
            MaterialButton(
                onPressed: () {},
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor,
                    ),
                    height: 38,
                    width: 110,
                    child: Center(
                      child: CustomText(
                          fontsize: 16,
                          words: "Excluding Tax",
                          color: Colors.white),
                    ))),
            SizedBox(width: 50),
            CustomText(words: "900", color: Color(0xff9F9F9F)),
          ],
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              MaterialButton(
                  onPressed: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor,
                      ),
                      height: 38,
                      width: 110,
                      child: Center(
                        child: CustomText(
                            fontsize: 16,
                            words: "Including Tax",
                            color: Colors.white),
                      ))),
              SizedBox(width: 50),
              CustomText(words: "2560", color: Color(0xff9F9F9F)),
            ],
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              MaterialButton(
                  onPressed: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor,
                      ),
                      height: 38,
                      width: 110,
                      child: Center(
                        child: CustomText(
                            fontsize: 16,
                            words: "Discount Rate",
                            color: Colors.white),
                      ))),
              SizedBox(width: 50),
              CustomText(words: "15%", color: Color(0xff9F9F9F)),
            ],
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              MaterialButton(
                  onPressed: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor,
                      ),
                      height: 38,
                      width: 110,
                      child: Center(
                        child: CustomText(
                            fontsize: 16,
                            words: "Sales Tax",
                            color: Colors.white),
                      ))),
              SizedBox(width: 50),
              CustomText(words: "3500", color: Color(0xff9F9F9F)),
            ],
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              MaterialButton(
                  onPressed: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor,
                      ),
                      height: 38,
                      width: 110,
                      child: Center(
                        child: CustomText(
                            fontsize: 16,
                            words: "Gross Total",
                            color: Colors.white),
                      ))),
              SizedBox(width: 50),
              CustomText(words: "5000", color: Color(0xff9F9F9F)),
            ],
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MaterialButton(
                  onPressed: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor,
                      ),
                      height: 38,
                      width: 90,
                      child: Center(
                        child: CustomText(
                            fontsize: 16,
                            words: "Generate",
                            color: Colors.white),
                      ))),
              SizedBox(width: 50),
              MaterialButton(
                  onPressed: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffDBE3E4),
                      ),
                      height: 38,
                      width: 90,
                      child: Center(
                        child: CustomText(
                            fontsize: 16, words: "Cancel", color: primaryColor),
                      ))),
            ],
          ),
        ),
      ],
    ),
    SizedBox(
      width: 50,
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        SizedBox(height: 15),
        SizedBox(height: 15),
        SizedBox(height: 15),
      ],
    )
  ]);
}
