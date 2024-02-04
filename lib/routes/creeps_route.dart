import 'package:flutter/material.dart';
import 'package:war_docs/layouts/master_drawer.dart';
import 'package:war_docs/services/api_service.dart';

class CreepsRoute extends StatefulWidget {
  const CreepsRoute({super.key});

  @override
  State createState() => _StateCreepsRoute();
}

class _StateCreepsRoute extends State<CreepsRoute> {
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
                future: ApiService().getCreeps(),
                builder: ((context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 78),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Wrap(
                            direction: Axis.vertical,
                            spacing: 24,
                            alignment: WrapAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed("/creep",
                                          arguments: snapshot.data?[index].id);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.network(
                                                ApiService().getImage(
                                                    snapshot.data?[index].icon),
                                                width: 64,
                                                height: 64),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Text(
                                              snapshot.data![index].name
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Wrap(
                                            spacing:
                                                8.0, // gap between adjacent chips
                                            direction: Axis.horizontal,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: [
                                              Chip(
                                                padding: const EdgeInsets.only(
                                                  left: 2,
                                                  right: 2,
                                                ),
                                                label: Text(
                                                  "Level ${snapshot.data?[index].level}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 171, 221, 9),
                                              ),
                                              Chip(
                                                padding: const EdgeInsets.only(
                                                    left: 2, right: 2),
                                                label: Text(
                                                  "Damage ${snapshot.data?[index].damage}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 199, 29, 17),
                                              ),
                                              Chip(
                                                padding: const EdgeInsets.only(
                                                    left: 2, right: 2),
                                                label: Text(
                                                  "Health ${snapshot.data?[index].health}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                                backgroundColor: Colors.green,
                                              ),
                                              Chip(
                                                padding: const EdgeInsets.only(
                                                    left: 2, right: 2),
                                                label: Text(
                                                  "${snapshot.data?[index].unitType}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 50, 26, 29),
                                              ),
                                              Chip(
                                                padding: const EdgeInsets.only(
                                                    left: 2, right: 2),
                                                label: Text(
                                                  "${snapshot.data?[index].attackType}",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 206, 115, 125),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          ));
                }))));
  }
}
