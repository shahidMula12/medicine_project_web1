import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_project/utils/controller.dart';
import '/utils/constants.dart';
import '/view/widgets.dart';
import '../utils/break_points.dart';
import '../utils/checkbox_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AddStock extends StatefulWidget {
  final isOpen, size;
  AddStock({this.isOpen, this.size});
  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
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
                    words: "Add Stock",
                    color: primaryColor,
                    fontsize: 40,
                    fontweight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.07),
              size.width < 1200
                  ? Column(
                      children: [
                        customColumn(
                          heading: "Name",
                          fontsize: 15,
                          sizeboxheight: size.height * 0.009,

                          textfieldheight: size.height * 0.07,

                          textFeildcontroller: namecontroller,
                          // textfieldwidth: size.width * 0.4
                        ),
                        SizedBox(height: size.height * 0.02),
                        customColumn(
                            fontsize: 15,
                            heading: "Quantity",
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: quantitycontroller
                            // textfieldwidth: size.width * 0.4
                            ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customColumn(
                            // Fs:70,
                            fontsize: 15,
                            heading: "Name",
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: namecontroller,
                            textfieldwidth: size.width * 0.35),
                        
                        customColumn(
                            fontsize: 15,
                            heading: "Quantity",
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: quantitycontroller,
                            textfieldwidth: size.width * 0.35),
                      ],
                    ),
              SizedBox(height: size.height * 0.02),
              size.width < 1200
                  ? Column(children: [
                      customColumn(
                          fontsize: 15,
                          heading: "Batch no",
                          sizeboxheight: size.height * 0.009,
                          textfieldheight: size.height * 0.07,
                          textFeildcontroller: batchcontroller,
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
                          fontsize: 15,
                          heading: "Expiry date",
                          sizeboxheight: size.height * 0.009,
                          textfieldheight: size.height * 0.07,
                          textFeildcontroller: expirycontroller,
                          // textfieldwidth: size.width * 0.4,
                          hint: selectedDate != null
                              ? selectedDate
                              : "dd/mm/yyyy"),
                    ])
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customColumn(
                            fontsize: 15,
                            heading: "Batch no",
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textfieldwidth: size.width * 0.35,
                            textFeildcontroller: batchcontroller,
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
                            fontsize: 15,
                            heading: "Expiry date",
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textfieldwidth: size.width * 0.35,
                            textFeildcontroller: expirycontroller,
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
                            fontsize: 15,
                            heading: "Sale Price",
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: salecontroller
                            // textfieldwidth: size.width * 0.4
                            ),
                        SizedBox(height: size.height * 0.02),
                        customColumn(
                          fontsize: 15,
                          heading: "Cost Price",
                          sizeboxheight: size.height * 0.009,

                          textfieldheight: size.height * 0.07,

                          textFeildcontroller: costcontroller,
                          // textfieldwidth: size.width * 0.4
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customColumn(
                            fontsize: 15,
                            heading: "Sale Price",
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: salecontroller,
                            textfieldwidth: size.width * 0.35),
                        customColumn(
                            fontsize: 15,
                            heading: "Cost Price",
                            sizeboxheight: size.height * 0.009,
                            textfieldheight: size.height * 0.07,
                            textFeildcontroller: costcontroller,
                            textfieldwidth: size.width * 0.35),
                      ],
                    ),
              SizedBox(height: size.height * 0.03),
              customColumn(
                  textFeildcontroller: descriptioncontroller,
                  fontsize: 15,
                  heading: "Description",
                  overflow: TextOverflow.ellipsis ,
                  sizeboxheight: size.height * 0.007,
                  // minlinez: 1,
                  
                  maxlin: 3),
              SizedBox(height: size.height * 0.04),
              size.width < 1200
                  ? Column(
                      children: [
                        Row(
                          children: [
                            CustomCheckBox(
                              isAdded: isAdded,
                              onPressed: (val) {
                                setState(() {
                                  isAdded = val;
                                });
                              },
                            ),
                            SizedBox(width: size.width * 0.004),
                            size.width < 603
                                ? Text("Do you want to save..")
                                : Text("Do you want to save another stock."),
                          ],
                        ),
                        SizedBox(height: 15),
                        customSaveCancelButton(context)
                      ],
                    )
                  : Row(
                      children: [
                        Row(
                          children: [
                            CustomCheckBox(
                              isAdded: isAdded,
                              onPressed: (val) {
                                setState(() {
                                  isAdded = val;
                                });
                              },
                            ),
                            SizedBox(width: size.width * 0.002),
                            Text(
                              "Do you want to save another stock.",
                              style: TextStyle(color:primaryColor),
                            ),
                          ],
                        ),
                        Spacer(),
                        customSaveCancelButton(context,
                            nameController: namecontroller,
                            descriptionController: descriptioncontroller,
                            batchController: batchcontroller,
                            quantityController: quantitycontroller,
                            expiryController: expirycontroller,
                            costController: costcontroller,
                            saleController: salecontroller),
                      ],
                    ),
              // size.width  <=510?   Column(children:[customSaveCancelButton()]):
              // SizedBox(height: 5),
              //  Container(
              //                 // height: 300,
              //                 child: TextField(
              //                   style: TextStyle(fontSize: 30),
              //                   decoration: InputDecoration(

              //                   border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
              //                 )),
              //               )
            ],
          ),
        ),
      ),
    );
  }
}
