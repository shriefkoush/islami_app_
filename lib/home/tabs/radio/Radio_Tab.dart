import 'package:flutter/material.dart';
import 'package:islami_app2/home/tabs/radio/widgets/radio_Item.dart';
import 'package:islami_app2/model/RadioResponse.dart';
import 'package:islami_app2/model/RecitersResponse.dart';
import 'package:islami_app2/utils/AppStyles.dart';

import '../../../api_Manager/Api_Manager.dart';
import '../../../utils/AppColors.dart';

class Radio_Tab extends StatefulWidget {
  @override
  State<Radio_Tab> createState() => _Radio_TabState();
}

class _Radio_TabState extends State<Radio_Tab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/QuranTabLogo.png"),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xb3202020),
            ),
            child: TabBar(
              automaticIndicatorColorAdjustment: true,
              padding: EdgeInsets.symmetric(horizontal: 10),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: AppStyles.bold16black,
              unselectedLabelStyle: AppStyles.bold16white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryDark,
              ),
              dividerHeight: 0,
              tabs: [Tab(child: Text("Radio")), Tab(child: Text("Reciters"))],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                FutureBuilder<RadioResponse>(
                  future: ApiManager.getRadioResponse(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      );
                    } else if (snapShot.hasError) {
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
                                  ApiManager.getRadioResponse();
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
                    } else {
                      RadioResponse data = snapShot.data!;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return RadioItem(
                            name: data.radios![index].name ?? "",
                            url: data.radios![index].url ?? "",
                          );
                        },
                        itemCount: data.radios!.length,
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: ApiManager.getRecitersResponse(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryDark,
                        ),
                      );
                    } else if (snapShot.hasError) {
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
                                  ApiManager.getRadioResponse();
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
                    RecitersResponse data = snapShot.data!;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return RadioItem(
                          name: data.reciters![index].name ?? "",
                          url:
                              "${data.reciters![index].moshaf![0].server}112.mp3",
                        );
                      },
                      itemCount: data.reciters!.length,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
