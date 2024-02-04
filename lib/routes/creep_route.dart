import 'package:flutter/material.dart';
import 'package:war_docs/layouts/master_drawer.dart';
import 'package:war_docs/services/api_service.dart';

class CreepRoute extends StatefulWidget {
  const CreepRoute({super.key, required this.creepId});

  final int creepId;

  @override
  State createState() => _StateCreepRoute();
}

class _StateCreepRoute extends State<CreepRoute> {
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
                future: ApiService().getCreep(widget.creepId),
                builder: (((context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 78),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              ApiService().getImage(snapshot.data?.icon),
                              height: 128,
                              width: 128,
                            ),
                            Text(
                              snapshot.data!.name.toString(),
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            Chip(
                              padding: const EdgeInsets.only(
                                left: 2,
                                right: 2,
                              ),
                              label: Text(
                                "Level ${snapshot.data?.level}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 171, 221, 9),
                            ),
                            Chip(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              label: Text(
                                "Damage ${snapshot.data?.damage}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 199, 29, 17),
                            ),
                            Chip(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              label: Text(
                                "Health ${snapshot.data?.health}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            Chip(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              label: Text(
                                "${snapshot.data?.unitType}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 50, 26, 29),
                            ),
                            Chip(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              label: Text(
                                "${snapshot.data?.attackType}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 206, 115, 125),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.item?.length,
                              itemBuilder: ((context, index) => Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16,
                                        left: 16,
                                        right: 16,
                                        bottom: 16),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(ApiService().getImage(
                                                snapshot
                                                    .data?.item?[index].icon)),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              snapshot.data!.item![index].name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: Text(
                                              snapshot.data!.item![index]
                                                  .description
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))),
                        )
                      ],
                    ),
                  );
                })))));
  }
}
