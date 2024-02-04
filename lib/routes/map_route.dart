import 'package:flutter/material.dart';
import 'package:war_docs/layouts/master_drawer.dart';
import 'package:war_docs/services/api_service.dart';

class MapRoute extends StatefulWidget {
  const MapRoute({super.key, required this.mapId});

  final int mapId;

  @override
  State createState() => _StateMapRoute();
}

class _StateMapRoute extends State<MapRoute> {
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
                future: ApiService().getMap(widget.mapId),
                builder: (((context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, right: 32),
                      child: Column(
                        children: [
                          Image.network(
                              ApiService().getImage(snapshot.data?.image))
                        ],
                      ),
                    ),
                  );
                })))));
  }
}
