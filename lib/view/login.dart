import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicine_project/utils/break_points.dart';
import 'package:medicine_project/utils/checkbox_widgets.dart';
import 'package:medicine_project/utils/constants.dart';
import 'package:medicine_project/utils/controller.dart';
import 'package:medicine_project/utils/url_launcher.dart';
import 'package:medicine_project/view/login.dart';
import 'package:medicine_project/view/sign_up.dart';
import 'package:medicine_project/view/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
bool isAdded = false;

  bool isVisible = false;
  
  addToggle(){
    setState(() {
      isVisible = !isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      body: Row(
        children: [
          signUpBreakPointChecker(size)?
          Container(
            color: Color(0xffE8EBFF),
            height: size.height,
            width: size.width*0.5,
            
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 110,),
                child: Container(
                  height: size.height*0.9,
                  width: size.width*0.46,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40)),color: Colors.white),
                  // color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30,top: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      
                              CustomText(
                        words: "Log In",
                        color: Color(
                  0xff32409A),
                        fontsize: 30,
                        fontweight: FontWeight.bold),  
                          SizedBox(height: 50,),
                           
                          Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               
                            CustomText(
                                words: "Username/Email:",
                                fontsize: 20,
                                fontweight: FontWeight.bold),
                            SizedBox(
                              height: 7,
                            ),
                            CustomTextfield3(
                                  // controller: namecontroller,
                                  hinttext: 'username/email',
                               minline: 1,
                                hintcolor: Colors.black26,
                  
                               max: 1,                                textfeildcontroller: emailController,
                                width: size.width * 0.38,
                                filled: true,
                                fillcolor: greyWhite
                                // height: height*0.1,
                                // fillcolor: Colors.black
                                ),
                            ],
                                                ),
                                              
                                              ],
                            ),
                      SizedBox(height:20,),
                            
                               Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          CustomText(
                              words: "Password:",
                              fontsize: 20,
                              fontweight: FontWeight.bold),
                          SizedBox(
                            height: 7,
                          ),
                          CustomTextfield3(
                             max: 1,
                                hintcolor: Colors.black26,
                  
                             hinttext: 'password',
                              textfeildcontroller: passwordController,
                              width: size.width * 0.38,
                              filled: true,
                              isObscure: isVisible,
                              fillcolor: greyWhite,
                              icon: IconButton(onPressed: (){
                                addToggle();
                              }, icon: Icon( !isVisible ? Icons.visibility : Icons.visibility_off),)
                              
                              ),
                          ],
                        ),
                      ],
                            ),
                            SizedBox(height: 20,),
                           Row(children: [
                             CustomCheckBox(
                              isAdded: isAdded,
                              onPressed: (val){
                                setState(() {
                                  isAdded = val;
                                });
                              },
                            ),
                         SizedBox(width: 10,),
                  
                            CustomText(
                              words: 'Remember me',
                              fontsize: 20,
                  
                            )
                           ],),
                       
                      
                       
                        SizedBox(height: 20,),
                                Center(
                                  child: Customlogin(context, 
                                  width: size.width*0.2,
                                  height: size.height*0.06,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  
                                  color: jamenColor
                                  ),
                                ),
                               SizedBox(height: 50,),
                    
                      Center(
                        child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              words: "Don't have an account?",
                              fontsize: 20,
                              fontweight: FontWeight.bold
                            ),
                            TextButton(onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder:(context) => SignUp(),));
                            }, child: CustomText(
                              words: 'Sign Up',
                              fontsize: 20
                            ))
                          ],
                        ),
                      ),
                            SizedBox(
                              height: 30,
                            ),
                                
                            InkWell(
                              onTap: () {
                                launchInBrowser(Uri.parse(""));
                              },
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                          children: [
                                           InkWell(
                                            onTap: (){
                                              launchInBrowser(Uri.parse(""));
                                            },
                                             child: Container(
                                                                   child: Image.asset(
                                                                 "assets/images/twitter.png",
                                                                 fit: BoxFit.fill,
                                                                 height: 20,
                                                                 )),
                                           ),
                              SizedBox(
                              width: 35,
                              ),
                              InkWell(
                                onTap: () {
                                  launchInBrowser(Uri.parse("uri"));
                                },
                                child: Image.asset(
                                "assets/images/fb.png",
                                fit: BoxFit.contain,
                                height: 20,
                                ),
                              ),
                              SizedBox(
                              width: 35,
                              ),
                              InkWell(
                                onTap: () {
                                  launchInBrowser(Uri.parse(""));
                                },
                                child: Image.asset(
      
                                  "assets/images/gmail.png",
                                  fit: BoxFit.contain,
                                  height: 20,
                                ),
                              )
                                          ],
                              ),
                            ) , 
                           
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ):
            Container(
            width: size.width,
            height: size.height,
            color:jamenColor,
            child: Center(
              child:               Padding(
                padding: const EdgeInsets.only(top: 95,bottom: 60),
                child: Container(
                
decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
),                
                            height: size.height,
                
                            width: size.width*0.9,
                
                            child: Padding(
                
                              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 20),
                
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
                                  width: size.width*0.1,
                                  height: size.height*0.1,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/devs.jpg"))),
                               
                                                           ),
                                                           CustomText(
                                 words: 'Devs Inn Technologies',
                                 fontsize: 30
                               ),
                               SizedBox(height: 10,),
                                 CustomText(
                                                       words: "Log In",
                                                       color: Color(
                               0xff32409A),
                                                       fontsize: 40,
                                                       fontweight: FontWeight.bold),  
                                Container(
                                  width: size.width*0.3,
                                  height: size.height*0.4,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/amico.jpg"))),
                               
                                                           ),
                                  ],
                                 ),
                               ),
                                          
                
                                CustomText(
                
                                    words: "Email",
                
                                    fontsize: 17,
                
                                    fontweight: FontWeight.bold),
                
                                      SizedBox(
                
                                  height: 5,
                
                                ),
                
                                          
                
                                CustomTextfield3(
                
                                    // controller: namecontroller,
                hinttext: 'email',
                hintcolor: Colors.black26,

                                    textfeildcontroller: emailController,
                
                                    width: size.width * 0.84,
                
                                    filled: true,
                
                                    fillcolor: greyWhite
                
                                    // height: height*0.1,
                
                                    // fillcolor: Colors.black
                
                                    ),SizedBox(height: 10,),
                
                                      CustomText(
                
                                    words: "Password",
                
                                    fontsize: 17,
                
                                    fontweight: FontWeight.bold),
                
                                      SizedBox(
                
                                  height: 5,
                
                                ),
                                     CustomTextfield3(
                hinttext: 'password',
                hintcolor: Colors.black26,
                                      max: 1,
                
                                         textfeildcontroller: passwordController,
                
                                         width: size.width * 0.84,
                
                                         filled: true,
                
                                         isObscure: isVisible,
                
                                         fillcolor: greyWhite,
                
                                         icon: IconButton(onPressed: (){
                
                                          addToggle();
                
                                         }, icon: Icon(!isVisible?Icons.visibility:Icons.visibility_off))
                
                                         ),
                
                                         
                  SizedBox(height: 20,),
                           Row(children: [
                             CustomCheckBox(
                              isAdded: isAdded,
                              onPressed: (val){
                                setState(() {
                                  isAdded = val;
                                });
                              },
                            ),
                         SizedBox(width: 10,),

                            CustomText(
                              words: 'Remember me',
                              fontsize: 20,

                            )
                           ],),
                       
                      
     
      SizedBox(height: 20,),
                                Center(
                                  child: Customlogin(context, 
                                  width: size.width*0.6,
                                  height: size.height*0.045,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  
                                  color: jamenColor
                                  ),
                                ),
                               SizedBox(height: 50,),
                      Center(
                        child: Container(
                          height: 1,
                          width: size.width*0.5,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 40,),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              words: 'Dont have an account?',
                              fontsize: 20,
                              fontweight: FontWeight.bold
                            ),
                          ],
                        ),
                      ),
                            SizedBox(
                              height: 30,
                            ),
                                
                            InkWell(
                              onTap: () {
                                launchInBrowser(Uri.parse(""));
                              },
                              child: Center(
                                child: Wrap(
                                            alignment: WrapAlignment.center,
                                            children: [
                                             InkWell(
                                              onTap: (){
                                                launchInBrowser(Uri.parse(""));
                                              },
                                               child: Container(
                                                                     child: Image.asset(
                                                                   "assets/images/twitter.png",
                                                                   fit: BoxFit.contain,
                                                                   height: 20,
                                                                   )),
                                             ),
                                SizedBox(
                                width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    launchInBrowser(Uri.parse("uri"));
                                  },
                                  child: Container(
                                    child: Image.asset(
                                  "assets/images/fb.png",
                                  fit: BoxFit.contain,
                                  height: 20,
                                  )),
                                ),
                                SizedBox(
                                width: 40,
                                ),
                                InkWell(
                                  onTap: () {
                                    launchInBrowser(Uri.parse(""));
                                  },
                                  child: Container(
                                  child: Image.asset(
                                    "assets/images/gmail.png",
                                    fit: BoxFit.contain,
                                    height: 20,
                                  ),
                                  ),
                                )
                                            ],
                                ),
                              ),
                            ) ,
                
                                  
                
                              ],),
                
                              ),
                
                            ),
                
                          ),
                          
              ),
            ),
           
          ),
          size.width>1180?
           LoginContainer(size: size)
          :
        Container()
      
        
        ],
        
      ),
    );
  }

}