import 'package:burmese_meal/constant/app_color.dart';
import 'package:burmese_meal/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../constant/diemsion_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BigText(
          //   text: 'Burmese Chef',
          //   fontSize: DimensionManager.font18,
          // ),
          RichText(
            text: TextSpan(
              text: 'Welcome to ',
              style: TextStyle(
                fontSize: DimensionManager.font16,
                fontWeight: FontWeight.w600,
                fontFamily: 'poppins',
                color: controller.isDarkMode.value
                    ? AppColor.lightBlue
                    : AppColor.darkBlue,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Burmese ',
                  style: TextStyle(
                      fontSize: DimensionManager.font18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'poppins',
                      color: AppColor.redColor),
                ),
                TextSpan(
                  text: 'Chef ',
                  style: TextStyle(
                      fontSize: DimensionManager.font16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins',
                      color: controller.isDarkMode.value
                          ? AppColor.whiteColor
                          : AppColor.blackColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: DimensionManager.height20,
          ),
          Center(
            child: LoadingAnimationWidget.twistingDots(
              leftDotColor: AppColor.redColor,
              rightDotColor: AppColor.darkBlue,
              size: DimensionManager.height110,
            ),
          )
        ],
      ),
    ));
  }
}
