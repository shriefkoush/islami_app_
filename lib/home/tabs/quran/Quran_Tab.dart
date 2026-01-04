import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/Sura_Model.dart';
import '../../../utils/AppColors.dart';
import '../../../utils/AppStyles.dart';
import 'Sura_Details_Screen.dart';
import 'Sura_List_Widget.dart';

class Quran_Tab extends StatefulWidget {
  @override
  State<Quran_Tab> createState() => _Quran_TabState();
}

class _Quran_TabState extends State<Quran_Tab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      Sura_Model.SuraList.add(Sura_Model(
          SuraArabicName: Sura_Model.SuraArabicNameList[i],
          SuraEnglishName: Sura_Model.SuraEnglishNameList[i],
          NumOfVerses: Sura_Model.NumberOfVersesList[i],
          index: i+1));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
    loadLastSura();
  }

  List<Sura_Model> filterList = Sura_Model.SuraList;
  String searchText = "";
  Map<String, String> lastSura = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/QuranTabLogo.png"),
          TextField(
            style: TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: AppColors.primaryDark, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: AppColors.primaryDark, width: 2)),
                prefixIcon: const ImageIcon(
                  AssetImage("assets/images/SearchImage.png"),
                  color: AppColors.primaryDark,
                ),
                hintText: "Sura Name",
                hintStyle:  AppStyles.bold16white),
            onChanged: (text) {
              searchText = text;
              filterList = Sura_Model.SuraList.where((sura) {
                return sura.SuraArabicName.contains(searchText) ||
                    sura.SuraEnglishName.toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          searchText.isNotEmpty ? SizedBox() : builtMostRecently(),
          const SizedBox(
            height: 10,
          ),
           Text(
            "Sura list",
            style: AppStyles.bold20white,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.whiteColor,
                  indent: 30,
                  endIndent: 30,
                  thickness: 2,
                );
              },
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      savedLastSura(
                          suraEnName: filterList[index].SuraEnglishName,
                          suraArName: filterList[index].SuraArabicName,
                          numOfVerses: filterList[index].NumOfVerses);
                      Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: filterList[index]);
                    },
                    child: SuraListWidget(
                    //    index: index,
                        sura_model: filterList[index]));
              },
              itemCount: filterList.length,
              padding: EdgeInsets.zero,
            ),
          )
        ],
      ),
    );
  }

  Widget builtMostRecently() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Last Recently",
            style: AppStyles.bold20white),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lastSura['suraEnName'] ?? "",style: AppStyles.bold20black,),
                  Text(lastSura['suraArName'] ?? "",style: AppStyles.bold20black),
               //   Text('${lastSura['NumOfVerses'] ?? ""} verses',style: AppStyles.bold16black)
                ],
              ),
              Image(image: AssetImage("assets/images/MostRecentlyImage.png"))
            ],
          ),
        ),
      ],
    );
  }

  Future<void> savedLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);
    await loadLastSura();
  }

  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString("suraEnName") ?? "";
    String suraArName = prefs.getString("suraArName") ?? "";
    String numOfVerses = prefs.getString("numOfVerses") ?? "";
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numOfVerses': suraEnName,
    };
  }

  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }
}
