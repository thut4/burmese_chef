import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_color.dart';
import '../constant/diemsion_manager.dart';
import '../controller/home_controller.dart';
import '../screen/detail_screen.dart';
import 'text_widget.dart';


buildGridView(HomeController controller) {
    return SizedBox(
      height: DimensionManager.containerHeight,
      width: DimensionManager.screenWidth,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 0.3),
        itemCount: controller.burmeseFoods.length,
        itemBuilder: (context, index) {
          final data = controller.burmeseFoods[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => DetailScreen(data: data));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Container(
                    // height: DimensionManager.boxHeight,
                    width: DimensionManager.boxWidth,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DimensionManager.radius15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 1,
                              offset: const Offset(0.2, 0.3),
                              blurStyle: BlurStyle.outer,
                              color: controller.isDarkMode.value
                                  ? AppColor.whiteColor.withOpacity(0.5)
                                  : AppColor.blackColor.withOpacity(0.5))
                        ]),
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: DimensionManager.width10,
                    //     vertical: DimensionManager.height10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: DimensionManager.width10,
                            top: DimensionManager.height10,
                          ),
                          child: BigText(
                            text: data.name,
                            fontSize: DimensionManager.font16,
                          ),
                        ),
                        Obx(
                          () => Padding(
                              padding: EdgeInsets.only(
                                  left: DimensionManager.width15,
                                  bottom: DimensionManager.height10),
                              child: RichText(
                                text: TextSpan(
                                  text: 'လိုအပ်သောပစ္စည်းများ - ',
                                  style: TextStyle(
                                    fontSize: DimensionManager.font14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins',
                                    color: controller.isDarkMode.value
                                        ? AppColor.darkColor
                                        : AppColor.lightColor,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\n${data.ingredients}',
                                      style: TextStyle(
                                        height: 1.75,
                                        fontSize: DimensionManager.font12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'poppins',
                                        color: controller.isDarkMode.value
                                            ? AppColor.darkColor
                                            : AppColor.lightColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
