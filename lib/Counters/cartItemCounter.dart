import 'package:flutter/material.dart';
import 'package:geeky_booky/Config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartItemCounter extends ChangeNotifier {



  int _counter = EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList).length - 1;
  int get count => _counter;

  Future <void> displayResult() async{
  int _counter = EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList).length - 1;

  await Future.delayed(const Duration(milliseconds: 100),(){
    notifyListeners();
  });

  }
}