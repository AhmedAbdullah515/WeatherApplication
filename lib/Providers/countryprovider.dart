import 'package:flutter/material.dart';
import 'package:flutterprojecttest/Models/countrymodel.dart';
import 'package:flutterprojecttest/Services/countryservice.dart';

class Countryprovider extends ChangeNotifier {
  Countries? datamodel;
  Future<void> getcountries() async {
    datamodel = await Countryservice.fetchcountries();
    notifyListeners();
  }
}
