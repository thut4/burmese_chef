import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum ViewType { ListView, GridView }

class ViewController extends GetxController {
  var viewType = ViewType.ListView.obs;

  void toggleView() {
    viewType.value = (viewType.value == ViewType.ListView)
        ? ViewType.GridView
        : ViewType.ListView;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ViewController controller = Get.put(ViewController());

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView/GridView Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.view_module),
            onPressed: () => controller.toggleView(),
          ),
        ],
      ),
      body: Obx(
        () {
          return (controller.viewType.value == ViewType.ListView)
              ? _buildListView()
              : _buildGridView();
        },
      ),
    );
  }

  Widget _buildListView() {
    // Replace this with your ListView implementation
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(
        title: Text('Item $index'),
      ),
    );
  }

  Widget _buildGridView() {
    // Replace this with your GridView implementation
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        child: Center(
          child: Text('Item $index'),
        ),
      ),
    );
  }
}
