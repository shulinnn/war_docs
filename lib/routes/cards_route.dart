import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:war_docs/layouts/master_drawer.dart';
import 'package:war_docs/providers/provider.dart';
import 'package:war_docs/services/api_service.dart';

class CardsRoute extends StatefulWidget {
  const CardsRoute({super.key});

  @override
  State<StatefulWidget> createState() => _StateCards();
}

class _StateCards extends State<CardsRoute> {
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
                future: ApiService()
                    .getCards(Provider.of<RaceProvider>(context).race as int),
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
                                          height: 4,
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
