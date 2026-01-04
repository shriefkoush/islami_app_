import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app2/api_Manager/Api_Manager.dart';
import 'package:islami_app2/model/prayer_Response.dart';
import 'package:islami_app2/utils/AppColors.dart';
import 'package:islami_app2/utils/AppStyles.dart';
import 'package:islami_app2/utils/dateUtils.dart';

import 'azkar_Item.dart';

class Time_Tab extends StatefulWidget {
  @override
  State<Time_Tab> createState() => _Time_TabState();
}

class _Time_TabState extends State<Time_Tab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/QuranTabLogo.png"),
            SizedBox(
              height: height * 0.38,
              width: double.infinity,
              child: FutureBuilder(
                future: ApiManager.getPrayingDate(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: height * 0.1),
                            Text(
                              "something went wrong please, Try Again",
                              style: AppStyles.bold20primaryDark,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryDark,
                              ),
                              onPressed: () {
                                ApiManager.getPrayingDate();
                                setState(() {});
                              },
                              child: Text(
                                "Try Again",
                                style: AppStyles.bold20black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  PrayerResponse data = snapshot.data!;
                  Map<String, dynamic> prayTimes = data.data!.timings!.toJson();
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        image: AssetImage("assets/images/pray_BG.png"),
                        fit: BoxFit.fill,
                      ),
                      color: AppColors.brownColor,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 12,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                DateFormatter.formatGregorian(data.data!.date!.gregorian!),
                                style: AppStyles.bold20white,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Pray Time",
                                    style: AppStyles.bold22brown,
                                  ),
                                  AutoSizeText(
                                    data.data!.date!.gregorian!.weekday!.en!,
                                    style: AppStyles.bold24black,
                                  ),
                                ],
                              ),
                              AutoSizeText(
                                DateFormatter.formatHijri(data.data!.date!.hijri!),
                                style: AppStyles.bold20white,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: height*0.05),
                          child: CarouselSlider.builder(
                            itemCount: prayTimes.length,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                width: width*0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff202020),
                                      Color(0xffB19768),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0,bottom: 4),
                                      child: Text(
                                        prayTimes.keys.elementAt(index),
                                        style: AppStyles.bold20white,
                                      ),
                                    ),
                                    Text(
                                      TimeConverter.to12Hours(prayTimes.values.elementAt(index)),
                                      style: AppStyles.bold30white,textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: height*0.21,
                              enlargeCenterPage: true,
                              viewportFraction: 0.28,
                              enlargeFactor: 0.15,

                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.02),
            Text("Azkar", style: AppStyles.bold20white),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Expanded(
                  child: AzkarItem(
                    imagePath: "assets/images/eveningAzkar.png",
                    text: "Evening Azkar",
                  ),
                ),
                SizedBox(width: width * 0.03),
                Expanded(
                  child: AzkarItem(
                    imagePath: "assets/images/morningAzkar.png",
                    text: "Morning Azkar",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
