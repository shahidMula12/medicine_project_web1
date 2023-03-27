import 'package:flutter/material.dart';
import 'package:medicine_project/utils/controller.dart';
import '/utils/constants.dart';
import '/view/widgets.dart';

import '../utils/break_points.dart';
import 'components/drawer_widgets.dart';
import 'components/table_widgets.dart';

class UpdateCustomerScreen extends StatefulWidget {
  final isOpen;
  const UpdateCustomerScreen({this.isOpen});

  @override
  State<UpdateCustomerScreen> createState() => _UpdateCustomerScreenState();
}

class _UpdateCustomerScreenState extends State<UpdateCustomerScreen> {
  //final person = ["Sr.", "Name", "Batch#", "QTY", "C.P", "S.P", "Actions"];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width - (drawerWidth + 60),
      height: size.height * 0.84,
      decoration: BoxDecoration(color: Color(0xffD2D2D2)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: size.width * 0.85,
              height: size.height * 0.80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                          words: "Add Customer",
                          color: mostColor,
                          fontsize: 38,
                          fontweight: FontWeight.bold),
                      Padding(
                        padding: const EdgeInsets.only(right: 80, top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customColumn(
                                textFeildcontroller: namecustomerAddcontroller,
                                heading: "Name:",
                                sizeboxheight: size.height * 0.007,
                                textfieldheight: size.height * 0.06,
                                textfieldwidth: size.width * 0.3),
                            customColumn(
                                textFeildcontroller: emailcustomerAddcontroller,
                                heading: "Email:",
                                sizeboxheight: size.height * 0.007,
                                textfieldheight: size.height * 0.06,
                                textfieldwidth: size.width * 0.3),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customColumn(
                                textFeildcontroller: phonecustomerAddcontroller,
                                heading: "Phone no.",
                                sizeboxheight: size.height * 0.007,
                                textfieldheight: size.height * 0.06,
                                textfieldwidth: size.width * 0.3),
                            SizedBox(height: size.height * 0.25),
                            customColumn(
                                textFeildcontroller: licensecontroller,
                                heading: "License:",
                                sizeboxheight: size.height * 0.007,
                                textfieldheight: size.height * 0.06,
                                textfieldwidth: size.width * 0.3),
                          ],
                        ),
                      ),
                      customColumn(
                          heading: "Address:",
                          sizeboxheight: size.height * 0.002,
                          textfieldheight: size.height * 0.015,
                          textfieldwidth: size.width * 0.5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          customSaveCancelAddCustomerButton(context,
                              nameCustomerAddController:
                                  namecustomerAddcontroller,
                              addressCustomerAddController:
                                  emailcustomerAddcontroller,
                              phoneCustomerAddController:
                                  phonecustomerAddcontroller,
                              licenseCustomAddController: licensecontroller),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
