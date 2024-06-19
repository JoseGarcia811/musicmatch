import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:musicmatch/utils/constants.dart';
import 'package:musicmatch/utils/navigation_menu.dart';
import 'package:musicmatch/views/login/onboding/onboding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Match',
      theme: ThemeData(canvasColor: Colors.transparent,
        primaryColor: mainColor,
        fontFamily: "mulaceno",
      ),
      home: const NavigationMenu(),
    );
  }
}
