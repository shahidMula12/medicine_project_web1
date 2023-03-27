import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medicine_project/controller/api_manager.dart';
import 'package:medicine_project/controller/global_state.dart';
import 'package:medicine_project/provider/provider_class.dart';
import 'package:medicine_project/controller/preferences.dart';
import 'package:medicine_project/utils/controller.dart';
import 'package:medicine_project/utils/dialogue_box.dart';
import 'package:medicine_project/utils/loader/loading.dart';
import 'package:medicine_project/utils/screen_names.dart';
import 'package:medicine_project/view/login.dart';
import 'package:medicine_project/view/payment.dart';
import 'package:provider/provider.dart';
import '/utils/constants.dart';
import '/view/update_stock.dart';

import 'Add_Stock.dart';
import 'add_customer.dart';
import 'customer_list.dart';
import 'dashboard.dart';

Widget CustomText({
  words,
  color,
  fontsize,
  fontweight,
  overflow,
  text,
  fontFamily = "Roboto"
}) {
  return Text(
    //textScaleFactor: space,
    words,
    style: TextStyle(
      letterSpacing: 1,
        color: color,
        overflow: overflow,
        fontSize: fontsize,        
        fontWeight: fontweight,
        fontFamily: fontFamily),
  );
}

class CustomDashboard extends StatefulWidget {
  final size;
  const CustomDashboard({super.key, this.size});

  @override
  State<CustomDashboard> createState() => _CustomDashboardState();
}

class _CustomDashboardState extends State<CustomDashboard> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderClass>(context, listen: false);
    return Container(
      color: primaryColor,
      width: widget.size.width * 0.15,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Devsinn business Portal",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/images.jpg"),
                radius: 30,
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  provider.changeScreen(DASHBOARD);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.dashboard,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.all(0),
                dense: true,
                horizontalTitleGap: 8,
                minLeadingWidth: 0,
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 67),
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  ),
                  // tilePadding: EdgeInsets.zero,
                  iconColor: Colors.white,
                  leading: const Icon(
                    Icons.inventory,
                    color: Colors.white,
                    size: 18,
                  ),
                  title: Text(
                    "Stock",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                       provider.changeScreen(ADDSTOCK);
                      },
                      child: Row(children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add Stock",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                      provider.changeScreen(UPDATESTOCK);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Update Stock",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.all(0),
                dense: true,
                horizontalTitleGap: 8,
                minLeadingWidth: 0,
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 67),
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  ),
                  // tilePadding: EdgeInsets.zero,
                  iconColor: Colors.white,
                  leading: InkWell(
                    onTap: () {
                     provider.changeScreen(CUSTOMER);
                    },
                    child: const Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  title: Text(
                    "Customer",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                       provider.changeScreen(ADDCUSTOMER);
                      },
                      child: Row(children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add Customer",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  provider.changeScreen(INVOICESECTION);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.article,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Invoice",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      width: 37,
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 23,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ]),
      ),
    );
  }
}

Widget CustomTextField(context) {
  return Row(
    children: [
      Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
            color: Color(0xffF7F7F7),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: TextField(
          controller: overallsearchcontroller,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffF7F7F7)),
              ),
              contentPadding: EdgeInsets.only(top: 3, left: 10),
              fillColor: Color(0xffF7F7F7),
              filled: true,
             enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
               borderSide: BorderSide(
              color: Color(0xffF7F7F7),
             ),),
              suffixIcon: IconButton(onPressed: (){}, icon: Icon(
                Icons.search,
                size: 30,
                color: primaryColor,
              )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: "Search....",
              hintStyle: TextStyle(color: Color(0xffB9B9B9))),
        ),
  )],
    );
  
}

Widget CustomTextField2(context) {
  return Row(children: [
    Container(
      width: 330,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
          color: greyFillColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        controller: searchcontroller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: Color(0xffF7F7F7),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xffF7F7F7)
            
            ),),
              contentPadding: EdgeInsets.all(0),
              fillColor: greyFillColor,
              prefixIcon:IconButton(onPressed: (){}, icon:  Icon(
              Icons.search,
              color: primaryColor,
              )),
              border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
              hintText: "Search by Name",
              hintStyle: TextStyle(color: Color(0xffB9B9B9))),
        ),
      ),
    ]);
  
}

