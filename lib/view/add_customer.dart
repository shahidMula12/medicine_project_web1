import 'package:flutter/material.dart';
import 'package:medicine_project/utils/controller.dart';
import 'package:medicine_project/utils/textField_breakPoints.dart';
import '/utils/constants.dart';
import '/view/widgets.dart';

import '../utils/break_points.dart';
import 'components/drawer_widgets.dart';
import 'components/table_widgets.dart';

class AddCustomerScreen extends StatefulWidget {
  final isOpen, size;
  const AddCustomerScreen({this.isOpen, this.size});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  //final person = ["Sr.", "Name", "Batch#", "QTY", "C.P", "S.P", "Actions"];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
     width: !widget.isOpen
          ? size.width - 60
          : size.width - (drawerWidth + 60),
      height: size.height * 0.84,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: CustomText(
                words: "Add Customer",
                color: primaryColor,
                fontsize: 38,
                fontFamily: "interSemiBold",
                fontweight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80, top: 30),
            child: size.width < 950
                ? customColumnNameEmail(size)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customColumn(
                          textFeildcontroller: namecustomerAddcontroller,
                          heading: "Name:",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,
                          textfieldheight: size.height * 0.07,
                          textfieldwidth: size.width * 0.3),
                      customColumn(
                          textFeildcontroller: emailcustomerAddcontroller,
                          heading: "Email:",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,
                          textfieldheight: size.height * 0.07,
                          textfieldwidth: size.width * 0.3),
                    ],
                  ),
          ),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: const EdgeInsets.only(right: 80),
            child: size.width < 950
                ? customColumnPhoneLicense(size)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customColumn(
                          textFeildcontroller: phonecustomerAddcontroller,
                          heading: "Phone no.",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,
                          textfieldheight: size.height * 0.07,
                          textfieldwidth: size.width * 0.3),
                      SizedBox(height: size.height * 0.25),
                      customColumn(
                          textFeildcontroller: licensecontroller,
                          heading: "License:",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,
                          textfieldheight: size.height * 0.07,
                          textfieldwidth: size.width * 0.3),
                    ],
                  ),
          ),
          Padding(padding: EdgeInsets.only(right: 80),
          child: customColumn(
              textFeildcontroller: updatedescriptioncontroller,
              heading: "Description",
              fontsize: 15,
              // textfieldwidth: size.width*0.76,
              sizeboxheight: size.height * 0.009,
              minlinez: 3,
              maxlin: 4)),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right:80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customSaveCancelAddCustomerButton(context,
                    nameCustomerAddController: namecustomerAddcontroller,
                    addressCustomerAddController: emailcustomerAddcontroller,
                    phoneCustomerAddController: phonecustomerAddcontroller,
                    licenseCustomAddController: licensecontroller,
                    descriptioncontroller:updatedescriptioncontroller),
              ],
            ),
          )
        ],
      ),
    );
  }
}
