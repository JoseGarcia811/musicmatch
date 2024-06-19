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
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:SizedBox(
          width: 60,
          height: 100,
          child:Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: FloatingActionButton(
          backgroundColor: backgroundColorLight,
          onPressed: () {
            _displaySchedule(context);
          },
          child: const Icon(size: 25,
            Icons.add,
            color: mainColor,
          ),
        ),
      )),
      bottomNavigationBar: Obx(
        () => BottomAppBar(color: Colors.transparent,
          padding: const EdgeInsets.all(5),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                  color: backgroundColorLight,
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20.0), bottom: Radius.circular(20.0)),
              child: Container(
                decoration: const BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                      bottom: Radius.circular(
                          20.0)),
                ),
                child: NavigationBar(
                  backgroundColor: mainColor,
                  indicatorColor: Colors.transparent,
                  elevation: 0,
                  selectedIndex: controller.selectedIndex.value,
                  onDestinationSelected: (index) =>
                      controller.onItemSelected(index),
                  destinations: const [
                    NavigationDestination(
                      selectedIcon:
                          Icon(Iconsax.home, color: backgroundColorLight),
                      icon: Icon(Iconsax.home, color: Colors.grey),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      selectedIcon: Icon(Iconsax.document_text,
                          color: backgroundColorLight),
                      icon: Icon(Iconsax.document_text, color: Colors.grey),
                      label: 'Solicitudes',
                    ),
                    SizedBox(width: 10,),
                    NavigationDestination(
                      selectedIcon:
                          Icon(Iconsax.shop, color: backgroundColorLight),
                      icon: Icon(Iconsax.shop, color: Colors.grey),
                      label: 'Tienda',
                    ),
                    NavigationDestination(
                      selectedIcon:
                          Icon(Iconsax.user, color: backgroundColorLight),
                      icon: Icon(Iconsax.user, color: Colors.grey),
                      label: 'Perfil',
                    ),
                  ],
                ),
              ),
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
    const SizedBox(width: 10,),
    Container(
      color: Colors.yellow,
    ),
    const Profile(),
  ];
}
