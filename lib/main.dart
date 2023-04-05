import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wspapp/bindings/my_bindings.dart';
import 'package:wspapp/controllers/controllers.dart';

import 'package:wspapp/pages/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: MyBindigs(),
        onInit: () async {
          Get.find<ChechIntrentet>().connected();
        },
        theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
        defaultTransition: Transition.fade,
        home: Splashscreen());
  }
}


/* This App Made By Aref Mousavi 
    Version :1.0.0
    Contact:Aref.Mousavi0914@gmail.com
 */