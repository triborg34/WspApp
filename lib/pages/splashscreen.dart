import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wspapp/contracts.dart';
import 'package:wspapp/controllers/controllers.dart';
import 'package:wspapp/pages/error_screen.dart';
import 'package:wspapp/pages/home_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(() => EasySplashScreen(
            logo: Image.asset('assets/images/logo.png', fit: BoxFit.fill,),
            loadingText: Text("...درحال بارگزاری",style: TextStyle(color: kWhite,fontSize: Get.width > 500 ? 25 : Get.width * 0.06,fontWeight: FontWeight.bold),),
            logoWidth:150 ,
            showLoader: true,
            
            
            
            backgroundColor: Colors.black,
            navigator: Get.find<ChechIntrentet>().isconnect.value
                ? HomeScreen()
                : ErorrScreen(),
            durationInSeconds: 5,
            loaderColor: kLightPurple,
          )),
    ));
  }
}
