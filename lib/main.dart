import 'package:flutter/material.dart';
import 'package:todo/style/app_theme.dart';
import 'package:todo/ui/register.dart';
import 'package:todo/ui/splash.dart';

void main() => runApp( MyApp());



class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
           initialRoute: SplashScreen.routeName,
            routes: {
             SplashScreen.routeName:(_)=>SplashScreen(),
              RegisterScreen.routeName:(_)=>RegisterScreen(),

            },
      theme: MyTheme.lightTheme,
    );
  }
}

