import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class FadeWidgetDetails extends StatelessWidget {
  const FadeWidgetDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      child: FadeInUp(
        child: Container(
          width: Get.width,
          height: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
