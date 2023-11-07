import 'package:flutter/material.dart';
import 'package:war_docs/route_generator.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const warDocs());
}

// ignore: camel_case_types
class warDocs extends StatelessWidget {
  const warDocs({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return MaterialApp(
      title: "Warcraft 3 Board Game Docs",
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(0, 38, 80, 100),
          fontFamily: 'Poppins'),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
