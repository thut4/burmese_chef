import 'dart:io';
import 'package:burmese_meal/constant/app_color.dart';
import 'package:burmese_meal/constant/diemsion_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        final HomeController controller = Get.find<HomeController>();
        return AlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you want to exit?",
                  style: TextStyle(
                      fontFamily: 'poppins',
                      color: controller.isDarkMode.value
                          ? AppColor.whiteColor
                          : AppColor.blackColor,
                      fontSize: DimensionManager.font14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: DimensionManager.height20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('yes selected');
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.redColor),
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: DimensionManager.font14,
                              color: controller.isDarkMode.value
                                  ? AppColor.whiteColor
                                  : AppColor.whiteColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(width: DimensionManager.width15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        print('no selected');
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.whiteColor,
                      ),
                      child: Text("No",
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: DimensionManager.font14,
                              color: controller.isDarkMode.value
                                  ? AppColor.blackColor
                                  : AppColor.blackColor,
                              fontWeight: FontWeight.w400)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
