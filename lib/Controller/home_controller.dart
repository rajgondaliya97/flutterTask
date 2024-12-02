import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:projectdemo/Model/dropdown_model.dart';
import 'package:projectdemo/Model/home_model.dart';

class HomeController with ChangeNotifier {
  int? ack;
  String? ackMsg;
  List<Result>? result = [];

  int? ackDrop;
  String? ackMsgDrop;
  List<DropdownModelResult>? resultDrop;


  bool checkData = false;

  fetchData() async {
    try {
      String url =
          "http://192.168.1.232/solarbox/service/service_sr_project_signup.php?key=1226&s=131&application_login_id=10&status=";
      final response = await http.get(
        Uri.parse(url),
      );

      print("State Code >>> ${response.statusCode}");
      if (response.statusCode == 200) {
        print("Data Fetch Success fully..........");
        HomeModel homeModel = HomeModel.fromJson(jsonDecode(response.body));
        print("Body >>>> $homeModel");
        ack = homeModel.ack;
        ackMsg = homeModel.ackMsg;
        result = homeModel.result;
        notifyListeners();
      } else {
        checkData = true;
        notifyListeners();
        print("Something Won't to wrong........");
      }
    } catch (e) {
      checkData = true;
      notifyListeners();
      print("Exception >>> $e");
    }
  }
  fetchDropdownData() async {
    try {
      String url =
          "http://192.168.1.232/solarbox/service/service_general.php?key=1226&s=42&flag=project";
      final response = await http.get(
        Uri.parse(url),
      );

      print("State Code >>> ${response.statusCode}");
      if (response.statusCode == 200) {
        print("Data Fetch Success fully..........");
        DropdownModel dropdownModel = DropdownModel.fromJson(jsonDecode(response.body));
        print("Body >>>> $dropdownModel");
        ackDrop = dropdownModel.ack;
        ackMsgDrop = dropdownModel.ackMsg;
        resultDrop = dropdownModel.result;
        notifyListeners();
      } else {
        print("Something Won't to wrong........");
      }
    } catch (e) {
      print("Exception >>> $e");
    }
  }

}
