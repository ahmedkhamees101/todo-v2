import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
static const String routeName ='splash';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/splash.png',),fit: BoxFit.cover)
      ),
    );
  }
  
}
