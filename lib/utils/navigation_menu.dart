import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../views/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.onItemSelected(index),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.document_text), label: 'Solicitudes'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Tienda'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Perfil'),
          ],
        ),
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.screens,
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  void onItemSelected(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  final screens = [
      const Home(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.black,
    ),
  ];
}
