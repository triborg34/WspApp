import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

import 'package:wspapp/contracts.dart';
import 'package:wspapp/controllers/controllers.dart';
import 'package:wspapp/pages/details_screen.dart';

class CatorogizedScreen extends StatelessWidget {
  const CatorogizedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            Get.find<Varibales>().name!,
            style: TextStyle(fontSize:Get.width > 500 ? 32 : Get.width * 0.07 , color: kWhite),
          ),
          centerTitle: true,
        ),
        body: Get.find<Varibales>().display!.isNotEmpty
            ? Container(
                width: Get.width,
                height: Get.height,
                color: Colors.black,
                child: MyGridView(),
              )
            : Get.find<Varibales>().display!.isEmpty
                ? Center(
                    child: Text("!!!مسابقه مورد نظر یافت نشد",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.width > 500 ? 24 : Get.width * 0.05,
                            fontWeight: FontWeight.bold)),
                  )
                : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

//MyGridView
class MyGridView extends StatelessWidget {
  const MyGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(20),
        shrinkWrap: true,
        itemCount: Get.find<Varibales>().display!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            mainAxisExtent: Get.height * 0.20,
            childAspectRatio: 16 / 9),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: kPurple,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: GestureDetector(
              onTap: () {
                Get.find<Varibales>().currentIndex = index;
                Get.find<Varibales>().videourl =
                    Get.find<Varibales>().display![index].videourl;
                Get.find<Varibales>().imageurl =
                    Get.find<Varibales>().display![index].imageurl;
                Get.find<Varibales>().title =
                    Get.find<Varibales>().display![index].title;
                Get.find<Varibales>().date =
                    Get.find<Varibales>().display![index].date;

                Get.to(() => DetailsScreen());
              },
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageNetwork(
                        onTap: () {
                          Get.find<Varibales>().currentIndex = index;
                          Get.find<Varibales>().videourl =
                              Get.find<Varibales>().display![index].videourl;
                          Get.find<Varibales>().imageurl =
                              Get.find<Varibales>().display![index].imageurl;
                          Get.find<Varibales>().title =
                              Get.find<Varibales>().display![index].title;
                          Get.find<Varibales>().date =
                              Get.find<Varibales>().display![index].date;

                          Get.to(() => DetailsScreen());
                        },
                        image: Get.find<Varibales>().display![index].imageurl,
                        height: Get.height * 0.13,
                        width: Get.width * 0.41,
                        fitAndroidIos: BoxFit.fill,
                        fitWeb: BoxFitWeb.fill,
                        fullScreen: false,
                        imageCache: CachedNetworkImageProvider(
                            Get.find<Varibales>().display![index].imageurl),
                        onLoading: CircularProgressIndicator(
                          color: kWhite,
                        ),
                        onPointer: true,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        Get.find<Varibales>().display![index].title,
                        style: TextStyle(
                            color: kWhite,
                            fontSize: Get.width > 500 ? 18 : Get.width * 0.03),
                      ),
                      Text(
                        Get.find<Varibales>().display![index].date,
                        style: TextStyle(
                            color: Colors.white30,
                            fontSize: Get.width > 500 ? 14 : Get.width * 0.02),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
