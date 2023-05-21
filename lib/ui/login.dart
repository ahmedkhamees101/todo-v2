import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/constants.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: MyColor.mainBackGround,
          image: DecorationImage(
              image: AssetImage('assets/images/main_bg.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Login",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
          ),
        ));
  }
}
