import 'package:flutter/material.dart';
import 'package:todo/splash.dart';

void main() => runApp( MyApp());



class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
           initialRoute: SplashScreen.routeName,
            routes: {
             SplashScreen.routeName:(_)=>SplashScreen(),

            },
    );
  }
}

