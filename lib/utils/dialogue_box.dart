import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '/utils/constants.dart';

import '../view/widgets.dart';

showAlertDialog(BuildContext context, {onTap}) {
  
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(),
    title: Container(
      height: 250,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 25,
                  backgroundColor: primaryColor,
                  child: Icon(
                    Icons.priority_high,
                    color: Colors.white,
                    size: 30,
                  )),
              SizedBox(
                height: 18,
              ),
              CustomText(
                  words: "Are you sure!", color: primaryColor, fontsize: 25, fontweight: FontWeight.bold),
              SizedBox(
                height: 18,
              ),
              Container(
                width: 300,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "You want to delete this record?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 30,
                    width: 78,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xff729299))),
                    child: Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: CustomText(
                              words: "Cancel",
                              fontsize: 15,
                              color: primaryColor)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                      onPressed: onTap,
                      child: Container(
                        height: 30,
                        width: 78,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor),
                        child: Center(
                          child: CustomText(
                              words: "Delete", fontsize: 15, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
   
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

validationAlert(BuildContext context, {title, isShow = true}) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    title: Row(
      children: [
        CircleAvatar(
            backgroundColor: primaryColor,
            child: Icon(
              Icons.priority_high,
              color: Colors.white,
            )),
        SizedBox(
          width: 10,
        ),
        Text(
          "${!isShow ? '' : 'Please Enter'} $title",
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(bottom: 17, right: 18),
        child: MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            
            child: Container(
              height: 30,
              width: 74,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: primaryColor),
              child: Center(
                child:
                    CustomText(words: "OK", fontsize: 18, color: Colors.white),
              ),
            )),
      )
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
