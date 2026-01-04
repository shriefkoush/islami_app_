import 'package:flutter/material.dart';
import 'package:islami_app2/provider/radio_manager_provider.dart';
import 'package:islami_app2/utils/MyThemeData.dart';
import 'package:provider/provider.dart';


import 'home/Home_Screen.dart';
import 'home/tabs/hadeth/HadethDetailsScree.dart';
import 'home/tabs/quran/Sura_Details_Screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => RadioManagerProvider(),
    child: IslamiApp(),
  ));
}

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScree.routeName: (context) => HadethDetailsScree(),
      },
      darkTheme: MyThemeData.darktheme,
    );
  }
}