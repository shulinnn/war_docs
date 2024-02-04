import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:war_docs/layouts/master_drawer.dart';
import 'package:war_docs/providers/provider.dart';
import 'package:war_docs/services/api_service.dart';
import 'package:war_docs/models/race.dart';

class RaceLobbyRoute extends StatefulWidget {
  const RaceLobbyRoute({super.key});

  @override
  State createState() => _RaceLobbyRouteState();
}

class _RaceLobbyRouteState extends State<RaceLobbyRoute> {
  late Future<Race> raceModel;
  @override
  void dispose() {
    super.dispose();
  }

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
                    .getRace(Provider.of<RaceProvider>(context).race as int),
                builder: ((context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        ApiService().getImage(snapshot.data?.icon),
                        width: MediaQuery.of(context).size.width * 0.6,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Text(
                        snapshot.data!.name.toString(),
                        style: const TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Image.network(
                        ApiService().getImage(snapshot.data!.ability!.icon),
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Text(
                        snapshot.data!.ability!.name.toString(),
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
                          snapshot.data!.ability!.description.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030,
                      ),
                    ],
                  );
                }))));
  }
}
