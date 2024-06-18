import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:musicmatch/utils/constants.dart';
import 'package:musicmatch/views/profile.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../views/home.dart';
import 'image_picker_dialog.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () {
            _displaySchedule(context);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: Obx(
            () => BottomAppBar(
          color: mainColor,
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                  color: backgroundColorLight,
                ),
              ),
            ),
            child: NavigationBar(
              backgroundColor: mainColor,
              indicatorColor: Colors.white,
              elevation: 5,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) => controller.onItemSelected(index),
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(Iconsax.home, color: mainColor),
                  icon: Icon(Iconsax.home, color: backgroundColorLight),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Iconsax.document_text, color: mainColor),
                  icon: Icon(Iconsax.document_text, color: backgroundColorLight),
                  label: 'Solicitudes',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Iconsax.shop, color: mainColor),
                  icon: Icon(Iconsax.shop, color: backgroundColorLight),
                  label: 'Tienda',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Iconsax.user, color: mainColor),
                  icon: Icon(Iconsax.user, color: backgroundColorLight),
                  label: 'Perfil',
                ),
              ],
            ),
          ),
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

  void _displaySchedule(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.968,
          child: _getCustomizedDatePicker(context),
        );
      },
    );
  }

  SfDateRangePicker _getCustomizedDatePicker(BuildContext context) {
    return SfDateRangePicker(
      backgroundColor: Colors.white70,
      showActionButtons: true,
      onSubmit: (Object? value) {
        if (value is PickerDateRange) {}
      },
      onCancel: () {
        Navigator.of(context).pop();
      },
      toggleDaySelection: true,
      minDate: DateTime.now(),
      confirmText: "PUBLICAR",
      cancelText: "CANCELAR",
      selectionMode: DateRangePickerSelectionMode.single,
      selectionColor: mainColor,
      headerStyle: const DateRangePickerHeaderStyle(
        backgroundColor: mainColor,
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      showNavigationArrow: true,
      todayHighlightColor: mainColor,
      monthViewSettings: const DateRangePickerMonthViewSettings(
        firstDayOfWeek: 1,
        numberOfWeeksInView: 6,
        showTrailingAndLeadingDates: true,
        viewHeaderHeight: 50,
        dayFormat: 'E',
      ),
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
        if (args.value != null) _showDialog(context, args);
      },
      selectionTextStyle: const TextStyle(fontSize: 16),
      monthCellStyle: const DateRangePickerMonthCellStyle(
        textStyle: TextStyle(fontSize: 16),
      ),
    );
  }

  void _showDialog(
      BuildContext context, DateRangePickerSelectionChangedArgs args) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ImagePickerDialog(selectedDate: args.value);
      },
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
    const Profile(),
  ];
}