Widget customConatainer(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, top: 20),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.07,
      child: Center(
          child: CustomText(
              words: "Issue Stock",
              color: Colors.white,
              fontweight: FontWeight.bold)),
      decoration: BoxDecoration(
          color: Color(0xff24515C),
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
  );
}

Widget customConatainer2(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, top: 13),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.08,
      child: Center(
          child: CustomText(
              words: "Balance Stock",
              color: Colors.white,
              fontweight: FontWeight.bold)),
      decoration: const BoxDecoration(
          color: Color(0xff24515C),
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
  );
}
//----------------Update screen

CustomTextfield3(
    {textfeildcontroller,
    fillcolor,
    width,
    height,
    filled,
    isObscure = false,
    icon,
    hintcolor,
    hinttext,
    ontap,
    focuscolor,
    // TextAlign,
    // enable,
    minline,
    suffixicon,
    // top,
    max}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextField(
      
      onTap: ontap,
      obscureText: isObscure,
      controller: textfeildcontroller,
      textAlign: TextAlign.left,
      maxLines: max,
      minLines: minline,
      
      decoration: InputDecoration(
        suffix: suffixicon,
        fillColor: fillcolor,
        contentPadding: EdgeInsets.only(
          left:11,top: 20,right: 5
        ),
        suffixIcon: icon,
        focusColor: focuscolor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: textfieldColor),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: textfieldColor, width: 00),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        // enabled: enable,
        filled: filled,
        // fillColor: fillcolor,
        hintStyle: TextStyle(color: hintcolor),
        hintText: hinttext,
      ),
    ),
  );
}

customColumn({
  sizeboxheight,
  textFeildcontroller,
  textfieldheight,
  textfieldwidth,
  heading,
  hint,
  minlinez,
  maxlin,
  size,
  fontsize,
  keyboard,
  Fs,
  onpress,
  overflow,
  suffixicons
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
          words: heading,
          color: newColor,
          overflow: overflow,
          fontsize: fontsize,
          fontweight: FontWeight.bold),
      SizedBox(height: sizeboxheight),
      CustomTextfield3(
        suffixicon: suffixicons,
        ontap: onpress,
        textfeildcontroller: textFeildcontroller,
        max: maxlin,
        minline: minlinez,
        hinttext: hint,
        width: textfieldwidth,
        height: textfieldheight,
        filled: true,
        fillcolor: greyFillColor,
        
        // enable: true
      )
    ],
  );
}

customSaveCancelButton(
  context, {
  nameController,
  batchController,
  object,
  quantityController,
  saleController,
  costController,
  expiryController,
  descriptionController,
}) {
  return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 2,
      runSpacing: 10,
      children: [
        InkWell(
          onTap: () async {
            if (nameController.text.isEmpty) {
              validationAlert(context, title: "Name");
            } else if (quantityController.text.isEmpty) {
              validationAlert(context, title: "Quantity");
            } else if (batchController.text.isEmpty) {
              validationAlert(context, title: "Batch No");
            } else if (expiryController.text.isEmpty) {
              validationAlert(context, title: "Expiry Date");
            } else if (saleController.text.isEmpty) {
              validationAlert(context, title: "Sale Price");
            } else if (costController.text.isEmpty) {
              validationAlert(context, title: "Cost Price");
            } else if (descriptionController.text.isEmpty) {
              validationAlert(context, title: "Description");
            } else {
              var data = {
                "name": nameController.text,
                "batchNo": batchController.text,
                "quantity": quantityController.text,
                "costPrice": costController.text,
                "salePrice": saleController.text,
                "description": descriptionController.text,
                "expiryDate": expiryController.text,
              };
              // print({data});

              Loader.AnimationLoader(context);
              var response = await ApiManager.addStock(body: data);
              Navigator.pop(context);

              if (response['StatusCode'] == 200 ||
                  response['statusCode'] == 200) {
                validationAlert(context,
                    title: response['message'], isShow: false);
                nameController.clear();
                quantityController.clear();
                saleController.clear();
                expiryController.clear();
                batchController.clear();
                descriptionController.clear();
                costController.clear();
              } else {
                validationAlert(context, title: response['message']);
              }
            }
          },
          child: Container(
            child: Center(
              child: CustomText(words: "Save",color: Colors.white ),
            ),
           height: 45,
          width: 110,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(7)),
          ),
        ),
        SizedBox(width: 10,),
        InkWell(
          onTap: (){

          },
          child: Container(
            child: Center(
              child: CustomText(words: "Cancel", color: primaryColor),
            ),
            height: 45,
          width: 110,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7),border:Border.all(color: primaryColor)),
              
          ),
        ),
      ]);
}

