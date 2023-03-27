

import 'package:medicine_project/controller/global_state.dart';
import 'package:medicine_project/controller/preferences.dart';
import 'package:medicine_project/model/login_modal.dart';

loginChecker()async{
  var data = await SavedPreferences.getLoginDetails();
  print("$data 99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999");
  if(data != null){
    GlobalState.loginDetail = LoginModel.fromJson(data);
  }
}