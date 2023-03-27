import 'package:flutter/material.dart';
import 'package:medicine_project/provider/provider_class.dart';
import 'package:medicine_project/utils/constants.dart';
import 'package:medicine_project/utils/pdf_function.dart';
import 'package:medicine_project/view/dashboard.dart';
import 'package:medicine_project/view/login.dart';
import 'package:medicine_project/view/pdf_invoice.dart';
import 'package:medicine_project/view/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderClass(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: "Roboto",
            colorScheme:
                ColorScheme.fromSwatch().copyWith(primary: primaryColor)),
        // home: DashBoard(),
        home: SignUp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