//Update Stock Button
customSaveCancelUpdateStockButton(
  context, {
  updateNameController,
  updateBatchController,
  updateQuantityController,
  updateSaleController,
  updateCostController,
  updateExpiryController,
  updateDescriptionController,
}) {
  return Wrap(
    verticalDirection: VerticalDirection.down,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 2,
    runSpacing: 10,
    children: [
      InkWell(
        onTap: () async {
          print(updateNameController.text + "test");
          if (updateNameController.text.isEmpty) {
            validationAlert(context, title: "Name");
          } else if (updateQuantityController.text.isEmpty) {
            validationAlert(context, title: "Quantity");
          } else if (updateBatchController.text.isEmpty) {
            validationAlert(context, title: "Batch No");
          } else if (updateExpiryController.text.isEmpty) {
            validationAlert(context, title: "Expiry Date");
          } else if (updateSaleController.text.isEmpty) {
            validationAlert(context, title: "Sale Price");
          } else if (updateCostController.text.isEmpty) {
            validationAlert(context, title: "Cost Price");
          } else if (updateDescriptionController.text.isEmpty) {
            validationAlert(context, title: "Description");
          } else {
            var Updatedata = {"batchNo": updateBatchController.text};
            // print({data});
            Loader.AnimationLoader(context);
            ApiManager.updateStock(body: Updatedata);
            Navigator.pop(context);
          }
        },
        child: Container(
          child: Center(
            child: CustomText(words: "Save", color: Colors.white),
          ),
          height: 45,
          width: 110,
          decoration: BoxDecoration(
              color:primaryColor, borderRadius: BorderRadius.circular(7)),
        ),
      ),
      SizedBox(width: 10,),
      InkWell(
        onTap: () {},
        child: Container(
          child: Center(
            child: CustomText(words: "Cancel", color: primaryColor),
          ),
          height: 45,
          width: 110,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor), borderRadius: BorderRadius.circular(7)),
        ),
      )
    ],
  );
}

//CustomerAddButton

customSaveCancelAddCustomerButton(
  context, {
  nameCustomerAddController,
  addressCustomerAddController,
  phoneCustomerAddController,
  licenseCustomAddController,
  descriptioncontroller
}) {
  return Row(
    children: [
      InkWell(
        onTap: () async {
          if (nameCustomerAddController.text.isEmpty) {
            validationAlert(context, title: "Name");
          } else if (addressCustomerAddController.text.isEmpty) {
            validationAlert(context, title: "address");
          } else if (phoneCustomerAddController.text.isEmpty) {
            validationAlert(context, title: "phone");
          } else if (licenseCustomAddController.text.isEmpty) {
            validationAlert(context, title: "license");
          } else {
            var data1 = {
              "name": nameCustomerAddController.text,
              "address": addressCustomerAddController.text,
              "phoneNo": phoneCustomerAddController.text,
              "licenseNo": licenseCustomAddController.text
            };
            // print({data});

            Loader.AnimationLoader(context);
            var response = await ApiManager.addCustomer(body: data1);
            Navigator.pop(context);
            if (response["StatusCode"] == 200 ||
                response["stattusCode"] == 200) {
              validationAlert(context,
                  title: response["message"], isShow: false);
              nameCustomerAddController.clear();
              addressCustomerAddController.clear();
              phoneCustomerAddController.clear();
              licenseCustomAddController.clear();
              updatedescriptioncontroller.clear();
            } else {
              validationAlert(context, title: response["message"]);
            }
          }
        },
        child: Container(
          child: Center(
            child: CustomText(words: "Save", color: Colors.white),
          ),
          height: 45,
          width: 110,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(7)),
        ),
      ),
      SizedBox(width: 10,),
      InkWell(
        onTap: () {},
        child: Container(
          child: Center(
            child: CustomText(words: "Cancel", color:primaryColor),
          ),
          height: 45,
          width: 110,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(7),),
        ),
      )
    ],
  );
}

