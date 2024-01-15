import 'package:burmese_meal/constant/diemsion_manager.dart';
import 'package:burmese_meal/utlis/utlits.dart';
import 'package:burmese_meal/widget/app_drawer.dart';
import 'package:burmese_meal/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/incompatible_foods_controller.dart';

class IncompatibleFoodsScreen extends StatelessWidget {
  const IncompatibleFoodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final IncompatibleFoodsController incompatibleController =
        Get.put((IncompatibleFoodsController()));
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: BigText(
              text: 'မတည့်သောအစားအစာများ',
            ),
            elevation: 0,
          ),
          drawer: AppDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: DimensionManager.width10,
                        vertical: DimensionManager.height10 - 3),
                    margin: EdgeInsets.symmetric(
                        horizontal: DimensionManager.width10 + 2),
                    height: 65,
                    child: TextFormField(
                      controller: TextEditingController()
                        ..text = incompatibleController.searchQuery.value,
                      // controller: controller.textEditingController,
                      onChanged: (value) {
                        incompatibleController.searchQuery.value = value;
                        incompatibleController.onSearchQueryChanged(value);
                      },
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'ရှာပါ',
                          suffixIcon: Icon(
                            Icons.search,
                            size: DimensionManager.icon16,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  DimensionManager.radius10))),
                    )),
                SizedBox(
                  height: DimensionManager.height20,
                ),
                Obx(() => incompatibleController.filteredFoods.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: DimensionManager.width10),
                        height: 600,
                        child: ListView.builder(
                          itemCount:
                              incompatibleController.filteredFoods.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final food =
                                incompatibleController.filteredFoods[index];
                            return ListTile(
                              title: SmallText(
                                text: food.foodA,
                              ),
                              leading: SmallText(
                                text: food.foodB,
                              ),
                              trailing: SmallText(
                                text: food.description,
                              ),
                            );
                          },
                        ),
                      ))
              ],
            ),
          )),
    );
  }
}
