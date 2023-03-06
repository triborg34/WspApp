import 'package:get/get.dart';
import 'package:wspapp/controllers/controllers.dart';

class MyBindigs extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BottomController());
    Get.put(Network());
    Get.lazyPut(() => Varibales());
    Get.lazyPut(() => SearchController());
    Get.put(ChechIntrentet());
  }

}