import 'package:flutter/material.dart';
import 'package:war_docs/layouts/master_drawer.dart';

class BaseRulesRoute extends StatelessWidget {
  const BaseRulesRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: const MasterDrawer(),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Builder(
              builder: (context) => FloatingActionButton.small(
                onPressed: () => {Scaffold.of(context).openDrawer()},
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
            decoration: const BoxDecoration(
                color: Color(0xff002650),
                image: DecorationImage(
                    image: AssetImage("assets/bg.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.1)),
            alignment: Alignment.center,
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 32, right: 32, top: 64, bottom: 64),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Text(
                        "Přehled tahů",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32, bottom: 32),
                      child: Text(
                        "1. Fáze",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Wrap(direction: Axis.vertical, spacing: 6, children: [
                      Text(
                        "Pohyb",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Oprava budov",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(top: 32, bottom: 32),
                      child: Text(
                        "2. Fáze",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Wrap(direction: Axis.vertical, spacing: 6, children: [
                      Text(
                        "Těžba",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Stavba jednotek / hrdinů",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Stavba budov",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Útok",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Tech",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(top: 32, bottom: 32),
                      child: Text(
                        "3. Fáze",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Wrap(direction: Axis.vertical, spacing: 6, children: [
                      Text(
                        "Braní karet",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Použití karty",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Vylepšení zdokonalení (Obchod / Kovárna)",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Použití zdokonalení (Obchod / Kovárna)",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ]),
                    Padding(
                      padding: EdgeInsets.only(top: 32, bottom: 32),
                      child: Text(
                        "4. Fáze",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Wrap(direction: Axis.vertical, spacing: 6, children: [
                      Text(
                        "Koupení předmětu",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Použití předmětu",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ]),
                  ],
                ),
              ),
            )));
  }
}
