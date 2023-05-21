
import 'dart:ui';

import 'package:flutter/material.dart';

class MyColor{
  static const Color mainBackGround = Color(0xFFDFECDB);
  static const Color buttonBackGround = Color(0xFFBDBDBD);
  static const Color createAccount = Color(0xFF505050);
}

class Validation{
 static  bool isValid(String email){
    var  regex=RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(email);
  }

}