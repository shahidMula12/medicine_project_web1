import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicine_project/provider/provider_class.dart';
import 'package:medicine_project/view/invoice_section_screen.dart';
import 'package:medicine_project/view/widgets.dart';
import 'package:provider/provider.dart';

import '../utils/break_points.dart';
import '../utils/constants.dart';
import '../utils/screen_names.dart';
import '../utils/url_launcher.dart';

class SideBarMenu extends StatelessWidget {
  final size;
  const SideBarMenu({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderClass>(context, listen: false);
    return Container(
      width: drawerWidth,
      decoration: BoxDecoration(color: Color(0xff24515C)),
      child: Container(
        color: primaryColor,
        width: size.width * 0.15,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            top: 25,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: CustomText(
                      words: "Devs'Inn Business Portal",
                      fontsize: 24,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/images.jpg"),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(
                        words: "Hi Hassan", color: Colors.white, fontsize: 20)
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    provider.changeScreen(DASHBOARD);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.dashboard,
                        size: 18,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Dashboard",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                    title: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Stock",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    children: [
                      InkWell(
                        onTap: () {
                          provider.changeScreen(ADDSTOCK);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(children: [
                            SizedBox(
                              width: 28,
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Add Stock",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ]),
                        ),
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
                            SizedBox(
                              width: 28,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Update Stock",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ListTileTheme(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  horizontalTitleGap: 8,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      provider.changeScreen(CUSTOMER);
                    },
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
                      Icons.people,
                      color: Colors.white,
                      size: 18,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Customer",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    children: [
                      InkWell(
                        onTap: () {
                          provider.changeScreen(ADDCUSTOMER);
                        },
                        child: Row(children: [
                          SizedBox(
                            width: 28,
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Add Customer",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                ListTileTheme(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  horizontalTitleGap: 8,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      provider.changeScreen(INVOICESECTION);
                      print("hi");
                    },
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
                      Icons.article,
                      color: Colors.white,
                      size: 18,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Invoice",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                ListTileTheme(
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  horizontalTitleGap: 8,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                    provider.changeScreen(PAYMENTTABLE);
                    },
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
                    leading: Container(
                        height: 20,
                        width: 17,
                        child: Image.asset("assets/images/payment.png")),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Payment",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                size.height <= 704
                    ? SizedBox(
                        height: size.height * 0.20,
                      )
                    : SizedBox(
                        height: size.height * 0.27,
                      ),
                size.height <= 704
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  launchInBrowser(Uri.parse(
                                      "https://twitter.com/wasifaliwasif44?t=pLOO85n5vlGvygJV5sAAhQ&s=09"));
                                },
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child:
                                        Image.asset("assets/images/twitt.png")),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              InkWell(
                                onTap: () {
                                  launchInBrowser(Uri.parse(
                                      "https://www.facebook.com/wasifaliwasif44?mibextid=ZbWKwL"));
                                },
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                        "assets/images/facbook.png")),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              InkWell(
                                onTap: () {
                                  launchInBrowser(Uri.parse(
                                      "instagram.com/wasif.chaudary/"));
                                },
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    child:
                                        Image.asset("assets/images/insta.png")),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                launchInBrowser(Uri.parse(
                                    "https://twitter.com/wasifaliwasif44?t=pLOO85n5vlGvygJV5sAAhQ&s=09"));
                              },
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  child:
                                      Image.asset("assets/images/twitt.png")),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            InkWell(
                              onTap: () {
                                launchInBrowser(Uri.parse(
                                    "https://www.facebook.com/wasifaliwasif44?mibextid=ZbWKwL"));
                              },
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  child:
                                      Image.asset("assets/images/facbook.png")),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            InkWell(
                              onTap: () {
                                launchInBrowser(
                                    Uri.parse("instagram.com/wasif.chaudary/"));
                              },
                              child: Container(
                                  height: 20,
                                  width: 20,
                                  child:
                                      Image.asset("assets/images/insta.png")),
                            ),
                          ],
                        ),
                      ),
              ]),
        ),
      ),
    );

    ;
  }
}
