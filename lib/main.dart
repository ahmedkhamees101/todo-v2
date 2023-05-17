import 'package:flutter/material.dart';
import 'package:todo/app_layout/register.dart';
import 'package:todo/app_layout/splash.dart';
import 'package:todo/style/app_theme.dart';

void main() => runApp( MyApp());



class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
           initialRoute: SplashScreen.routeName,
            routes: {
             SplashScreen.routeName:(_)=>SplashScreen(),
              RegisterScreen.routeName:(_)=>RegisterScreen(),

            },
      theme: MyTheme.lightTheme,
    );
  }
}

