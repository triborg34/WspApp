// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:image_network/image_network.dart';

import 'package:wspapp/contracts.dart';
import 'package:wspapp/controllers/controllers.dart';
import 'package:wspapp/models/model.dart';
import 'package:wspapp/pages/catorgized_screen.dart';
import 'package:wspapp/pages/details_screen.dart';
import 'package:wspapp/pages/explore_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              child: MyAppbar(
                  controller: Get.find<SearchController>().controller!),
              preferredSize: Size(Get.width, 65)),
          bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
                activeIndex: Get.find<BottomController>().index.value,
                icons: [Icons.home, Icons.explore],
                onTap: (index) {
                  Get.find<BottomController>().index.value = index;
                },
                backgroundColor: Colors.black,
                blurEffect: false,
                elevation: 0,
                activeColor: kBlue,
                inactiveColor: kWhite,
                iconSize: Get.width > 500 ? 28 : Get.width * 0.078,
                notchSmoothness: NotchSmoothness.verySmoothEdge,
                gapWidth: 0,
              )),
          body: Obx(() {
            if (Get.find<Network>().fullcontent.isEmpty) {
              return Container(
                height: Get.height,
                width: Get.width,
                color: Colors.black,
                child: Center(
                    child: CircularProgressIndicator(
                  color: kWhite,
                )),
              );
            } else if (Get.find<BottomController>().index.value == 0) {
              return MainScreen();
            } else {
              return ExploreScreen();
            }
          })),
    );
  }
}

//MainScreen
class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Column(
            children: [
              MySlideShow(),
              SizedBox(
                width: 10,
              ),
              MyTitles(
                text: "...تازه ها",
                buttontext: "...بیشتر",
                current: Get.find<Network>().fullcontent,
              ),
              SizedBox(
                width: 10,
              ),
              HorizentalListView(
                currentlist: Get.find<Network>().fullcontent,
              ),
              MyTitles(
                text: "WWE",
                buttontext: "...بیشتر",
                current: Get.find<Network>().wwecontent,
              ),
              HorizentalListView(currentlist: Get.find<Network>().wwecontent),
              MyTitles(
                text: "AEW",
                buttontext: "...بیشتر",
                current: Get.find<Network>().aewcontent,
              ),
              HorizentalListView(currentlist: Get.find<Network>().aewcontent),
              MyTitles(
                  text: "Others",
                  buttontext: "...بیشتر",
                  current: Get.find<Network>().otherscontent),
              HorizentalListView(
                  currentlist: Get.find<Network>().otherscontent),
              MyTitles(
                text: "PPV",
                buttontext: "...بیشتر",
                current: Get.find<Network>().ppvcontent,
              ),
              HorizentalListView(currentlist: Get.find<Network>().ppvcontent),
            ],
          ),
        ),
      ),
    );
  }
}

//MyListView
class HorizentalListView extends StatelessWidget {
  List<ShowsModel>? currentlist;

  HorizentalListView({
    Key? key,
    this.currentlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.31,
      child: ListView.separated(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          reverse: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: Get.width * 0.7,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ImageNetwork(
                          image: currentlist![index].imageurl,
                          height: Get.height * 0.31, //230
                          width: Get.width * 0.7, //250
                          fitAndroidIos: BoxFit.fill,
                          fitWeb: BoxFitWeb.fill,
                          onLoading: CircularProgressIndicator(color: kWhite),
                          imageCache: CachedNetworkImageProvider(
                              currentlist![index].imageurl),
                          onPointer: true,
                          onTap: () {
                            Get.find<Varibales>().currentIndex = index;
                            Get.find<Varibales>().videourl =
                                currentlist![index].videourl;
                            Get.find<Varibales>().imageurl =
                                currentlist![index].imageurl;
                            Get.find<Varibales>().title =
                                currentlist![index].title;
                            Get.find<Varibales>().date =
                                currentlist![index].date;
                            Get.to(() => DetailsScreen());
                          },
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  currentlist![index].title,
                  style: TextStyle(
                      color: kWhite,
                      fontSize: Get.width > 500 ? 18 : Get.width * 0.040),
                ),
                Text(
                  currentlist![index].date,
                  style: TextStyle(
                      color: Colors.white60,
                      fontSize: Get.width > 500 ? 14 : Get.width * 0.030),
                )
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10,
            );
          },
          itemCount: currentlist!.length),
    );
  }
}

