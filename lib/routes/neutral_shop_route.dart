import 'package:flutter/material.dart';
import 'package:war_docs/layouts/master_drawer.dart';
import 'package:war_docs/services/api_service.dart';

class NeutralShopRoute extends StatefulWidget {
  const NeutralShopRoute({super.key});

  @override
  State<StatefulWidget> createState() => _StateNeutralShop();
}

class _StateNeutralShop extends State<NeutralShopRoute> {
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
                future: ApiService().getNeutralItems(),
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
/*                                       Navigator.of(context).pushNamed("/map",
                                          arguments: snapshot.data?[index].id); */
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.network(ApiService().getImage(
                                                snapshot.data?[index].icon)),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              snapshot.data![index].name
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16)),
                                                  color: Color(0xffE6A201)),
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 2,
                                                  bottom: 2),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data![index].priceGold
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Image.asset(
                                                      "assets/gold_icon.png")
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16)),
                                                  color: Color.fromARGB(
                                                      255, 1, 230, 81)),
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 2,
                                                  bottom: 2),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    snapshot
                                                        .data![index].priceWood
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Image.asset(
                                                      "assets/lumber_icon.png")
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            snapshot.data?[index].type ==
                                                    "Consumable"
                                                ? Container(
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    16)),
                                                        color: Color.fromARGB(
                                                            255, 64, 97, 194)),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8,
                                                            right: 8,
                                                            top: 2,
                                                            bottom: 2),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data![index].type
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    16)),
                                                        color: Color.fromARGB(
                                                            255, 183, 64, 194)),
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8,
                                                            right: 8,
                                                            top: 2,
                                                            bottom: 2),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data![index].type
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          snapshot.data![index].description
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        )
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