customSaveCancelButton1(
  context, {
  nameController,
  addresscontroller,
  phonecontroller,
  licensecontroller,
  descriptioncontroller
}) {
  return Row(
    children: [
      InkWell(
        onTap: () async {
          if (nameController.text.isEmpty) {
            validationAlert(context, title: "Name");
          } else if (addresscontroller.text.isEmpty) {
            validationAlert(context, title: "Address");
          } else if (phonecontroller.text.isEmpty) {
            validationAlert(context, title: "Phone No");
          } else if (licensecontroller.text.isEmpty) {
            validationAlert(context, title: "Licese");
          } else {
            var data = {
              {
                "name": nameController.text,
                "address": addresscontroller.text,
                "phoneNo": phonecontroller.text,
                "licenseNo": licensecontroller.text,
              }
            };
            print({data});

            Loader.AnimationLoader(context);
            await ApiManager.addCustomer(body: data);
            // Navigator.pop(context);
          }
        },
        child: Container(
          child: Center(
            child: CustomText(words: "Save", color: Colors.white),
          ),
          height: 45,
          width: 110,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(7)),
        ),
      ),
      SizedBox(width: 10,),
      InkWell(
        onTap: () {},
        child: Container(
          child: Center(
            child: CustomText(words: "Cancel", color: Color(0xff4C757E)),
          ),
          height: 45,
          width: 110,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(7)),
        ),
      )
    ],
  );
}

Widget CustomIcon({
  icon,
}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Icon(
      icon,
    ),
  );
}

Widget CustomConatainer3({size}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      height: size.height * 0.04,
      width: size.width * 0.02,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(image: AssetImage("assets/images/images.jpg")),
          color: Colors.blue),
    ),
  );
}

CustomTextfield(
    {textfeildcontroller,
    fillcolor,
    hintsize,
    width,
    height,
    filled,
    icon,
    hintcolor,
    hinttext,
    onpress,
    contentpadding,
    // enable,
    // textalign,
    minline,
    max}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextField(
      onTap: onpress,
      // textAlign: textalign,
      controller: textfeildcontroller,
      maxLines: max,
      minLines: minline,
      decoration: InputDecoration(
        contentPadding: contentpadding,
        prefixIcon: icon,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF7F7F7)),
            borderRadius: BorderRadius.circular(7)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF7F7F7),
            ),
            borderRadius: BorderRadius.all(Radius.circular(7))),
        // enabled: enable,
        filled: filled,
        fillColor: fillcolor,
        hintStyle: TextStyle(color: hintcolor, fontSize: hintsize),
        hintText: hinttext,
      ),
    ),
  );
}

