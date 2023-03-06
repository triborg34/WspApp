import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wspapp/controllers/controllers.dart';


class ImageWidgetDetails extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 1.8,
      child: Hero(
        tag: 0,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(Get.find<Varibales>().imageurl!
              
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken),
          )),
        ),
      ),
    );
  }
}
