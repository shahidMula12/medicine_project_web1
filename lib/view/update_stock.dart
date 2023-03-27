import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_project/utils/controller.dart';
import '/utils/constants.dart';
import '/view/widgets.dart';

import '../utils/break_points.dart';
import '../utils/checkbox_widgets.dart';
import 'components/drawer_widgets.dart';

class UpdateStock extends StatefulWidget {
  final isOpen, size;
  UpdateStock({this.isOpen, this.size});
  @override
  State<UpdateStock> createState() => _UpdateStockState();
}

class _UpdateStockState extends State<UpdateStock> {
  bool isAdded = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var selectedDate;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
    width: !widget.isOpen
          ? size.width - 60
          : size.width - (drawerWidth + 60),
      height: size.height * 0.84,
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                    words: "Update Stock",
                    color: primaryColor,
                    fontsize: 40,
                    fontweight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.07),
              size.width < 1200
                  ? Column(
                      children: [
                        customColumn(
                          heading: "Name:",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,

                          textfieldheight: size.height * 0.07,
                          textFeildcontroller: updatenamecontroller,
                          // textfieldwidth: size.width * 0.4
                        ),
                        SizedBox(height: size.height * 0.02),
                        customColumn(
                            heading: "Quantity:",
                            fontsize: 15,
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: updatequantitycontroller
                            // textfieldwidth: size.width * 0.4
                            ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customColumn(
                            heading: "Name:",
                            fontsize: 15,
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: updatenamecontroller,
                            textfieldwidth: size.width * 0.35),
                        customColumn(
                            heading: "Quantity:",
                            fontsize: 15,
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: updatequantitycontroller,
                            textfieldwidth: size.width * 0.35),
                      ],
                    ),
              SizedBox(height: size.height * 0.02),
              size.width < 1200
                  ? Column(children: [
                      customColumn(
                          heading: "Batch no:",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,
                          textfieldheight: size.height * 0.07,
                          textFeildcontroller: updatebatchcontroller,
                          // textfieldwidth: size.width * 0.4,
                          size: size),
                      SizedBox(height: size.height * 0.02),
                      customColumn(
                          onpress: () async {
                            DateTime? pickdate = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                            primary:
                                                primaryColor, // <-- SEE HERE
                                            onPrimary:
                                                Colors.white, // <-- SEE HERE
                                            onSurface: primaryColor)),
                                    child: child!,
                                  );
                                },
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2200));
                            if (pickdate != null) {
                              print(pickdate);
                              setState(() {
                                selectedDate =
                                    DateFormat("DD/MM/yyyy").format(pickdate);
                              });
                            }
                          },
                          heading: "Expiry date:",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,
                          textfieldheight: size.height * 0.07,
                          textFeildcontroller: updateexpirycontroller,
                          // textfieldwidth: size.width * 0.4,
                          hint: selectedDate != null
                              ? selectedDate
                              : "dd/mm/yyyy"),
                    ])
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customColumn(
                            heading: "Batch no:",
                            fontsize: 15,
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textfieldwidth: size.width * 0.35,
                            textFeildcontroller: updatebatchcontroller,
                            size: size),
                        customColumn(
                            onpress: () async {
                              DateTime? pickdate = await showDatePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary:
                                                  primaryColor, // <-- SEE HERE
                                              onPrimary:
                                                  Colors.white, // <-- SEE HERE
                                              onSurface: primaryColor)),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2200));
                              if (pickdate != null) {
                                print(pickdate);
                                setState(() {
                                  selectedDate =
                                      DateFormat("DD/MM/yyyy").format(pickdate);
                                });
                              }
                            },
                            heading: "Expiry date:",
                            fontsize: 15,
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textfieldwidth: size.width * 0.35,
                            textFeildcontroller: updateexpirycontroller,
                            hint: selectedDate != null
                                ? selectedDate
                                : "dd/mm/yyyy"),
                      ],
                    ),
              SizedBox(height: size.height * 0.02),
              size.width < 1200
                  ? Column(
                      children: [
                        customColumn(
                            heading: "Sale Price:",
                            fontsize: 15,
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: updatesalecontroller
                            // textfieldwidth: size.width * 0.4
                            ),
                        SizedBox(height: size.height * 0.02),
                        customColumn(
                          heading: "Cost Price:",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,

                          textfieldheight: size.height * 0.07,
                          textFeildcontroller: updatecostcontroller,
                          // textfieldwidth: size.width * 0.4
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customColumn(
                            heading: "Sale Price:",
                            fontsize: 15,
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: updatesalecontroller,
                            textfieldwidth: size.width * 0.35),
                        customColumn(
                            heading: "Cost Price:",
                            fontsize: 15,
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: updatecostcontroller,
                            textfieldwidth: size.width * 0.35),
                      ],
                    ),
              SizedBox(height: size.height * 0.03),
              customColumn(
                  textFeildcontroller: updatedescriptioncontroller,
                  heading: "Description",
                  fontsize: 15,
                  sizeboxheight: size.height * 0.009,
                  minlinez: 3,
                  maxlin: 4),
              SizedBox(height: size.height * 0.04),

              Row(
                children: [
                  Spacer(),
                  customSaveCancelUpdateStockButton(
                    context,
                    updateNameController: updatenamecontroller,
                    updateBatchController: updatebatchcontroller,
                    updateQuantityController: updatequantitycontroller,
                    updateSaleController: updatesalecontroller,
                    updateCostController: updatecostcontroller,
                    updateExpiryController: updateexpirycontroller,
                    updateDescriptionController: updatedescriptioncontroller,
                  ),
                ],
              ),
              // size.width  <=510?   Column(children:[customSaveCancelButton()]):
            ],
          ),
        ),
      ),
    );
  }
}
