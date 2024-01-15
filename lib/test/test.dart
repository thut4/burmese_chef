import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: AppDrawer(), // Add the drawer here
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'App Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Option 1'),
            onTap: () {
              // Handle option 1 tap
              Get.to(() => HomeScreen());
            },
          ),
          ListTile(
            title: Text('Option 2'),
            onTap: () {
              // Handle option 2 tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Add more list tiles for additional options
        ],
      ),
    );
  }
}
