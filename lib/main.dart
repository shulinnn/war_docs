import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:war_docs/providers/provider.dart';
import 'package:war_docs/route_generator.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => RaceProvider(),
      ),
    ],
    child: const WarDocs(),
  ));
}

class WarDocs extends StatelessWidget {
  const WarDocs({super.key});

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
