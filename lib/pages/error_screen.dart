import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wspapp/contracts.dart';
import 'package:wspapp/controllers/controllers.dart';
import 'package:wspapp/pages/home_screen.dart';

class ErorrScreen extends StatelessWidget {
  const ErorrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white60,
          body: Container(
            width: Get.width,
            height: Get.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/error.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "لطفا اینترنت خود را چک کرده و روی دکمه پایین کلیک نمایید",
                      style: TextStyle(
                          color: Colors.black, fontSize:Get.width>500 ? 24: Get.width * 0.05,),textAlign: TextAlign.center, 
                    ),
                  ),
                  ElevatedButton(

                      onPressed: () {
                        Get.find<ChechIntrentet>().connected();

                        if (Get.find<ChechIntrentet>().isconnect == true) {
                          Get.find<Network>().onInit();
                          Get.to(HomeScreen());
                        } else {
                          Get.defaultDialog(
                              title: "لطفا دوباره امتحان کنید",
                              backgroundColor: kWhite,
                              content: Text(''),
                              confirmTextColor: kWhite,
                              textConfirm: 'باشه',
                              buttonColor: kBlack,
                              onConfirm: () {
                                Navigator.pop(context);
                              });
                        }
                      },
                      child: Text("کلیک کنید",style: TextStyle(fontSize:Get.width>500 ? 18:Get.width * 0.05 ),))
                ],
              ),
            ),
          )),
    );
  }
}
