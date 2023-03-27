import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medicine_project/utils/controller.dart';
import '/utils/constants.dart';
import '/view/widgets.dart';

import '../utils/break_points.dart';
import '../utils/checkbox_widgets.dart';
import 'components/drawer_widgets.dart';

class viewStock extends StatefulWidget {
  final isOpen;
  const viewStock({this.isOpen});

  @override
  State<viewStock> createState() => _viewStockState();
}

class _viewStockState extends State<viewStock> {
  bool isAdded = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: !widget.isOpen ? size.width : size.width * 0.855,
      height: size.height * 0.84,
      decoration: BoxDecoration(color: Color(0xffD2D2D2)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: size.width * 0.85,
            height: size.height * 0.80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFFFFFF)),
            //add stock
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          words: "View Stock",
                          color: Color(0xff1D515C),
                          fontsize: 23,
                          fontweight: FontWeight.bold),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          child: const Center(
                              child: Icon(
                                  color: Colors.white, size: 22, Icons.add)),
                          radius: 14,
                          backgroundColor: Color(0xff0FA958),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.07),
                  textFieldsBreakpoint(size)
                      ? Column(
                          children: [
                            customColumn(
                              heading: "Name:",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              textFeildcontroller: updatenamecontroller,
                              // textfieldwidth: size.width * 0.4
                            ),
                            SizedBox(height: size.height * 0.02),
                            customColumn(
                                heading: "Quantity:",
                                sizeboxheight: size.height * 0.007,
                                textfieldheight: size.height * 0.06,
                                textFeildcontroller: updatequantitycontroller
                                // textfieldwidth: size.width * 0.4
                                ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customColumn(
                                  textFeildcontroller: updatenamecontroller,
                                  heading: "Name:",
                                  sizeboxheight: size.height * 0.007,
                                  textfieldheight: size.height * 0.06,
                                  textfieldwidth: size.width * 0.35),
                              customColumn(
                                  textFeildcontroller: updatequantitycontroller,
                                  heading: "Quantity:",
                                  sizeboxheight: size.height * 0.007,
                                  textfieldheight: size.height * 0.06,
                                  textfieldwidth: size.width * 0.35),
                            ],
                          ),
                        ),
                  SizedBox(height: size.height * 0.02),
                  textFieldsBreakpoint(size)
                      ? Column(children: [
                          customColumn(
                              textFeildcontroller: updatebatchcontroller,
                              heading: "Batch no:",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              // textfieldwidth: size.width * 0.4,
                              size: size),
                          SizedBox(height: size.height * 0.02),
                          customColumn(
                              textFeildcontroller: updateexpirycontroller,
                              heading: "Expiry date:",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              // textfieldwidth: size.width * 0.4,
                              hint: "dd/mm/yyyy"),
                        ])
                      : Padding(
                          padding: const EdgeInsets.only(left: 11, right: 9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customColumn(
                                  textFeildcontroller: updatebatchcontroller,
                                  heading: "Batch no:",
                                  sizeboxheight: size.height * 0.007,
                                  textfieldheight: size.height * 0.06,
                                  textfieldwidth: size.width * 0.35,
                                  size: size),
                              customColumn(
                                  textFeildcontroller: updateexpirycontroller,
                                  heading: "Expiry date:",
                                  sizeboxheight: size.height * 0.007,
                                  textfieldheight: size.height * 0.06,
                                  textfieldwidth: size.width * 0.35,
                                  hint: "dd/mm/yyyy"),
                            ],
                          ),
                        ),
                  SizedBox(height: size.height * 0.02),
                  textFieldsBreakpoint(size)
                      ? Column(
                          children: [
                            customColumn(
                              textFeildcontroller: updatesalecontroller,
                              heading: "Sale Price:",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              // textfieldwidth: size.width * 0.4
                            ),
                            SizedBox(height: size.height * 0.02),
                            customColumn(
                              textFeildcontroller: updatecostcontroller,
                              heading: "Cost Price:",
                              sizeboxheight: size.height * 0.007,
                              textfieldheight: size.height * 0.06,
                              // textfieldwidth: size.width * 0.4
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 11, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customColumn(
                                  textFeildcontroller: updatesalecontroller,
                                  heading: "Sale Price:",
                                  sizeboxheight: size.height * 0.007,
                                  textfieldheight: size.height * 0.06,
                                  textfieldwidth: size.width * 0.35),
                              customColumn(
                                  textFeildcontroller: updatecostcontroller,
                                  heading: "Cost Price:",
                                  sizeboxheight: size.height * 0.007,
                                  textfieldheight: size.height * 0.06,
                                  textfieldwidth: size.width * 0.35),
                            ],
                          ),
                        ),
                  SizedBox(height: size.height * 0.03),
                  customColumn(
                      textFeildcontroller: updatedescriptioncontroller,
                      heading: "Description",
                      sizeboxheight: size.height * 0.007,
                      minlinez: 3,
                      maxlin: 4),
                  SizedBox(height: size.height * 0.04),
                  addStockBreakPointChecker(size)
                      ? Column(
                          children: [customSaveCancelButton(context)],
                        )
                      : Row(
                          children: [
                            Spacer(),
                            customSaveCancelUpdateStockButton(context,
                                updateNameController: updatenamecontroller,
                                updateQuantityController:
                                    updatequantitycontroller,
                                updateBatchController: updatebatchcontroller,
                                updateExpiryController: updateexpirycontroller,
                                updateSaleController: updatesalecontroller,
                                updateCostController: updatecostcontroller,
                                updateDescriptionController:
                                    updatedescriptioncontroller)
                          ],
                        ),
                  // size.width  <=510?   Column(children:[customSaveCancelButton()]):
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
