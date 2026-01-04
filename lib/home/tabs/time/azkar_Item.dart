import 'package:flutter/cupertino.dart';
import 'package:islami_app2/utils/AppColors.dart';
import 'package:islami_app2/utils/AppStyles.dart';

class AzkarItem extends StatelessWidget {

  String imagePath;
  String text;

  AzkarItem({required this.imagePath,required this.text});
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.blackBgColor,
        border: Border.all(
          color: AppColors.primaryDark,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imagePath),
            SizedBox(height: height*0.01,),
            Text(text,style: AppStyles.bold20white,)
          ],
        ),
      ),
    );
  }
}
