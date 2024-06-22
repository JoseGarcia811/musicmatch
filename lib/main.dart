import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:musicmatch/utils/constants.dart';
import 'package:musicmatch/utils/routes.dart';
import 'package:musicmatch/views/onboding/onboding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Match',
      theme: ThemeData(canvasColor: Colors.transparent,
        primaryColor: mainColor,
        fontFamily: "mulaceno",
      ),
      initialRoute: OnboardingScreen.routeName,
      routes: getApplicationsRoutes(),
    );
  }
}
