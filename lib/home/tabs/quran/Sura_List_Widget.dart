import 'package:flutter/cupertino.dart';
import 'package:islami_app2/utils/AppStyles.dart';

import '../../../model/Sura_Model.dart';
import '../../../utils/AppColors.dart';


class SuraListWidget extends StatelessWidget {
  Sura_Model sura_model;
  SuraListWidget({required this.sura_model
  });
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(alignment: Alignment.center,
      children: [
        Image.asset("assets/images/VectorNumber.png"),
        Text("${sura_model.index}"
          ,style: AppStyles.bold16white,),
      ],),
      SizedBox(width: 15,),
      Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text(sura_model.SuraEnglishName,
                style: AppStyles.bold16white,),
              Text("${sura_model.NumOfVerses} verse",
                style: AppStyles.bold16white,)
            ],),
            Text(sura_model.SuraArabicName,
              style: AppStyles.bold16white,)
          ],
        ),
      ),
      
    ],
    );
  }
}
