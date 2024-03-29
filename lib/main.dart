import 'package:flutter/material.dart';
import 'package:todo/style/app_theme.dart';
import 'package:todo/ui/home_layout/home_screen.dart';
import 'package:todo/ui/screens/edit_screen/edit_screen.dart';
import 'package:todo/ui/screens/login/login.dart';
import 'package:todo/ui/screens/register/register.dart';
import 'package:todo/ui/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        EditScreen.routeName:(_)=>EditScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
