import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

import 'package:wspapp/contracts.dart';
import 'package:wspapp/controllers/controllers.dart';
import 'package:wspapp/pages/details_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.black,
        child: MyGridView(),
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
        itemCount: Get.find<Network>().fullcontent.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            mainAxisExtent: 150,
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
                    Get.find<Network>().fullcontent[index].videourl;
                Get.find<Varibales>().imageurl =
                    Get.find<Network>().fullcontent[index].imageurl;
                Get.find<Varibales>().title =
                    Get.find<Network>().fullcontent[index].title;
                Get.find<Varibales>().date =
                    Get.find<Network>().fullcontent[index].date;
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
                              Get.find<Network>().fullcontent[index].videourl;
                          Get.find<Varibales>().imageurl =
                              Get.find<Network>().fullcontent[index].imageurl;
                          Get.find<Varibales>().title =
                              Get.find<Network>().fullcontent[index].title;
                          Get.find<Varibales>().date =
                              Get.find<Network>().fullcontent[index].date;
                          Get.to(() => DetailsScreen());
                        },
                        image: Get.find<Network>().fullcontent[index].imageurl,
                        height: Get.height * 0.13,
                        width: Get.width * 0.41,
                        fitAndroidIos: BoxFit.fill,
                        fitWeb: BoxFitWeb.fill,
                        fullScreen: false,
                        imageCache: CachedNetworkImageProvider(
                            Get.find<Network>().fullcontent[index].imageurl),
                        onLoading: CircularProgressIndicator(color: kWhite),
                        onPointer: true,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        Get.find<Network>().fullcontent[index].title,
                        style: TextStyle(
                            color: kWhite,
                            fontSize: Get.width > 500 ? 18 : Get.width * 0.03),
                      ),
                      Text(
                        Get.find<Network>().fullcontent[index].date,
                        style: TextStyle(
                            color: Colors.white30,
                            fontSize: Get.width > 500 ? 14 : Get.width * 0.02),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

// class MyGrid extends StatelessWidget {
//   const MyGrid({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GridView.custom(
//         padding: EdgeInsets.all(15),
//         shrinkWrap: false,
//         physics: BouncingScrollPhysics(),
//         gridDelegate: SliverQuiltedGridDelegate(
//             crossAxisCount: 4,
//             pattern: [
//               QuiltedGridTile(1, 1),
//               QuiltedGridTile(1, 1),
//               QuiltedGridTile(1, 1),
//               QuiltedGridTile(1, 1)
//             ],
//             crossAxisSpacing: 40,
//             mainAxisSpacing: 40,
//             repeatPattern: QuiltedGridRepeatPattern.inverted),
//         childrenDelegate: SliverChildBuilderDelegate((context, index) {
//           return FittedBox(
//             fit: BoxFit.fill,
//             child: Stack(children: [
//               GestureDetector(
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(25),
//                       child: Image.asset(
//                         'images/7-5.jpg',
//                         fit: BoxFit.fill,
//                       ))),
//             ]),
//           );
//         }, childCount: 10));
//   }
// }
