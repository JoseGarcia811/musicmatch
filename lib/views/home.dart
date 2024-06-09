import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/category_home_list.dart';
import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final Map<int, String> _buttonTextAdd = {};
  final List<Map<String, String>> categoryList = [
    {'image': 'bachata.jpg', 'categoryName': 'Bachata'},
    {'image': 'merengue.png', 'categoryName': 'Merengue'},
    {'image': 'acordeon.png', 'categoryName': 'Tipico'},
    {'image': 'salsa.png', 'categoryName': 'Salsa'},
    {'image': 'rock.png', 'categoryName': 'Rock'}
  ];
  final List<Map<String, String>> imgList = [
    {
      'image': 'travesia.jpg',
      'title': 'Grupo Travesia',
      'gender': 'Bachata',
      'dayDesc': 'Vie.',
      'dayInt': '07',
      'percent': '4.7'
    },
    {
      'image': 'saul.jpg',
      'title': 'Dinastia',
      'gender': 'Bachata/Merengue',
      'dayDesc': 'Sab.',
      'dayInt': '08',
      'percent': '3.6'
    },
    {
      'image': 'arthul.jpg',
      'title': 'Arthul',
      'gender': 'Rock',
      'dayDesc': 'Dom.',
      'dayInt': '09',
      'percent': '3.3'
    },
  ];
  final List<Map<String, dynamic>> mainList = [
    {
      'image': 'saul.jpg',
      'title': 'Saul Rodriguez y Dinastia',
      'gender': 'Bachata/Merengue',
      'gendId': [0,1],
      'countLike': '6',
      'countRequest': '21',
      'activityType': 'Conga',
      'location': 'Santo Domingo',
      'dateActivity': 'Sab. 08/05/2024',
      'timeActivity': '9:00pm a 12:00am',
      'payment': '2,500.00',
      'instagram' : '@grupo.travesia',
      'youtube' : 'grupotravesia'
    },
    {
      'image': 'travesia.jpg',
      'title': 'Grupo Travesia',
      'gender': 'Bachata',
      'gendId': [0],
      'countLike': '15',
      'countRequest': '30',
      'activityType': 'Pianista',
      'location': 'Santo Domingo',
      'dateActivity': 'Vie. 07/05/2024',
      'timeActivity': '6:00pm a 11:00pm',
      'payment': '3,500.00',
      'instagram' : '@grupo.travesia',
      'youtube' : 'grupotravesia'
    },
    {
      'image': 'arthul.jpg',
      'title': 'Arthul y su banda total',
      'gender': 'Rock',
      'gendId': [4],
      'countLike': '0',
      'countRequest': '2',
      'activityType': 'Baterista',
      'location': 'San Cristobal',
      'dateActivity': 'Dom. 09/05/2024',
      'timeActivity': '10:00pm a 1:00am',
      'payment': '4,000.00',
      'instagram' : '@grupo.travesia',
      'youtube' : 'grupotravesia'
    },
  ];

  @override
  void initState() {
    super.initState();
    updateFilteredList(0);
  }

  List<Map<String, dynamic>> filteredList = [];
  void updateFilteredList(int gendId) {
    setState(() {
      filteredList = mainList.where((e) => e['gendId'].contains(gendId)).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: BottomShapeClipper(),
            child: Container(
              color: Colors.deepPurple,
              height: screenHeight * 0.62,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 5),
                  child: Row(
                    children: <Widget>[
                      Spacer(
                        flex: 8,
                      ),
                      Icon(
                        Iconsax.notification_bing5,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
                  Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 8),
                      child: SizedBox(
                        width: 315,
                        height: 35,
                        child:   Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 14,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const TextField(
                            style: TextStyle(color: Colors.white70),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.white70),
                              hintText: "Buscar...",
                              contentPadding: EdgeInsets.only(top: 5),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white70,
                              ),
                              filled: true,
                              fillColor: Colors.deepPurple,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 0),
                      child: Icon(
                        Iconsax.filter,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Próximos Eventos",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "Ver todos",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                CarouselSlider(
                  items: imgList.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.only(right: 9.0, bottom: 11),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                "assets/Backgrounds/${item['image']}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 0,
                              width: 70,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  child: Image.asset(
                                      "assets/icons/calendar.png"))),
                          Positioned(
                              top: 20,
                              left: 13,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  child: Column(children: [
                                    Row(children: [
                                      Text(
                                        "${item["dayDesc"]}",
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontStyle: FontStyle.italic),
                                      )
                                    ]),
                                  ]))),
                          Positioned(
                              top: 30,
                              left: 12,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: Row(children: [
                                  Text(
                                    "${item["dayInt"]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ]),
                              )),
                          Positioned(
                            width: 305,
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 13, right: 13, top: 4, bottom: 4),
                              decoration: const BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    item['title']!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    " - (${item['gender']})",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Iconsax.star1,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    item['percent']!,
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    aspectRatio: 14 / 6,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                  ),
                ),
                SizedBox(height: 85, child: CategoryHomeListView(updateFilteredList: updateFilteredList,)),
                (filteredList.isNotEmpty) ?
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    color: backgorundBody,
                    child: ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        var main = filteredList[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 900),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Card(
                                margin: const EdgeInsets.all(13.0),
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration:   BoxDecoration(
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/Backgrounds/${main['image']!}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: 4.0,
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.red,
                                                  Colors.orange,
                                                  Colors.yellow,
                                                  Colors.orange,
                                                  Colors.red,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 4,
                                            right: 0,
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 17, right: 17),
                                                width: 348,
                                                color: backgroundColor2,
                                                child:   Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          main['activityType']!,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 17),
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          10.0),
                                                              child: Text(
                                                                main['countLike']!,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white70,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  10.0),
                                                              child: Icon(
                                                              Iconsax.like_14,
                                                              color: Colors
                                                                  .white70,
                                                              size: 25,
                                                            ),),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(
                                                              right:
                                                              10.0),
                                                          child: Text(
                                                            main['countRequest']!,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white70,
                                                                fontSize:
                                                                17),
                                                          ),
                                                        ),
                                                        const Icon(
                                                          Iconsax.user_cirlce_add,
                                                          color: Colors.white70,
                                                          size: 25,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )))
                                      ],
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16.0, top: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  main['title']!,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(main['gender']!),
                                              const Spacer(),
                                              const Icon(
                                                Iconsax.instagram,
                                                color: Colors.brown,
                                              ),
                                              const Text(" "),
                                              const Icon(
                                                Iconsax.play,
                                                color: Colors.redAccent,
                                              ),
                                            ],
                                          ),
                                          const Divider(color: Colors.grey)
                                        ],
                                      ),
                                    ),
                                     Padding(
                                      padding:const EdgeInsets.only(
                                          left: 16.0, right: 16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Iconsax.calendar,
                                                          size: 15,
                                                        ),
                                                        Text(main['dateActivity']!),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                      const Icon(
                                                          Iconsax.timer,
                                                          size: 15,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                            main['timeActivity']!,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                       const Icon(
                                                          Iconsax.location,
                                                          size: 15,
                                                        ),
                                                        Text(main['location']!),
                                                        const Spacer(),
                                                        const Icon(Iconsax.eye, size: 20, color: Colors.orange),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                       const Icon(
                                                          Iconsax.dollar_circle,
                                                          size: 15,
                                                        ),
                                                        Text(main['payment']!),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: AnimatedButton.strip(
                                        textStyle: const TextStyle(
                                          color: Colors.black12,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        stripColor: backgroundColorDark,
                                        backgroundColor: Colors.black12,
                                        gradient: const LinearGradient(
                                          colors: [
                                            backgroundColorDark,
                                            Colors.deepPurpleAccent
                                          ],
                                        ),
                                        selectedGradientColor:
                                            const LinearGradient(
                                          colors: [
                                            Colors.deepPurpleAccent,
                                            backgroundColorDark
                                          ],
                                        ),
                                        text: _buttonTextAdd[index] ?? 'Enviar',
                                        isReverse: true,
                                        selectedTextColor: Colors.white70,
                                        stripTransitionType:
                                            StripTransitionType.LEFT_TO_RIGHT,
                                        selectedBackgroundColor:
                                            Colors.deepOrange,
                                        onPress: () {},
                                        onChanges: (change) {
                                          setState(() {
                                            _buttonTextAdd[index] =
                                                change ? 'Cancelar' : 'Enviar';
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ):  Image.asset("assets/Backgrounds/notFound.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
