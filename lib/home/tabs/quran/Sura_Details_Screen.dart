import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app2/utils/AppStyles.dart';

import '../../../model/Sura_Model.dart';
import '../../../utils/AppColors.dart';


class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";


  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  String contentSura="";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Sura_Model;
    if (contentSura.isEmpty) {
      loadSuraFile(args.index.toString());
    }
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 55),
          child: Center(
              child: Text(
            args.SuraEnglishName,
            style: AppStyles.bold20primaryDark,
          )),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.blackColor,
            child: Image.asset(
              "assets/images/details_bg.png",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 17,
              ),
              Text(
                args.SuraArabicName,
                style: AppStyles.bold24primaryDark,
              ),
              Expanded(
                child: contentSura.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      )
                    : 
                Padding(
                  padding:  EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Text(contentSura,style: AppStyles.bold20primaryDark,
                    textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString("assets/files/${fileName}.txt");
    List<String> suraLines = suraContent.split('\n');
    for(int i=0 ;i<suraLines.length;i++){
      suraLines[i] += "[${i+1}]";
    }
    contentSura =suraLines.join();
    //verses = suraLines;
    setState(() {});
  }
}