Widget columnSignUp(
    {width,
    height,
    color,
    size,
    context,
    firstNameController,
    lastNameController,
    emailController,
    passwordController,
    confirmPasswordController,
    licenseNoController,
    cnicController}) {
  return Container(
    width: width,
    height: height,
    color: color,
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text("SignUp")
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: CustomText(
              words: "Sign Up",
              color: Colors.black,
              fontsize: 30,
              fontweight: FontWeight.bold),
        ),
        SizedBox(
          height: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                words: "First Name", fontsize: 17, fontweight: FontWeight.bold),
            SizedBox(
              height: 7,
            ),
            CustomTextfield3(
// controller: namecontroller,
                textfeildcontroller: firstNameController,
                width: width * 0.42,
                filled: true,
                fillcolor: greyWhite
                // height: height*0.1,
                // fillcolor: Colors.black
                ),
          ],
        ),
        CustomText(
            words: "Last Name", fontsize: 17, fontweight: FontWeight.bold),
        SizedBox(
          height: 7,
        ),
        CustomTextfield3(
            textfeildcontroller: lastNameController,
            width: width * 0.42,
            filled: true,
            fillcolor: greyWhite
            // fillcolor: greyWhite,
            ),
        SizedBox(
          height: 20,
        ),

        CustomText(
          words: "E-mail",
          fontsize: 17,
          fontweight: FontWeight.bold,
        ),
        SizedBox(
          height: 7,
        ),
        CustomTextfield3(
            textfeildcontroller: emailController,
            width: width * 0.89,
            filled: true,
            fillcolor: greyWhite),
        SizedBox(
          height: 20,
        ),

        CustomText(
            words: "Password", fontsize: 17, fontweight: FontWeight.bold),
        SizedBox(
          height: 7,
        ),
        CustomTextfield3(
            textfeildcontroller: passwordController,
            width: width * 0.42,
            filled: true,
            fillcolor: greyWhite,
            icon: Icon(Icons.remove_red_eye)),
        CustomText(
            words: "Confirm Password",
            fontsize: 17,
            fontweight: FontWeight.bold),
        SizedBox(
          height: 7,
        ),
        CustomTextfield3(
            textfeildcontroller: confirmPasswordController,
            width: width * 0.42,
            filled: true,
            fillcolor: greyWhite,
            icon: Icon(Icons.remove_red_eye)),
        SizedBox(
          height: 20,
        ),

        CustomText(
            words: "License No", fontsize: 17, fontweight: FontWeight.bold),
        SizedBox(
          height: 7,
        ),
        CustomTextfield3(
            textfeildcontroller: licenseNoController,
            width: width * 0.42,
            filled: true,
            fillcolor: greyWhite),
        CustomText(words: "CNIC", fontsize: 17, fontweight: FontWeight.bold),
        SizedBox(
          height: 7,
        ),
        CustomTextfield3(
            textfeildcontroller: cnicController,
            width: width * 0.42,
            filled: true,
            fillcolor: greyWhite),
        SizedBox(
          height: 20,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1,
                width: width * 0.3,
                color: Colors.black,
              ),
              CustomText(
                  words: "Or SignUp With",
                  color: Colors.black,
                  fontsize: 20,
                  fontweight: FontWeight.bold),
              Container(
                height: 1,
                color: Colors.black,
                width: width * 0.3,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.facebook,
                size: 40,
              ),
              SizedBox(
                width: 60,
              ),
              Icon(
                Icons.facebook,
                size: 40,
              ),
              SizedBox(
                width: 60,
              ),
              Icon(
                Icons.facebook,
                size: 40,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget SignUpContainer1({
  width,
  height,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        Container(
          child: Container(),
          width: width,
          height: height,
          // color: color,
          decoration: BoxDecoration(
            color: Color(0xff253078),

            // gradient: LinearGradient(colors:[Color(0xff41A7E4),Color(0xff41A7E4),Color(0xff5D86E7),Color(0xff1AEDDF)] )
          ),
          
        ),
      ],
    ),
  );
}

Widget SignUpContainer({size, image}) {
  return Container(
    color: Color(0xff253078),
    height: size.height,
    width: size.width * 0.5,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 110,
        ),
        child: Container(
          height: size.height * 0.9,
          width: size.width * 0.46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              color: Colors.white),
          // color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: CustomText(
                      words: "Sign Up",
                      color: Color(0xff32409A),
                      fontsize: 50,
                      fontweight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: size.width * 0.1,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/devs.jpg"))),
                ),
                CustomText(words: "Dev's Inn Technologies", fontsize: 30,fontweight: FontWeight.bold),
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/amico.jpg"))),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget LoginContainer({
  size,
}) {
  return Container(
    color: Color(0xff253078),
    height: size.height,
    width: size.width * 0.5,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 110,
        ),
        child: Container(
          height: size.height * 0.9,
          width: size.width * 0.46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              color: Colors.white),
          // color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: size.width * 0.1,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/devs.jpg"))),
                ),
                CustomText(words: 'Devs Inn Technologies', fontsize: 30),
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/amico.jpg"))),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget CustomSignUp(context,
    {color,
    height,
    width,
    nameController,
    phonecontroller,
    emailController,
    passwordController,
    confirmPasswordController,
    licenseNoController,
    addresscontroller,
    distributioncontroller,
    image}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)), color: color),
    child: MaterialButton(
        onPressed: () async {
          if (nameController.text.isEmpty) {
            validationAlert(context, title: "Name");
          }
 
  else if (phonecontroller.text.isEmpty) {
            validationAlert(context, title: 'Phone No');
          }else if( 
            !phonecontroller.text.contains("03") ||   phonecontroller.text.length  !=11 ){
            validationAlert(context,title: "Valid Phone No ");
          }
     else if (distributioncontroller.text.isEmpty) {
            validationAlert(context, title: "Distribution Name");
          } else if (emailController.text.isEmpty) {
            validationAlert(context, title: "Email");
          }else if (!emailController.text.contains("@") || !emailController.text.contains(".com") ) {
          validationAlert(context, title: "Valid Mail");
          
        }
           else if (licenseNoController.text.isEmpty) {
            validationAlert(context, title: "License No");
          }
          else if (  licenseNoController.text.length !=6 ) {
  // show error message
  validationAlert(context,title: "Valid License No");
  
}     
           else if (passwordController.text.isEmpty) {
            validationAlert(context, title: "Password");
          } else if (confirmPasswordController.text.isEmpty) {
            validationAlert(context, title: "Confirm Password");
          } else if (confirmPasswordController.text !=
              passwordController.text) {
            validationAlert(context, title: "Same Password");
          } else if (addresscontroller.text.isEmpty) {
            validationAlert(context, title: "Address");
          } else if (image == null) {
            validationAlert(context, title: " Signature");
          } else {
            var data = {
              "name": nameController.text,
              "phoneNo": phonecontroller.text,
              "email": emailController.text,
              "licenseNo": licenseNoController.text,
              "password": passwordController.text,
              "confirmPassword": confirmPasswordController.text,
              "address": addresscontroller.text,
              "image":jsonEncode(image)
            };

            Loader.AnimationLoader(context);
            print(data);
            var response = await ApiManager.getSignUp(body: data);
            Navigator.pop(context);
            if (response['StatusCode'] == 200 ||
                response['statusCode'] == 200) {
                  if (response['data'] != null) {
                                       Navigator.push(context, CupertinoPageRoute(builder:(context) => LogIn(),));
                  }
              validationAlert(context,
                  title: response['message'], isShow: false);
              nameController.clear();
              phonecontroller.clear();
              distributioncontroller.clear();
              emailController.clear();
              passwordController.clear();
              confirmPasswordController.clear();
              licenseNoController.clear();
              addresscontroller.clear();
            } else {
              validationAlert(context, title: response['message']);
            }
          }
        },
        child: CustomText(
            words: 'Sign Up',
            fontsize: 25,
            fontweight: FontWeight.bold,
            color: Colors.white)),
  );
  // userRegistration(){
  //   ApiManager.getSignUp(body: );
  // }
}

