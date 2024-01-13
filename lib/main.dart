import 'package:burmese_meal/controller/home_controller.dart';
// import 'package:burmese_meal/screen/home_screen.dart';
import 'package:burmese_meal/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
import 'binding/home_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Obx(
      () => GetMaterialApp(
        theme: controller.isDarkMode.value
            ? ThemeData.dark(useMaterial3: true)
            : ThemeData.light(useMaterial3: true),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
      ),
    );
  }
}
