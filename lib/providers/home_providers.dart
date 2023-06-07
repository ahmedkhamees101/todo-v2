import 'package:flutter/widgets.dart';
import '../ui/screens/settings.dart';
import '../ui/screens/tasks.dart';





class HomeProviders extends ChangeNotifier{
  int currentIndex= 0;
  int get currentIndexTabs{
    return currentIndex;
  }
  changeTabs( int index ){
      currentIndex =index;
    notifyListeners();

  }




}