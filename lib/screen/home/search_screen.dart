import 'package:burmese_meal/constant/diemsion_manager.dart';
import 'package:burmese_meal/controller/home_controller.dart';
import 'package:burmese_meal/screen/home/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../constant/app_color.dart';
import '../../widget/text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Scaffold(
        appBar: AppBar(
          title: BigText(
            text: 'Search...',
            fontSize: DimensionManager.font16,
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  height: 65,
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = controller.searchQuery.value,
                    onChanged: (value) {
                      controller.searchQuery.value = value;
                      controller.search(value);
                    },
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'ရှာပါ',
                        suffixIcon: const Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                DimensionManager.radius10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                DimensionManager.radius10))),
                  )),
              Obx(() => controller.filteredFoods.isEmpty
                  ? Center(
                      child: LoadingAnimationWidget.discreteCircle(
                        color: AppColor.redColor,
                        secondRingColor: AppColor.lightBlue,
                        thirdRingColor: controller.isDarkMode.value
                            ? AppColor.whiteColor
                            : AppColor.darkGrey,
                        size: DimensionManager.height45,
                      ),
                    )
                  : SizedBox(
                      height: 650,
                      child: ListView.builder(
                        itemCount: controller.filteredFoods.length,
                        itemBuilder: (context, index) {
                          final data = controller.filteredFoods[index];
                          return GestureDetector(
                              onTap: () {
                                Get.to(() => DetailScreen(data: data));
                              },
                              child: ListTile(
                                title: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: DimensionManager.width10,
                                      vertical: DimensionManager.height10),
                                  child: SmallText(text: data.name),
                                ),
                                trailing: IconButton(
                                    onPressed: () =>
                                        Get.to(() => DetailScreen(data: data)),
                                    icon: Icon(
                                      Icons.arrow_right_alt_outlined,
                                      size: DimensionManager.icon32,
                                    )),
                              ));
                        },
                      ),
                    ))
            ],
          ),
        ));
  }
}
