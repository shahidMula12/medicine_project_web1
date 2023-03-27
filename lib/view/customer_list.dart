import 'package:flutter/material.dart';

import 'package:medicine_project/controller/api_manager.dart';
import 'package:medicine_project/model/get_customer.dart';
import 'package:medicine_project/utils/api_handler.dart';
import 'package:medicine_project/utils/controller.dart';
import '/utils/constants.dart';
import '/view/widgets.dart';

import '../utils/break_points.dart';
import '../utils/dialogue_box.dart';
import 'components/drawer_widgets.dart';
import 'components/table_widgets.dart';

class customerListScreen extends StatefulWidget {
  final isOpen, size;
  const customerListScreen({this.isOpen, this.size});

  @override
  State<customerListScreen> createState() => _customerListScreenState();
}

class _customerListScreenState extends State<customerListScreen> {
  //final person = ["Sr.", "Name", "Batch#", "QTY", "C.P", "S.P", "Actions"];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GetCustomerModel? customer;
  // get_Customer?getallcustomer;
  @override
  void initState() {
    super.initState();
    getcustomer();
  }

  getcustomer() async {
    // Loader.show(context);
    // setState(() {
    //   GlobalState.isLoading = true;
    // });
    customer = await getCustomer(context);

    print("${customer} ----------------------------");
    setState(() {});
    // Navigator.pop(context);
    // setState(() {
    //   GlobalState.isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
     width: !widget.isOpen
          ? size.width - 60
          : size.width - (drawerWidth + 60),
      height: size.height * 0.89,
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        maintainBottomViewPadding: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //           FloatingActionButton(onPressed: (){
              // ApiManager.customerList();
              //         }),
              CustomText(
                  words: "Customer List",
                  fontFamily: "interMedium",
                  color: primaryColor,
                  fontsize: 38,
                  fontweight: FontWeight.bold),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: size.width * 0.013),
                  CustomTextField2(context),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: primaryColor,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 21,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Color(0xffE4E4E4),
                thickness: 1,
                height: 2,
              ),
              CustomerListTable(
                size,
                context,
                customer: customer,
                columnspacing: widget.isOpen?65:110
              ),
              SizedBox(height: size.height * 0.02),
              Divider(
                color: Color(0xffE4E4E4),
                thickness: 1,
                height: 2,
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CustomText(
                        words: "31 Total",
                        color: primaryColor,
                        fontsize: 22,
                        fontweight: FontWeight.bold),
                    Spacer(
                      flex: 1,
                    ),
                    CustomText(
                        words: "more...",
                        color: primaryColor,
                        fontsize: 19,
                        fontweight: FontWeight.bold),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
