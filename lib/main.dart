import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrangeAccent,
      ),
      themeMode: ThemeMode.dark,
    ),
  );
}