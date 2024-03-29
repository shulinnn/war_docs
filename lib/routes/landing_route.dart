import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:war_docs/providers/provider.dart';
import 'package:war_docs/services/api_service.dart';
import 'package:war_docs/models/race.dart';

class LandingRoute extends StatefulWidget {
  const LandingRoute({super.key});

  @override
  State createState() => _LandingRouteState();
}

class _LandingRouteState extends State<LandingRoute> {
  late Future<List<Race>> raceModel;
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Navigator.of(context).canPop()
              ? FloatingActionButton.small(
                  onPressed: () => {Navigator.of(context).pop()},
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 24,
                  ),
                )
              : null,
        ),
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
              future: ApiService().getRaces(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return PageView.builder(
                    itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        ApiService().getImage(snapshot.data?[index].icon),
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Text(
                        snapshot.data![index].name.toString(),
                        style: const TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Image.network(
                        ApiService()
                            .getImage(snapshot.data![index].ability!.icon),
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Text(
                        snapshot.data![index].ability!.name.toString(),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          snapshot.data![index].ability!.description.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            var race = context.read<RaceProvider>();
                            race.setRace(snapshot.data![index].id);
                            Navigator.pushNamed(context, "/race_lobby");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 64, right: 64),
                            child: Text(
                              "Zvolit rasu",
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
                  );
                });
              },
            )));
  }
}
