import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine_project/controller/global_state.dart';
import 'package:medicine_project/utils/break_points.dart';
import 'package:medicine_project/utils/constants.dart';
import 'package:medicine_project/utils/controller.dart';
import 'package:medicine_project/utils/url_launcher.dart';
import 'package:medicine_project/view/dashboard.dart';
import 'package:medicine_project/view/login.dart';
import 'package:medicine_project/view/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../testPdf.dart';
import '../utils/login_checker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

 


  var selectedImage;
  File file = File("zz");
  Uint8List? webImage;
  uploadImage() async {
    //     if(_pickingType != FileType.CUSTOM || _hasValidMime){
    //   try {
    //     _paths = await FilePicker.getMultiFile(   // Or getFile
    //         type: FileType.CUSTOM, fileExtension: 'png');
    //   }
    //   on PlatformException catch (e){
    //     print("Unsupported operation: " + e.toString());
    //   }
    // }
    // return _paths;
    

    if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery,);
      if (image != null) {
        selectedImage = image;
        var f = await image.readAsBytes();
        setState(() {
          var _file = File('a');
          webImage = f;
        });
      } else {
        print('No file selected');
      }
    } else {
      print('permission not granted');
    }
  }

  bool isVisible = false;
  bool isVisible1 = false;

  addToggle() {
    setState(() {
      isVisible = !isVisible;
    });
  }addToggle1() {
    setState(() {
      isVisible1 = !isVisible1;
    });
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(     
      body: Row(
        children: [
          signUpBreakPointChecker(size)
              ? Container(
                  color: Color(0xffE8EBFF),
                  height: size.height,
                  width: size.width * 0.5,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 110,
                      ),
                      child: Container(
                        height: size.height * 0.9,
                        width: size.width * 0.46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Colors.white),
                        // color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 30),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            words: "Name:",
                                            
                                            fontsize: 15,
                                            fontweight: FontWeight.bold),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        CustomTextfield3(
                                            // controller: namecontroller,
                                            max: 1,
                                            hinttext: 'name',
                                            hintcolor: Colors.black26,
                                            textfeildcontroller:
                                                namecontroller,
                                            width: size.width * 0.18,
                                            height: size.height*0.053,
                                            filled: true,
                                            fillcolor: greyWhite,
                                            focuscolor: greyColor
                                            // height: height*0.1,
                                            // fillcolor: Colors.black
                                            ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.021,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            words: "Phone No:",
                                            fontsize: 15,
                                            fontweight: FontWeight.bold),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        CustomTextfield3(
                                            max: 1,
                                            hinttext: 'phone no',
                                            hintcolor: Colors.black26,
                                            textfeildcontroller:
                                                phonecontroller,
                                            height: size.height*0.053,
                                            width: size.width * 0.18,
                                            filled: true,
                                            fillcolor: greyWhite
                                            // fillcolor: greyWhite,
                                            ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                CustomText(
                                  words: "Distribution Name:",
                                  fontsize: 15,
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                CustomTextfield3(
                                    max: 1,
                                    hinttext: 'distribution name',
                                    textfeildcontroller:
                                        distributioncontroller,
                                            height: size.height*0.053,
                                    width: size.width * 0.381,
                                    filled: true,
                                            hintcolor: Colors.black26,
                                    fillcolor: greyWhite),
                                SizedBox(
                                  height: 20,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            words: "Email:",
                                            fontsize: 15,
                                            fontweight: FontWeight.bold),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        CustomTextfield3(
                                            // controller: namecontroller,
                                            hinttext: 'email',
                                            max: 1,
                                            textfeildcontroller:
                                                emailController,
                                            height: size.height*0.053,
                                            width: size.width * 0.18,
                                            filled: true,
                                            hintcolor: Colors.black26,
                                            fillcolor: greyWhite
                                            // height: height*0.1,
                                            // fillcolor: Colors.black
                                            ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.021,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            words: "License No#",
                                            fontsize: 15,
                                            fontweight: FontWeight.bold),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        CustomTextfield3(
                                            max: 1,
                                            hinttext: 'license no',
                                            textfeildcontroller:
                                                licenseNoController,
                                            height: size.height*0.053,
                                            width: size.width * 0.18,
                                            hintcolor: Colors.black26,
                                            filled: true,
                                            fillcolor: greyWhite
                                            // fillcolor: greyWhite,
                                            ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            words: "Password:",
                                            fontsize: 15,
                                            fontweight: FontWeight.bold),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        CustomTextfield3(
                                            max: 1,
                                            hinttext: 'password',
                                            textfeildcontroller:
                                                passwordController,
                                            height: size.height*0.053,
                                            width: size.width * 0.18,
                                            hintcolor: Colors.black26,
                                            filled: true,
                                            isObscure: isVisible,
                                            fillcolor: greyWhite,
                                            icon: IconButton(
                                              onPressed: () {
                                                addToggle();
                                              },
                                              icon: Icon(!isVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: size.width * 0.021,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            words: "Confirm Password:",
                                            fontsize: 15,
                                            fontweight: FontWeight.bold),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        CustomTextfield3(
                                            max: 1,
                                            hinttext: 'confirm password',
                                            textfeildcontroller:
                                                confirmPasswordController,
                                            height: size.height*0.053,
                                            width: size.width * 0.18,
                                            hintcolor: Colors.black26,
                                            filled: true,
                                            isObscure: isVisible,
                                            fillcolor: greyWhite,
                                            icon: IconButton(
                                                onPressed: () {
                                                  addToggle1();
                                                },
                                                icon: Icon(!isVisible1
                                                    ? Icons.visibility
                                                    : Icons.visibility_off))),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      words: "Address:",
                                      fontsize: 15,
                                      fontweight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    CustomTextfield3(
                                        max: 3,
                                        hinttext: 'address',
                                        textfeildcontroller:
                                            addresscontroller,
                                            height: size.height*0.053,
                                        width: size.width * 0.381,
                                            hintcolor: Colors.black26,
                                        filled: true,
                                        fillcolor: greyWhite),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
 crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        words: "Upload Signatue:",
                                        fontsize: 22),
                                SizedBox(
                                  height: 20,
                                ),
                                
                                  InkWell(
                                    onTap: () {
                                      uploadImage();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          color: Color(0xffEBEBEB),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: CustomText(
                                            words: 'click to upload image',
                                            fontsize: 16),
                                      ),
                                    ),
                                  ),
                                
                                  ],
                                ),
                              
                                  SizedBox(
                                    width: 20,
                                  ),

                                   webImage != null
                                      ?
                                       
                                      Container(
                                          height: 70,
                                            // color: redColor,
                                          child: Image.memory(
                                                  webImage!,
                                                  fit: BoxFit.cover,
                                                )
                                              ,
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  webImage == null
                                      ? 
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: CustomText(
                                            words: "PNG format supported",
                                            fontsize: 18,
                                          ),
                                        )
                                      : Container(),

                               
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: CustomSignUp(
                                    context,
                                    width: size.width * 0.2,
                                    height: size.height * 0.06,
                                    nameController: namecontroller,
                                    phonecontroller: phonecontroller,
                                    distributioncontroller:
                                        distributioncontroller,
                                    emailController: emailController,
                                    passwordController: passwordController,
                                    confirmPasswordController:
                                        confirmPasswordController,
                                    licenseNoController: licenseNoController,
                                    addresscontroller: addresscontroller,
                                    color: jamenColor,
                                    image: webImage,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        words: "Already have an account?",
                                        color: Colors.black,
                                        fontsize: 18,
                                        fontweight: FontWeight.bold),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) => LogIn(),
                                              ));
                                        },
                                        child: CustomText(
                                            words: "Sign In", fontsize: 20))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: size.width,
                  height: size.height,
                  color: jamenColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 95, bottom: 60),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        height: size.height,
                        width: size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 20, right: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: size.width * 0.1,
                                        height: size.height * 0.1,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/devs.jpg"))),
                                      ),
                                      CustomText(
                                          words: 'Devs Inn Technologies',
                                          fontsize: 30,
                                          fontweight: FontWeight.bold),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                          words: "Sign Up",
                                          color:primaryColor,
                                          fontsize: 40,
                                          fontweight: FontWeight.bold),
                                      Container(
                                        width: size.width * 0.3,
                                        height: size.height * 0.4,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/amico.jpg"))),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomText(
                                    words: "Name",
                                    fontsize: 17,
                                    fontweight: FontWeight.bold),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield3(

                                    // controller: namecontroller,
                                    hinttext: 'name',
                                    textfeildcontroller: firstNameController,
                                    width: size.width * 0.84,
                                    filled: true,
                                    fillcolor: greyWhite,
                                            hintcolor: Colors.black26,

                                    // height: height*0.1,

                                    // fillcolor: Colors.black

                                    ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                    words: "Phone Number",
                                    fontsize: 17,
                                    fontweight: FontWeight.bold),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield3(
                                            hintcolor: Colors.black26,
                                    hinttext: 'phone number',
                                    textfeildcontroller: lastNameController,
                                    width: size.width * 0.84,
                                    filled: true,
                                    fillcolor: greyWhite

                                    // fillcolor: greyWhite,

                                    ),
                                CustomText(
                                  words: "Distribution Name:",
                                  fontsize: 17,
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomTextfield3(
                                    max: 3,
                                            hintcolor: Colors.black26,
                                    hinttext: 'distribution name',
                                    textfeildcontroller: distributioncontroller,
                                    width: size.width * 0.84,
                                    filled: true,
                                    fillcolor: greyWhite),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  words: "E-mail",
                                  fontsize: 17,
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield3(
                                    max: 1,
                                    hinttext: 'email',
                                            hintcolor: Colors.black26,
                                    textfeildcontroller: emailController,
                                    width: size.width * 0.84,
                                    filled: true,
                                    fillcolor: greyWhite),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  words: "Password",
                                  fontsize: 17,
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield3(
                                    hinttext: 'password',
                                    max: 1,
                                    textfeildcontroller: passwordController,
                                    width: size.width * 0.84,
                                            hintcolor: Colors.black26,
                                    filled: true,
                                    isObscure: isVisible,
                                    fillcolor: greyWhite,
                                    icon: IconButton(
                                        onPressed: () {
                                          addToggle();
                                        },
                                        icon: Icon(!isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off))),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  words: "Confirm Password",
                                  fontsize: 17,
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield3(
                                    hinttext: 'confirm password',
                                    max: 1,
                                    textfeildcontroller:
                                        confirmPasswordController,
                                    width: size.width * 0.84,
                                            hintcolor: Colors.black26,
                                    filled: true,
                                    isObscure: isVisible,
                                    fillcolor: greyWhite,
                                    icon: Icon(!isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  words: "License No:",
                                  fontsize: 17,
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                CustomTextfield3(
                                    hinttext: 'license no',
                                            hintcolor: Colors.black26,
                                    max: 1,
                                    textfeildcontroller: licenseNoController,
                                    width: size.width * 0.84,
                                    filled: true,
                                    fillcolor: greyWhite),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomText(
                                  words: "Address",
                                  fontsize: 17,
                                  fontweight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                CustomTextfield3(
                                    hinttext: 'address',
                                            hintcolor: Colors.black26,
                                            // top: 20.0,
                                    max: 3,
                                    minline: 1,
                                    textfeildcontroller: emailController,
                                    width: size.width * 0.84,
                                    filled: true,
                                    fillcolor: greyWhite),
                                Column(
                                  children: [
                                    SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(
                                      words: "Upload Signatue:", fontsize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 50,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: greyColor,
                                    ),
                                    child: Center(
                                        child: CustomText(
                                            words: "click to upload image",
                                            fontsize: 15)),
                                  ),
                                ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CustomText(
                                    words: "PNG format supported",
                                    fontsize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: CustomSignUp(context,
                                      width: size.width * 0.6,
                                      height: size.height * 0.05,
                                      nameController: namecontroller,
                                      phonecontroller: phonecontroller,
                                      distributioncontroller:
                                          distributioncontroller,
                                      emailController: emailController,
                                      passwordController: passwordController,
                                      confirmPasswordController:
                                          confirmPasswordController,
                                      licenseNoController: licenseNoController,
                                      addresscontroller: addresscontroller,
                                      color: jamenColor,
                                      image: webImage
                                      ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      CustomText(
                                          words: "Already have an account?",
                                          color: Colors.black,
                                          fontsize: 20,
                                          fontweight: FontWeight.bold),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder: (context) => LogIn(),
                                                ));
                                          },
                                          child: CustomText(
                                              words: "Sign In", fontsize: 20))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          size.width > 1180 ? SignUpContainer(size: size) : Container()
        ],
      ),
    );
  }
}
