import 'package:flutter/material.dart';
import 'package:war_docs/layouts/master_drawer.dart';
import 'package:war_docs/models/character.dart';
import 'package:war_docs/services/api_service.dart';

class HeroRoute extends StatefulWidget {
  const HeroRoute({super.key, required this.raceId});

  final int raceId;

  @override
  State createState() => _StateHeroRoute();
}

class _StateHeroRoute extends State<HeroRoute> {
  late Future<Character> futureHero;

  @override
  void initState() {
    super.initState();
  }

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
            child: FutureBuilder(
                future: ApiService().getHero(widget.raceId),
                builder: (((context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 74),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 32, right: 32),
                            child: Row(
                              children: [
                                Image.network(
                                    ApiService().getImage(snapshot.data?.icon)),
                                const SizedBox(
                                  width: 32,
                                ),
                                Text(
                                  snapshot.data!.name.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 32, right: 32, top: 32),
                            child: Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      color: Color(0xff2F95DC)),
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 2, bottom: 2),
                                  child: Text(
                                    snapshot.data!.attackType.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      color: Color(0xffE6A201)),
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 2, bottom: 2),
                                  child: Row(
                                    children: [
                                      Text(
                                        snapshot.data!.cost.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Image.asset("assets/gold_icon.png")
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          ...snapshot.data!.ability!
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32,
                                        right: 32,
                                        bottom: 16,
                                        top: 32),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.network(
                                                ApiService().getImage(e.icon)),
                                            const SizedBox(
                                              width: 32,
                                            ),
                                            Text(
                                              e.name.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16, bottom: 8),
                                          child: Text(
                                            e.description.toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                  );
                })))));
  }
}
