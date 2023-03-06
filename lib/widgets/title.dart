import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wspapp/contracts.dart';
import 'package:wspapp/controllers/controllers.dart';



class TitleTextDetails extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 190,
      left: 10,
      child: FadeInDown(
        delay: Duration(milliseconds: 400),
        child: Container(
          width: Get.width / 1.2,
          height: Get.height / 9,
          child: Text(
            "${Get.find<Varibales>().title}\n ${Get.find<Varibales>().date}",
            softWrap: true,
            style: TextStyle(
                fontSize: Get.width > 500 ? 25 : Get.width * 0.05, color: kWhite, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
