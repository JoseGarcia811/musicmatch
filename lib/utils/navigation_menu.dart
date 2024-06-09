import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:musicmatch/utils/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../views/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () {
            _displaySchedule(context);
          },
          child: const Icon(
            Icons.add,
            color: backgroundColor2,
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          child: SizedBox(
            height: 80,
            child: NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.onItemSelected(index),
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Iconsax.document_text), label: 'Solicitudes'),
                SizedBox(width: 50),
                NavigationDestination(
                    icon: Icon(Iconsax.shop), label: 'Tienda'),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: 'Perfil'),
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

  void _displaySchedule(context) {
    showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
              padding: const EdgeInsets.all(15),
              child: _getCustomizedDatePicker(context));
        });
  }

  SfDateRangePicker _getCustomizedDatePicker(context) {
    DateTime _selectedDate;
    return SfDateRangePicker(
      backgroundColor: Colors.white70,
      showActionButtons: true,
      onSubmit: (Object? value) {
        if (value is PickerDateRange) {}
      },
      onCancel: () {
        Navigator.of(context).pop();
      },
      confirmText: "PUBLICAR",
      cancelText: "CERRAR",
      selectionShape: DateRangePickerSelectionShape.circle,
      selectionMode: DateRangePickerSelectionMode.single,
      selectionColor: backgroundColor2,
      headerStyle: const DateRangePickerHeaderStyle(
          backgroundColor: backgroundColor2,
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          )),
      showNavigationArrow: true,
      todayHighlightColor: backgroundColor2,
      toggleDaySelection: true,
      monthViewSettings: const DateRangePickerMonthViewSettings(
        firstDayOfWeek: 1,
        // Lunes como el primer día de la semana
        numberOfWeeksInView: 6,
        // Muestra 6 semanas en la vista mensual
        showTrailingAndLeadingDates: true,
        // Muestra los días del mes anterior y siguiente
        viewHeaderHeight: 50,
        // Altura de la cabecera de la vista mensual
        dayFormat: 'E', // Formato de los días (por ejemplo, "Lun", "Mar", etc.)
      ),
      onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
         print(args.value);
      },
      selectionTextStyle: const TextStyle(fontSize: 16),
      monthCellStyle: const DateRangePickerMonthCellStyle(
        textStyle: TextStyle(fontSize: 16),
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
