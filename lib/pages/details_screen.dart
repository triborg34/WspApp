import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wspapp/contracts.dart';
import 'package:wspapp/widgets/buttons.dart';
import 'package:wspapp/widgets/fade.dart';
import 'package:wspapp/widgets/image.dart';
import 'package:wspapp/widgets/title.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(children: [
              ImageWidgetDetails(),
              FadeWidgetDetails(),
              TitleTextDetails(),
              ButtonsWidgetDetails(),
            ]),
            Container(
              padding: EdgeInsets.only(left: 30,right:30,bottom: 20),
              width: Get.width,
              height: 100,
              child: ElevatedButton(
                style: TextButton.styleFrom(backgroundColor: kBoldBlue,elevation: 0,),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("..بازگشت",
                      style: TextStyle(color: kWhite, fontSize: 24))),
            )
          ],
        ),
      ),
    );
  }
}
