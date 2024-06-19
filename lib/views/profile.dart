import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        actions: [],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // COLUMN THAT WILL CONTAIN THE PROFILE
          const Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Grupo Travesia",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("@grupo.travesia"),
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Completa tu perfil",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "(1/3)",
                style: TextStyle(
                  color: mainColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: Container(
                  height: 7,
                  margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ? mainColor : Colors.black12,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 190,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    color: mainColor,
                    elevation: 2,
                    shadowColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(
                            color: backgroundColorLight,
                            card.icon,
                            size: 40,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            style: const TextStyle(
                                color: backgroundColorLight, fontSize: 17),
                            card.title,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text(
                              card.buttonText,
                              style: const TextStyle(color: mainColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletionCards.length,
            ),
          ),
          ...List.generate(
            customListTiles.length,
            (index) {
              final tile = customListTiles[index];
              return Card(color: mainColor,
                  child: ListTile(
                    leading: Icon(tile.icon),
                    title: Text(tile.title),
                    trailing: const Icon(Icons.chevron_right),
                  ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;

  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Foto de Perfil",
    icon: Iconsax.camera,
    buttonText: "Cargar",
  ),
  ProfileCompletionCard(
    title: "Repertorio Musical",
    icon: Iconsax.music,
    buttonText: "Agregar",
  ),
  ProfileCompletionCard(
    title: "Redes Sociales",
    icon: Iconsax.people,
    buttonText: "Agregar",
  ),
  ProfileCompletionCard(
    title: "Instrumentos",
    icon: Iconsax.keyboard,
    buttonText: "Agregar",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;

  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Actividades",
  ),
  CustomListTile(
    icon: Iconsax.microphone,
    title: "Musicos",
  ),
  CustomListTile(
    title: "Notificaciones",
    icon: Iconsax.notification,
  ),
  CustomListTile(
    title: "Cerrar Sesion",
    icon: Iconsax.logout,
  ),
];
