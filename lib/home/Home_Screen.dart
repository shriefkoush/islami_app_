
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app2/home/tabs/hadeth/Hadeth_Tab.dart';
import 'package:islami_app2/home/tabs/quran/Quran_Tab.dart';
import 'package:islami_app2/home/tabs/radio/Radio_Tab.dart';
import 'package:islami_app2/home/tabs/sebha/Sebha_Tab.dart';
import 'package:islami_app2/home/tabs/time/Time_Tab.dart';

import '../utils/AppColors.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  List<String> backgroundImages=[
        "assets/images/quran_bg.png",
        "assets/images/hadeth_bg.png",
        "assets/images/sebha_bg.png",
        "assets/images/radio_bg.png",
        "assets/images/time_bg.png"
  ];

  List<Widget> Tabs =[
    Quran_Tab(),
    Hadeth_Tab(),
    Sebha_Tab(),
    Radio_Tab(),
    Time_Tab()];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(backgroundImages[selectIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primaryDark,
            currentIndex: selectIndex,
            onTap: (index) {
              selectIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 0, imageName: "icon_quran"),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 1, imageName: "icon_hadeth"),
                  label: "Hadeth"),
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 2, imageName: "icon_sebha"),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 3, imageName: "icon_radio"),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: builtItemInBottomNavBar(index: 4, imageName: "icon_time"),
                  label: "Time"),

            ],
          ),
          body: Tabs[selectIndex],
        )
      ],
    );
  }
  Widget builtItemInBottomNavBar ({required int index,required String imageName}){
    return selectIndex== index ?
    Container(
      padding:
      EdgeInsets.symmetric(vertical: 6, horizontal: 19),
      decoration: BoxDecoration(
        color: AppColors.blackBgColor,
        borderRadius: BorderRadius.circular(66),
      ),
      child: ImageIcon(
        AssetImage("assets/images/$imageName.png"),
      ),
    )
        :
    ImageIcon(
        AssetImage("assets/images/$imageName.png"),);
  }
}