//Mytitles
class MyTitles extends StatelessWidget {
  String? text;
  String? buttontext;
  List<ShowsModel>? current;

  MyTitles({Key? key, this.text, this.buttontext, this.current})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.find<Varibales>().display = current;
                    Get.find<Varibales>().name = text;

                    Get.to(() => CatorogizedScreen());
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.blueAccent,
                  )),
              TextButton(
                  onPressed: () {
                    Get.find<Varibales>().display = current;
                    Get.find<Varibales>().name = text;

                    Get.to(() => CatorogizedScreen());

                    // Get.to(() => CatorogizedScreen());
                  },
                  child: Text(
                    buttontext!,
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: Get.width > 500 ? 24 : Get.width * 0.06,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Text(
            text!,
            style: TextStyle(
                color: kWhite,
                fontSize: Get.width > 500 ? 24 : Get.width * 0.06,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

//MySlideShow
class MySlideShow extends StatelessWidget {
  const MySlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: GestureDetector(
          onTap: () {
            if (Get.find<Varibales>().currentIndex == 0) {
              List<ShowsModel> local =
                  Get.find<Varibales>().list.where((element) {
                return element.title.toLowerCase().contains('raw');
              }).toList();

              Get.find<Varibales>().display = local;
              Get.find<Varibales>().name = 'Raw';
              Get.to(() => CatorogizedScreen());
            } else if (Get.find<Varibales>().currentIndex == 1) {
              List<ShowsModel> local =
                  Get.find<Varibales>().list.where((element) {
                return element.title.toLowerCase().contains('smackdown');
              }).toList();

              Get.find<Varibales>().display = local;
              Get.find<Varibales>().name = 'Smackdown';
              Get.to(() => CatorogizedScreen());
            } else if (Get.find<Varibales>().currentIndex == 2) {
              Get.find<Varibales>().display = Get.find<Network>().aewcontent;
              Get.find<Varibales>().name = 'Aew';
              Get.to(() => CatorogizedScreen());
            }
          },
          child: ImageSlideshow(
            children: [
              Image.asset(
                'assets/images/rawlogo.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/smackdownlogo.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/aewlogo.jpeg',
                fit: BoxFit.cover,
              ),
            ],
            autoPlayInterval: 3000,
            isLoop: true,
            initialPage: 0,
            onPageChanged: (index) {
              Get.find<Varibales>().currentIndex = index;
            },
            indicatorColor: kLightPurple,
          ),
        ),
      ),
    );
  }
}

//MyAppbar
class MyAppbar extends StatelessWidget {
  const MyAppbar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.black,
      height: Get.width,
      width: Get.width,
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        decoration: BoxDecoration(
            color: kPurple,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: kPurple,
            )),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Text(
                "WSP",
                style: TextStyle(
                    color: kWhite,
                    fontSize: Get.width > 500 ? 24 : Get.width * 0.06),
              ),
              Icon(Icons.movie, color: kWhite, size: 24),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: GetBuilder<SearchController>(
                init: SearchController(),
                builder: (_) {
                  return SearchBarAnimation(
                    isOriginalAnimation: true, 
                    textEditingController: controller,
                    isSearchBoxOnRightSide: true,
                    hintText: "...جستجو کنید",
                    cursorColour: kWhite,
                    searchBoxColour: kBoldBlue,
                    
                    buttonColour: kLightPurple,
                    hintTextColour: kWhite,
                    textAlignToRight: false,
                    
                    buttonWidget: Icon(Icons.search,color: kWhite,),
                    secondaryButtonWidget: Icon(Icons.cancel,color: kBlack,),
                    trailingWidget: Icon(Icons.search,color: kWhite,),
                    
                    enteredTextStyle: TextStyle(
                        color: kWhite,
                        fontSize: Get.width > 500 ? 20 : Get.width * 0.04),
                    onCollapseComplete: () {
                      Get.find<SearchController>().change();
                    },
                    onFieldSubmitted: (String text) {
                      List<ShowsModel> searlist =
                          Get.find<Varibales>().list.where((element) {
                        return element.title
                            .toLowerCase()
                            .contains(text.toLowerCase());
                      }).toList();

                      Get.find<Varibales>().display = searlist;
                      Get.find<Varibales>().name = text;
                      Get.to(CatorogizedScreen());
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    ));
  }
}
