import 'package:flutter/cupertino.dart';
import 'package:todo/ui/register.dart';

import 'login.dart';

class SplashScreen extends StatelessWidget {
static const String routeName ='splash';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),
      (){
        Navigator.pushReplacementNamed(context, LoginScreen.routeName) ;
      }
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/splash.png',),fit: BoxFit.cover)
      ),
    );
  }

}
