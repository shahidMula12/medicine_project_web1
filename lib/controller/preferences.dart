


import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SavedPreferences{

  static saveLoginDetails(data)async{
    var pref = await SharedPreferences.getInstance();
    pref.setString("loginDetail", jsonEncode(data));
  }

  static getLoginDetails()async{
    var finalData;
    var pref = await SharedPreferences.getInstance();
    var data = pref.getString("loginDetail");
    if (data != null) {
      finalData = jsonDecode(data);
    }
    return finalData;
  }


  
  static clearUser()async{
    var pref = await SharedPreferences.getInstance();
    pref.remove("loginDetail");
    return "done";
  }
}