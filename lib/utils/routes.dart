import 'package:flutter/material.dart';
import 'package:musicmatch/views/home.dart';
import 'package:musicmatch/views/login/login_screen.dart';
import '../views/onboding/onboding_screen.dart';
import 'navigation_menu.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    OnboardingScreen.routeName: (BuildContext context) => const OnboardingScreen(),
    LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
    NavigationMenu.routeName: (BuildContext context) => const NavigationMenu(),
    Home.routeName: (BuildContext context) => const Home(),
  };
}
