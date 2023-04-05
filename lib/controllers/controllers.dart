import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:convert' as convert;
import 'package:wspapp/models/model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BottomController extends GetxController {
  var index = 0.obs;
}

class Network extends GetxController {
  

  RxList<ShowsModel> fullcontent = <ShowsModel>[].obs;

  RxList<ShowsModel> wwecontent = <ShowsModel>[].obs;
  RxList<ShowsModel> aewcontent = <ShowsModel>[].obs;
  RxList<ShowsModel> otherscontent = <ShowsModel>[].obs;
  RxList<ShowsModel> ppvcontent = <ShowsModel>[].obs;

  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();

//back4app keys
    final keyApplicationId = 'wEzBjntesa3eQgsFSLeFp9SSbdOEcpa50C31Oegm';
    final keyClientKey = '2zOkZTYfOnQF1Ws9KBziXFb7pcxqmf5T0xqDKtsP';
    final keyParseServerUrl = 'https://parseapi.back4app.com';
    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, debug: true);
//back4app keys
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('wsp'));
    
    query.orderByDescending('createdAt');

    final ParseResponse apiResponse = await query.query();
    // query.orderByAscending('createdAt');
    if (apiResponse.success && apiResponse.results != null) {
      List jsonD = convert.jsonDecode(apiResponse.results.toString());
      for (var json in jsonD) {
        fullcontent.add(ShowsModel.fromJson(json));
      }
    }
    //wwe
    for (var wweshow in fullcontent) {
      if (wweshow.brand.contains('wwe')) {
        wwecontent.add(wweshow);
      }
      ;
    }

    //aew

    for (var aewshow in fullcontent) {
      if (aewshow.brand.contains('aew')) {
        aewcontent.add(aewshow);
      }
      ;
    }

    //other
    for (var othershow in fullcontent) {
      if (othershow.brand.contains('tna') || othershow.brand.contains('njpw')) {
        otherscontent.add(othershow);
      }
      ;
    }

    //ppv

    for (var ppvshow in fullcontent) {
      if (ppvshow.show.contains('ppv')) {
        ppvcontent.add(ppvshow);
      }
      ;
    }

    super.onInit();
  }
}

class Varibales extends GetxController {
  List<ShowsModel>? display;
  String? videourl;
  String? imageurl;
  String? title;
  String? date;
  int? currentIndex;
  List<ShowsModel> list = Get.find<Network>().fullcontent;

  String? name;
}

class SearchController extends GetxController {
  TextEditingController? controller;

  void change() {
    controller!.text = '';
    update();
  }

  @override
  void onInit() {
    controller = TextEditingController();
    super.onInit();
  }
}

class ChechIntrentet extends GetxController {
  var isconnect = false.obs;
  void connected() async {
    print("Inja");
    var resuilt = await (Connectivity().checkConnectivity());
    if (resuilt == ConnectivityResult.wifi ||
        resuilt == ConnectivityResult.ethernet ||
        resuilt == ConnectivityResult.mobile) {
      isconnect.value = true;
    } else {
      isconnect.value = false;
    }
  }
}












// final adminAuthData = await client.admins
    //     .authViaEmail('Aref.mousavi0914@gmail.com', 'gun.gun0914');

    // //All Database
    // final fullres =
    //     client.records.getList('wspapp', sort: '-created').then((value) {
    //   List jsonD = convert.jsonDecode(value.items.toString());
    //   for (var json in jsonD) {
    //     fullcontent.add(ShowsModel.fromJson(json));
    //   }
    // });
    // //wwe database
    // final wweres = client.records
    //     .getList('wspapp', sort: '-created', filter: 'brand="wwe"')
    //     .then((value) {
    //   List jsonD = convert.jsonDecode(value.items.toString());
    //   for (var json in jsonD) {
    //     wwecontent.add(ShowsModel.fromJson(json));
    //   }
    // });

    // //aew database
    // final aewres = client.records
    //     .getList('wspapp', sort: '-created', filter: 'brand="aew"')
    //     .then((value) {
    //   List jsonD = convert.jsonDecode(value.items.toString());
    //   for (var json in jsonD) {
    //     aewcontent.add(ShowsModel.fromJson(json));
    //   }
    // });

    // //others
    // final othersres = client.records
    //     .getList('wspapp', sort: '-created', filter: 'brand="tna"|| brand="njpw"')
    //     .then((value) {
    //   List jsonD = convert.jsonDecode(value.items.toString());
    //   for (var json in jsonD) {
    //     otherscontent.add(ShowsModel.fromJson(json));
    //   }

    // });
    // //ppv database
    // final ppvres = client.records
    //     .getList('wspapp', sort: '-created', filter: 'show="ppv"')
    //     .then((value) {
    //   List jsonD = convert.jsonDecode(value.items.toString());
    //   for (var json in jsonD) {
    //     ppvcontent.add(ShowsModel.fromJson(json));
    //   }

    // });