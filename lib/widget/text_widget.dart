import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_color.dart';
import '../controller/home_controller.dart';

class SmallText extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  SmallText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.w400,
    this.textOverflow = TextOverflow.fade,
  });
  final String text;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = controller.isDarkMode.value;
    return Obx(
      () => Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          overflow: textOverflow,
          fontWeight: fontWeight,
          fontFamily: 'poppins',
          color: controller.isDarkMode.value
              ? AppColor.darkColor
              : AppColor.lightColor,
        ),
      ),
    );
  }
}

class BigText extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  // final HomeController controller = Get.put(HomeController());
  BigText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.textOverflow = TextOverflow.fade,
  });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = controller.isDarkMode.value;
    return Obx(
      () => Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          overflow: textOverflow,
          fontWeight: fontWeight,
          fontFamily: 'poppins',
          color: controller.isDarkMode.value
              ? AppColor.darkColor
              : AppColor.lightColor,
        ),
      ),
    );
  }
}
