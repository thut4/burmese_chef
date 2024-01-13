import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/data_model.dart';
import '../screen/home_screen.dart';

enum ViewType { ListView, GridView }

class HomeController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxList<BurmeseMeal> burmeseFoods = List<BurmeseMeal>.empty().obs;
  RxList<BurmeseMeal> filteredFoods = List<BurmeseMeal>.empty().obs;
  RxBool isLoading = false.obs;
  RxString searchQuery = " ".obs;
  var viewType = ViewType.ListView.obs;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    onStartUp();
  }

  Future<void> onStartUp() async {
    _splashLoading();
    await loadData();
    _loadDarkMode();
  }

  void _splashLoading() {
    Timer(const Duration(seconds: 5), () {
      Get.off(() => const HomeScreen());
    });
  }

  void toggleView() {
    viewType.value = (viewType.value == ViewType.ListView)
        ? ViewType.GridView
        : ViewType.ListView;
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      String jsonString = await rootBundle.loadString('assets/data.json');
      List<dynamic> itemList = json.decode(jsonString);
      burmeseFoods
          .assignAll(itemList.map((data) => BurmeseMeal.fromJson(data)));
    } catch (e) {
      print('Error fetching data : $e');
    } finally {
      isLoading.value = false;
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredFoods.assignAll(burmeseFoods);
    } else {
      filteredFoods.assignAll(burmeseFoods
          .where((meal) =>
              meal.name.toLowerCase().contains(query.toLowerCase()) ||
              meal.ingredients.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }

  

  void toggleDarkMode() {
    isDarkMode.toggle();
    update();
    _saveDarkMode();
  }

  void _saveDarkMode() {
    final box = GetStorage();
    box.write('isDarkMode', isDarkMode.value);
  }

  void _loadDarkMode() {
    final box = GetStorage();
    if (box.hasData('isDarkMode')) {
      isDarkMode.value = box.read('isDarkMode') ?? false;
    }
  }
}
