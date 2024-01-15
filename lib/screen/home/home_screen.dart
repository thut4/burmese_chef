import 'package:burmese_meal/constant/diemsion_manager.dart';
import 'package:burmese_meal/controller/home_controller.dart';
import 'package:burmese_meal/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utlis/utlits.dart';
import '../../widget/app_drawer.dart';
import '../../widget/listview_widget.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final height = DimensionManager.screenHeight;
    // final width = DimensionManager.screenWidth;
    // print('height : $height and width : $width');
    final HomeController controller = Get.put(HomeController());
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            title: BigText(
              text: 'Burmese Chef',
              fontSize: DimensionManager.font16,
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            actions: [
              // Obx(() => IconButton(
              //     onPressed: controller.toggleDarkMode,
              //     icon: controller.isDarkMode.value
              //         ? Icon(
              //             Icons.dark_mode,
              //             size: DimensionManager.icon24,
              //           )
              //         : Icon(
              //             Icons.light_mode,
              //             size: DimensionManager.icon24,
              //           ))),
              IconButton(
                  onPressed: () {
                    Get.to(() => SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                    size: DimensionManager.icon24,
                  ))
              // IconButton(
              //   icon: Icon(Icons.view_module),
              //   onPressed: () => controller.toggleView(),
              // )
            ],
          ),
          drawer: AppDrawer(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : buildListView(controller, context))
                // Obx(
                //   () {
                //     return (controller.viewType.value == ViewType.ListView)
                //         ? _buildListView(controller)
                //         : _buildGridView(controller);
                //   },
                // ),
              ],
            ),
          )),
    );
  }
}
