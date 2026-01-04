import 'package:flutter/cupertino.dart';
import 'package:islami_app2/utils/AppStyles.dart';

import '../../../utils/AppColors.dart';

class SuraContentItem extends StatelessWidget {
String content;
int index;
SuraContentItem({required this.content,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.symmetric(horizontal: 22,vertical: 4) ,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryDark,
          width: 2,
        )
      ),
      child: Text( "$content[${index+1}]",
        textAlign :TextAlign.center,
        textDirection: TextDirection.rtl
        ,style: AppStyles.bold16white,),
    );
  }
}
