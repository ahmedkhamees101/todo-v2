import 'package:flutter/cupertino.dart';
import 'package:todo/ui/screens/register/register.dart';

import 'login/login.dart';

class SplashScreen extends StatefulWidget {
static const String routeName ='splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SplashScreen();
  }
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
