import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:war_docs/db/types.dart';
import 'package:http/http.dart' as http;

Future<List<Race>> fetchRaces() async {
  final response = await http.get(Uri.parse("http://10.0.0.133:3000/races"));

  if (response.statusCode == 200) {
    List<Race> res = [];
    (json.decode(response.body.toString()).forEach((el) {
      res.add(Race.fromJson(el));
    }));

    return res;

    /// here we actually parse the data to our models..
  } else {
    throw Exception('Failed to load Races');
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State createState() => _State();
}

class _State extends State<LandingPage> {
  late Future<List<Race>> futureRaces;
  @override
  void initState() {
    super.initState();
    futureRaces = fetchRaces();
  }

  void didPushButton() {
    Navigator.pushNamed(context, "/race_lobby/human");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                color: Color(0xff002650),
                image: DecorationImage(
                    image: AssetImage("assets/bg.jpg"),
                    fit: BoxFit.cover,
                    opacity: 0.1)),
            constraints: const BoxConstraints.expand(),
            child: FutureBuilder(
                future: fetchRaces(),
                builder: ((context, AsyncSnapshot<List<Race>> raceSnapshot) {
                  var data = raceSnapshot.data;
                  if (data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CarouselSlider(
                      items: data
                          .map((e) => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "http://10.0.0.133:3000/${e.raceIcon}",
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    e.raceName.toString(),
                                    style: const TextStyle(
                                        fontSize: 36,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 32),
                                  Image.network(
                                    "http://10.0.0.133:3000/${e.raceSpell!.spellIcon}",
                                    width: 64,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    e.raceSpell!.spellName.toString(),
                                    style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 32),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: Text(
                                      e.raceSpell!.spellDescription.toString(),
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(height: 64),
                                  ElevatedButton(
                                      onPressed: () {
                                        didPushButton();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 64, right: 64),
                                        child: Text("Zvolit rasu"),
                                      ))
                                ],
                              ))
                          .toList(),
                      options: CarouselOptions());
                }))));
  }
}

/* Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(i[0]),
                        width: 240,
                        height: 240,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        i[1],
                        style: const TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 32),
                      Image(image: AssetImage(i[2])),
                      const SizedBox(height: 32),
                      Text(
                        i[3],
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          i[4],
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 64),
                      ElevatedButton(
                          onPressed: () {
                            didPushButton();
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 64, right: 64),
                            child: Text("Zvolit rasu"),
                          ))
                    ],
                  ), */