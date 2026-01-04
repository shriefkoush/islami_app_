import 'package:flutter/material.dart';
import 'package:islami_app2/provider/radio_manager_provider.dart';
import 'package:islami_app2/utils/AppColors.dart';
import 'package:islami_app2/utils/AppStyles.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  String name ;
  String url ;
   RadioItem({super.key,required this.name,required this.url});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {

  bool isVolumeUp = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<RadioManagerProvider>(
      builder: (context ,RadioManagerProvider provider ,child ){
        return  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.15,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
               !provider.isPlaying
                    ?  Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset("assets/images/radioItemBG.png"),
                )
                    : Positioned(
                  left: -25,
                  right: -25,
                  bottom: -35,
                  child: Image.asset("assets/images/radioItemBG2.png"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.name, style: AppStyles.bold20black),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // IconButton(
                        //   onPressed: () {
                        //     isFavorite = !isFavorite;
                        //     setState(() {
                        //
                        //     });
                        //   },
                        //   icon:
                        //       isFavorite ?
                        //       const Icon(
                        //             Icons.favorite,
                        //             size: 40,
                        //             color: AppColors.blackColor,
                        //           )
                        //           :const Icon(
                        //             Icons.favorite_border,
                        //             size: 40,
                        //             color: AppColors.blackColor,
                        //           ),
                        // ),
                        // SizedBox(width: width * 0.01),
                        IconButton(
                          onPressed: () {
                            provider.play(widget.url);
                          },
                          icon:
                          (provider.currentUrl == widget.url && provider.isPlaying)?
                          const Icon(
                            Icons.pause,
                            size: 40,
                            color: AppColors.blackColor,
                          ):
                          const Icon(
                            Icons.play_arrow,
                            size: 40,
                            color: AppColors.blackColor,
                          )
                          ,
                        ),
                        SizedBox(width: width * 0.01),
                        IconButton(
                            onPressed: () {
                              if(provider.currentUrl == widget.url){
                                provider.stop();
                              }
                            },
                            icon:
                            const Icon(
                              Icons.stop,
                              size: 40,
                              color: AppColors.blackColor,
                            )
                        ),
                        SizedBox(width: width * 0.01),
                        IconButton(
                          onPressed: () {
                            isVolumeUp = !isVolumeUp;
                            provider.setVolume(isVolumeUp ? 2.0 : 0.0);
                            setState(() {
                            });
                          },
                          icon:
                          isVolumeUp
                              ?const Icon(
                            Icons.volume_up_rounded,
                            size: 35,
                            color: AppColors.blackColor,
                          )
                              :const Icon(
                            Icons.volume_off,
                            size: 35,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
