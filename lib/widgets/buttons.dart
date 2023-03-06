// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wspapp/contracts.dart';
import 'package:wspapp/controllers/controllers.dart';
import 'package:wspapp/pages/videoplayer_scren.dart';

class ButtonsWidgetDetails extends StatelessWidget {
  Uri url=Uri.parse(Get.find<Varibales>().videourl!);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 360,
      child: FadeInUp(
        child: Container(
          width: Get.width,
          
          color: Color.fromARGB(255, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: kBoldBlue,
                  maxRadius: Get.width>500? 35: Get.width*0.06,
                  child: IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () async{
                       if(await canLaunchUrl(url)){
                        await launchUrl(url,mode: LaunchMode.externalApplication);
                        
                      }
                    },
                  ),
                ),
                SizedBox(width: 0),
                TextButton(
                    onPressed: (() async{
                      if(await canLaunchUrl(url)){
                        await launchUrl(url,mode: LaunchMode.externalApplication);
                        
                      }
                    }),
                    child: Text(
                      "...بارگیری",
                      style: TextStyle(
                          color: kWhite,
                          fontSize: Get.width > 500 ? 24 : Get.width * 0.05,
                          fontWeight: FontWeight.bold),
                    )),
                    Spacer(),
                // SizedBox(width: Get.width / 1.65),
                CircleAvatar(
                  backgroundColor: kBoldBlue,
                  maxRadius: Get.width>500? 35: Get.width*0.06,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow_rounded),
                    onPressed: () {
                      Get.to(()=>Videoplayer());
                    },
                  ),
                ),
                SizedBox(width: 0),
                TextButton(
                  onPressed: (){
                   Get.to(()=>Videoplayer());
                  },
                  child: Text(
                    "...پخش",
                    style: TextStyle(
                        color: kWhite, fontSize: Get.width > 500 ? 24 : Get.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
