import 'package:flutter/widgets.dart';
import '../ui/screens/settings.dart';
import '../ui/screens/tasks.dart';





class HomeProviders extends ChangeNotifier{
  int index= 0;
  List<Widget> tabs=[Tasks(),Settings()];
  @override
  notifyListeners();




}