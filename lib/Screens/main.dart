// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      // Theme mode depends on device settings at the beginning
      home: HomeScreen(),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
        actions: [
          IconButton(
              icon: Icon(Icons.lightbulb),
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.dark());
              })
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Other Screen'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OtherScreen()));
          },
        ),
      ),
    );
  }
}

// Other Screen
class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Screen'),
      ),
      body: Center(
        child: Card(
          child: Container(
              width: 300,
              height: 300,
              alignment: Alignment.center,
              child: Text('Other Screen')),
        ),
      ),
    );
  }
}
Get.changeTheme(
Get.isDarkMode ? ThemeData.light() : ThemeData.dark());