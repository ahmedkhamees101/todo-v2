import 'package:flutter/cupertino.dart';
import 'package:todo/app_layout/register.dart';

class SplashScreen extends StatelessWidget {
static const String routeName ='splash';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),
      (){
        Navigator.pushReplacementNamed(context, RegisterScreen.routeName) ;
      }
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/splash.png',),fit: BoxFit.cover)
      ),
    );
  }

}