Widget Customlogin(context,
    {width, height, color, emailController, passwordController}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)), color: color),
    child: MaterialButton(
      onPressed: () async {
        if (emailController.text.isEmpty) {
          validationAlert(context, title: "Email");
        } else if (!emailController.text.contains("@") || !emailController.text.contains(".com") ) {
          validationAlert(context, title: "Valid Mail");

        } else if (passwordController.text.isEmpty) {
          validationAlert(context, title: "Password");
        } else {
          var data = {
            "email": emailController.text,
            "password": passwordController.text,
          };
          Loader.AnimationLoader(context);
          print(data);
          var response = await ApiManager.getLogIn(body: data);
          // Navigator.push(context,CupertinoPageRoute(builder:(context) => DashBoard( ),));
          Navigator.pop(context);
          if (response['StatusCode'] == 200 || response['statusCode'] == 200) {

            if(response['data'] != null){

           await SavedPreferences.saveLoginDetails(response);
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=> DashBoard() ), (route) => false);
            emailController.clear();
            passwordController.clear();

            }else{
               validationAlert(
              context,
              title: response['message'],
            );
            }
           
          } else {
            validationAlert(
              context,
              title: response['message'],
            );
          }
        }
      },
      child: CustomText(
          words: 'Login',
          fontsize: 25,
          fontweight: FontWeight.bold,
          color: Colors.white),
    ),
  );
}


// customTextfld({Width, height, textfieldheight}){
//   return  Container(
//                           width: Width,
//                           // height: 300,
                          
//                           child: TextField(
//                               style: TextStyle(fontSize: textfieldheight),
//                               decoration: InputDecoration(
//                                   fillColor: Color(0xffF7F7F7),
//                                   filled: true,
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Color(0xffF7F7F7))),
//                                   border: OutlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Color(0xffF7F7F7))),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Color(0xffF7F7F7))))),
//                         );
// }

// CustomColumn({size, fontsze,heading, textfieldwidth, Textfldheight}){
//   return  Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                         CustomText(words: heading, fontweight: FontWeight.bold, fontsize: fontsze, color: Colors.black),
//                         SizedBox(height: 3),
//                         customTextfld(Width: textfieldwidth, textfieldheight: Textfldheight
//                           // Width:size.width*0.35
//                           )
//                        ],);

// }
