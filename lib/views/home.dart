import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<int, String> _buttonTextAdd = {};
  final List<Map<String, String>> imgList = [
    {'image': 'travesia.jpg', 'title': 'Grupo Travesia'},
    {'image': 'saul.jpg', 'title': 'Dinastia'},
    {'image': 'arthul.jpg', 'title': 'Arthul'},
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final List<String> items =
        List<String>.generate(10, (i) => "Item ${i + 1}");

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: BottomShapeClipper(),
            child: Container(
              color: backgroundColorDark,
              height: screenHeight * 0.5,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Row(
                    children: <Widget>[

                      Spacer(
                        flex: 8,
                      ),
                      Icon(
                        Iconsax.notification,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(left: 40.0, right: 8,bottom: 10),
                      child: SizedBox(
                        width: 300,
                        height: 35,
                        child: TextField(
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
                            fillColor: backgroundColorDark,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Icon(
                        Iconsax.filter,
                        color: Colors.white70,
                      ),
                    ),
                  ],
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
                            width: 305,
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.only(left: 13, right: 13,top: 4,bottom: 4),
                              decoration: const BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child:   Row(
                                children: [
                                  Text(
                                    item['title']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Iconsax.star1,
                                    color: Colors.yellow,
                                  ),
                                  const Text(
                                    "4.7",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),
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
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    color: backgorundBody,
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
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
                                    Container(
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Backgrounds/placeholder.jpg'),
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
                                                    Colors.green,
                                                    Colors.blue,
                                                    Colors.indigo,
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Card(
                                                elevation: 7,
                                                color: Colors.lightGreen,
                                                child: Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text(
                                                      "Pianista",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white70),
                                                    )),
                                              ))
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
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
                                                  "Grupo Travesia",
                                                  style: TextStyle(
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
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 16.0, right: 16.0, bottom: 5),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("Bachata"),
                                              Spacer(),
                                              Icon(
                                                Iconsax.instagram,
                                                color: Colors.brown,
                                              ),
                                              Text(" "),
                                              Icon(
                                                Iconsax.play,
                                                color: Colors.redAccent,
                                              ),
                                            ],
                                          ),
                                          Divider(color: Colors.grey)
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
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
                                                        Icon(
                                                          Iconsax.calendar,
                                                          size: 15,
                                                        ),
                                                        Text("Sabado "),
                                                        Text("18/05/2024"),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Iconsax.timer,
                                                          size: 15,
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                            "9:00pm a 12:00pm",
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
                                                        Icon(
                                                          Iconsax.location,
                                                          size: 15,
                                                        ),
                                                        Text("Santo Domingo"),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Iconsax.dollar_circle,
                                                          size: 15,
                                                        ),
                                                        Text("2,500.00"),
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
                ),
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
