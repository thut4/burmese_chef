import 'package:burmese_meal/constant/app_color.dart';
import 'package:burmese_meal/constant/diemsion_manager.dart';
import 'package:burmese_meal/model/data_model.dart';
import 'package:burmese_meal/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.data});
  final BurmeseMeal data;
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SmallText(
          text: data.name,
          fontWeight: FontWeight.w600,
          fontSize: DimensionManager.font16,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 300,
                margin: EdgeInsets.only(
                    left: DimensionManager.width10,
                    right: DimensionManager.width10),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(DimensionManager.radius20),
                    image: DecorationImage(
                        image: AssetImage(
                          data.image,
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: DimensionManager.width10,
                    top: DimensionManager.height10),
                child: RichText(
                  text: TextSpan(
                    text: 'ချက်ပြုတ်နည်း - ',
                    style: TextStyle(
                      fontSize: DimensionManager.font16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'poppins',
                      color: controller.isDarkMode.value
                          ? AppColor.darkColor
                          : AppColor.lightColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n${data.cookingInstructions}',
                        style: TextStyle(
                          fontSize: DimensionManager.font14 - 1,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'poppins',
                          color: controller.isDarkMode.value
                              ? AppColor.darkColor
                              : AppColor.lightColor,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
