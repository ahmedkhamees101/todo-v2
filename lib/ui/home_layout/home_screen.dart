
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/home_providers.dart';
import '../../style/app_colors.dart';
import '../widgets/bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProviders()..changeTabs(),
      builder: (context, child) {
        var prov= Provider.of<HomeProviders>(context);
        return Container(
          decoration: BoxDecoration(
            color: MyColor.mainBackGround,
          ),
          child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: MyColor.blueColor,
              title: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "ToDo List",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),

            body: prov.tabs[prov.index],

            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
              onPressed: () {
                showBottomSheet();
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              notchMargin: 6,
              shape: CircularNotchedRectangle(),
              child: BottomNavigationBar(
                currentIndex: prov.index,
                onTap: (value){
                  prov.index=value;
                },
                iconSize: 30,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
                ],
              ),
            ),
          ),
        );
      },

    );
  }

  showBottomSheet(){
    showModalBottomSheet(
    isScrollControlled: true,
    context: context, builder:(context){
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
          child: ShowModalBottomSheet());
    },
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft:Radius.circular(30))
    ),);
  }
}
