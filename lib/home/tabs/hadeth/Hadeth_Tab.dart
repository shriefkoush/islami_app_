import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app2/utils/AppStyles.dart';

import '../../../utils/AppColors.dart';
import 'HadethDetailsScree.dart';
import 'HadethModel.dart';

class Hadeth_Tab extends StatefulWidget {
  @override
  State<Hadeth_Tab> createState() => _Hadeth_TabState();
}

class _Hadeth_TabState extends State<Hadeth_Tab> {
  List<HadethModel> hadethList = [];

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    // var width =MediaQuery.of(context).size.width;
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
      const  Image(image: AssetImage("assets/images/QuranTabLogo.png")),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: height*0.66,
            enlargeCenterPage: true,
            viewportFraction: 0.75,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: hadethList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(HadethDetailsScree.routeName,
                  arguments: hadethList[itemIndex]);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryDark,
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/haadeth_bg_image.png",
                      ),
                      fit: BoxFit.fill)),
              child: hadethList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ))
                  : Column(
                      children: [
                        Text(
                          hadethList[itemIndex].title,
                          style: AppStyles.bold24black,
                        ),
                        Expanded(
                            child: Text(
                          hadethList[itemIndex].content.join(""),
                          style: AppStyles.bold16black,
                        ))
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    for (int i = 1; i <= 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assets/files/h$i.txt');
      List<String> hadethLines = hadethContent.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethModel hadethModel = HadethModel(title: title, content: hadethLines);
      hadethList.add(hadethModel);
      setState(() {});
    }
  }
}
