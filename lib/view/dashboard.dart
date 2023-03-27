import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine_project/controller/global_state.dart';
import 'package:medicine_project/controller/preferences.dart';
import 'package:medicine_project/provider/provider_class.dart';
import 'package:medicine_project/utils/url_launcher.dart';
import 'package:medicine_project/utils/controller.dart';
import 'package:medicine_project/view/login.dart';
import 'package:medicine_project/view/side_bar_menu.dart';
import 'package:medicine_project/view/sign_up.dart';
import 'package:medicine_project/view/stock_table.dart';
import 'package:medicine_project/view/update_stock.dart';
import 'package:provider/provider.dart';
import '../utils/login_checker.dart';
import '/utils/constants.dart';
import '/view/widgets.dart';
import '../utils/break_points.dart';
import 'Add_Stock.dart';
import 'add_customer.dart';
import 'components/drawer_widgets.dart';
import 'components/table_widgets.dart';
import 'customer_list.dart';
import 'fragments.dart';


class DashBoard extends StatefulWidget {

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

   @override
  void initState() {
    super.initState();
   checkLogin();
 
  }

  checkLogin()async{
    await loginChecker();
  if(GlobalState.loginDetail == null){
    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=> LogIn() ) , (route) => false);
  }
  }
  //final person = ["Sr.", "Name", "Batch#", "QTY", "C.P", "S.P", "Actions"];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   setState(() {
      //     GlobalState.selectedFragment = "dashbaord";
      //   });
      // }),
      backgroundColor: primaryColor,
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: CustomDashboard(size: size),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // drawerSwitchChecker(size)

          !isOpen
              ? Container()
              : SideBarMenu(
                  size: size,
                ), ////
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width - drawerWidth - 60,
                  height: 60,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: (() {
                                // _scaffoldKey.currentState!.openDrawer();
                                if (isOpen) {
                                  isOpen = false;
                                } else {
                                  isOpen = true;
                                }
                                setState(() {});
                              }),
                              icon: Icon(
                                Icons.menu,
                                color: primaryColor,
                                size: 30,
                              ),
                            ),
                            Spacer(),
                            // drawerSwitchChecker(size)
                            //     ? DrawerButton(scaffoldKey: _scaffoldKey)
                            //     : Container(),
                            size.width < 790
                                ? Icon(Icons.search)
                                : CustomTextField(context),
                                Spacer(),
                            InkWell(
                              onTap: () async{
                                GlobalState.loginDetail = null;
                                var user =  await SavedPreferences.clearUser();
                                if(user == "done"){
                                Navigator.pushAndRemoveUntil(context,  CupertinoPageRoute(builder: (_)=> LogIn() ) , (route) => false);

                                }
                              },
                            
                              child: const CircleAvatar(
                                backgroundColor: primaryColor,
                                child: const Icon(Icons.logout, color: Colors.white,),
                                radius: 22,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                Consumer<ProviderClass>(builder: (context, provider, child) {
                  return selectedFragment(
                      isOpen: isOpen,
                      size: size,
                      screen: provider.selectedScreen);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

