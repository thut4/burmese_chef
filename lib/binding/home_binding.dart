import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/incompatible_foods_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => IncompatibleFoodsController());
  }
}
