import 'package:flutter/material.dart';

class MasterDrawer extends StatelessWidget {
  const MasterDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff002650), Color(0xff071627)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: ListView(
          shrinkWrap: false,
          padding: const EdgeInsets.only(left: 32, right: 32),
          children: [
            const Divider(color: Color(0x10FFFFFF), height: 1, thickness: 1),
            ListTile(
                title: const Text(
                  "Lobby",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/race_lobby",
                  );
                }),
            ListTile(
                title: const Text(
                  "Hrdinové",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/heroes",
                  );
                }),
            ListTile(
                title: const Text(
                  "Obchod",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/shop",
                  );
                }),
            ListTile(
                title: const Text(
                  "Neutrální obchod",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/shop-neutral",
                  );
                }),
            ListTile(
                title: const Text(
                  "Taverna",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/tavern",
                  );
                }),
            ListTile(
                title: const Text(
                  "Mapy",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/maps",
                  );
                }),
            ListTile(
                title: const Text(
                  "Karty",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/cards",
                  );
                }),
            ListTile(
                title: const Text(
                  "Creepy",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/creeps",
                  );
                }),
            ListTile(
                title: const Text(
                  "Budovy",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/buildings",
                  );
                }),
            const Divider(color: Color(0x10FFFFFF), height: 1, thickness: 1),
            ListTile(
                title: const Text(
                  "Základní pravidla",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(
                    context,
                    "/base_rules",
                  );
                }),
            ListTile(
              title: const Text(
                "Změnit rasu",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, "/");
              },
            )
          ],
        ),
      ),
    );
  }
}
