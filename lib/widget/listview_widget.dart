import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_color.dart';
import '../constant/diemsion_manager.dart';
import '../controller/home_controller.dart';
import '../screen/detail_screen.dart';
import 'text_widget.dart';

buildListView(HomeController controller, BuildContext context) {
  return SizedBox(
    height: 670,
    width: DimensionManager.screenWidth,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.burmeseFoods.length,
      itemBuilder: (context, index) {
        final data = controller.burmeseFoods[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => DetailScreen(data: data));
          },
          child: Container(
            width: DimensionManager.boxWidth,
            margin: EdgeInsets.symmetric(
              horizontal: DimensionManager.width10,
              vertical: DimensionManager.height10,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: DimensionManager.screenWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: DimensionManager.width10,
                    ),
                    decoration: BoxDecoration(
                        color: AppColor.darkBlue,
                        borderRadius:
                            BorderRadius.circular(DimensionManager.radius20),
                        image: DecorationImage(
                            image: AssetImage(data.image),
                            fit: BoxFit.fitWidth)),
                    // Add your image or content here
                  ),
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
                        left: DimensionManager.width10,
                        bottom: DimensionManager.height10,
                      ),
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
                                height: 1.5,
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
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => DetailScreen(data: data)),
                    child: Obx(
                      () => Container(
                        margin: EdgeInsets.only(left: DimensionManager.width10),
                        alignment: Alignment.bottomLeft,
                        height: DimensionManager.height45,
                        width: DimensionManager.screenWidth * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                DimensionManager.radius10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 2,
                                blurStyle: BlurStyle.outer,
                                offset: Offset(0.3, 0.3),
                                color: controller.isDarkMode.value
                                    ? AppColor.darkColor.withOpacity(0.7)
                                    : AppColor.blackColor.withOpacity(0.65),
                              )
                            ]),
                        child: Center(
                            child: SmallText(
                          text: 'ချက်နည်းကြည့်ရန်',
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
