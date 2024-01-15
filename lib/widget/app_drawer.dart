import 'package:burmese_meal/constant/app_color.dart';
import 'package:burmese_meal/controller/home_controller.dart';
import 'package:burmese_meal/screen/home/home_screen.dart';
import 'package:burmese_meal/screen/incompatible_foods/home_page.dart';
import 'package:burmese_meal/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/diemsion_manager.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Obx(
            () => DrawerHeader(
              curve: Curves.slowMiddle,
              decoration: BoxDecoration(
                  color: controller.isDarkMode.value
                      ? AppColor.lightColor
                      : AppColor.lightGrey),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: DimensionManager.height100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/logo.png'),
                          fit: BoxFit.fitHeight)),
                ),
              ),
            ),
          ),
          ListTile(
            title: SmallText(
              text: 'Home',
              fontSize: DimensionManager.font16,
              fontWeight: FontWeight.w600,
            ),
            onTap: () {
              Get.to(() => HomeScreen());
              // Future.delayed(Duration(seconds: 3), () {
              //   Get.back(); // Close the drawer after three seconds
              // });
              // Get.back();
            },
          ),
          ListTile(
            title: SmallText(
              text: 'Incompatible foods',
              fontSize: DimensionManager.font16,
              fontWeight: FontWeight.w600,
            ),
            onTap: () {
              Get.to(() => IncompatibleFoodsScreen());
              // Future.delayed(Duration(seconds: 3), () {
              //   Get.back(); // Close the drawer after three seconds
              // });
            },
          ),
          Obx(
            () => ListTile(
              title: GestureDetector(
                onTap: controller.toggleDarkMode,
                child: SmallText(
                    fontSize: DimensionManager.font16,
                    fontWeight: FontWeight.bold,
                    text: controller.isDarkMode.value
                        ? 'Dark mode'
                        : 'Light mode'),
              ),
              trailing: IconButton(
                  onPressed: controller.toggleDarkMode,
                  icon: controller.isDarkMode.value
                      ? Icon(
                          Icons.dark_mode,
                          size: DimensionManager.icon32,
                        )
                      : Icon(
                          Icons.light_mode,
                          size: DimensionManager.icon32,
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
