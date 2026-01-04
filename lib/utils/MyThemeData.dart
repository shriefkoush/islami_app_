import 'package:flutter/material.dart';

import 'AppColors.dart';

class MyThemeData{
 static final ThemeData darktheme =ThemeData(
   scaffoldBackgroundColor: Colors.transparent,
     primaryColor: AppColors.primaryDark,
     appBarTheme: const AppBarTheme(
         backgroundColor: AppColors.blackColor,
     centerTitle: true,
      iconTheme: IconThemeData(
       color: AppColors.primaryDark,),
     ),
     bottomNavigationBarTheme:BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      showSelectedLabels: true,
      unselectedItemColor: AppColors.blackColor,
      showUnselectedLabels: false
 )
 );


}