import 'package:flutter/material.dart';

import '../style/constants.dart';

class HomeScreen extends StatelessWidget {
 static const routeName="home";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: const BoxDecoration(
            color: MyColor.mainBackGround,

        ),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF5D9CEC),
                title: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("To Do List",style: Theme.of(context).textTheme.bodyLarge,),
                ),
              ),
            ),
        ),

      ],
    );



  }
}
