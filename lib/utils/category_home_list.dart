import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryHomeListView extends StatefulWidget {

  final Function(int) updateFilteredList;

  CategoryHomeListView({required this.updateFilteredList});

  @override
  _CategoryHomeListViewState createState() => _CategoryHomeListViewState();
}

class _CategoryHomeListViewState extends State<CategoryHomeListView> {
  late List<Map<String, dynamic>> filteredList;

  final List<Map<String, String>> categoryList = [
    {'id':'1','image': 'assets/icons/bachata.png', 'categoryName': 'Bachata'},
    {'id':'2','image': 'assets/icons/merengue.png', 'categoryName': 'Merengue'},
    {'id':'3','image': 'assets/icons/acordeon.png', 'categoryName': 'Tipico'},
    {'id':'4','image': 'assets/icons/salsa.png', 'categoryName': 'Salsa'},
    {'id':'5','image': 'assets/icons/rock.png', 'categoryName': 'Rock'},
  ];

  int? _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 13),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final category = categoryList[index];
          final bool isSelected = _selectedIndex == index;

          return InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
                widget.updateFilteredList(index);
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 55,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white70 : Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Image.asset(
                          category['image']!,
                        ),
                      ),
                      Text(
                        category['categoryName']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
