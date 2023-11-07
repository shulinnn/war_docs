import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:war_docs/routes/landing_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return PageTransition(
            child: const LandingPage(),
            type: PageTransitionType.leftToRightWithFade);
/*         return MaterialPageRoute(builder: (_) => const LandingPage()); */
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
