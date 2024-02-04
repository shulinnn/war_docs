import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:war_docs/routes/base_rules_route.dart';
import 'package:war_docs/routes/buildings_route.dart';
import 'package:war_docs/routes/cards_route.dart';
import 'package:war_docs/routes/creep_route.dart';
import 'package:war_docs/routes/creeps_route.dart';
import 'package:war_docs/routes/error_route.dart';
import 'package:war_docs/routes/heroes.dart';
import 'package:war_docs/routes/landing_route.dart';
import 'package:war_docs/routes/map_route.dart';
import 'package:war_docs/routes/maps_route.dart';
import 'package:war_docs/routes/neutral_shop_route.dart';
import 'package:war_docs/routes/race_lobby_route.dart';
import 'package:war_docs/routes/hero_route.dart';
import 'package:war_docs/routes/shop_route.dart';
import 'package:war_docs/routes/tavern.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
            child: const LandingRoute(), type: PageTransitionType.leftToRight);
      case '/race_lobby':
        return PageTransition(
            child: const RaceLobbyRoute(), type: PageTransitionType.fade);
      case "/base_rules":
        return PageTransition(
            child: const BaseRulesRoute(), type: PageTransitionType.fade);
      case "/heroes":
        return PageTransition(
            child: const HeroesRoute(), type: PageTransitionType.fade);
      case "/maps":
        return PageTransition(
            child: const MapsRoute(), type: PageTransitionType.fade);
      case "/cards":
        return PageTransition(
            child: const CardsRoute(), type: PageTransitionType.fade);
      case "/shop":
        return PageTransition(
            child: const ShopRoute(), type: PageTransitionType.fade);
      case "/shop-neutral":
        return PageTransition(
            child: const NeutralShopRoute(), type: PageTransitionType.fade);
      case "/tavern":
        return PageTransition(
            child: const TavernRoute(), type: PageTransitionType.fade);
      case "/buildings":
        return PageTransition(
            child: const BuildingsRoute(), type: PageTransitionType.fade);
      case "/creeps":
        return PageTransition(
            child: const CreepsRoute(), type: PageTransitionType.fade);
      case "/hero":
        return PageTransition(
            child: HeroRoute(
              raceId: settings.arguments as int,
            ),
            type: PageTransitionType.fade);
      case "/map":
        return PageTransition(
            child: MapRoute(
              mapId: settings.arguments as int,
            ),
            type: PageTransitionType.fade);
      case "/creep":
        return PageTransition(
            child: CreepRoute(
              creepId: settings.arguments as int,
            ),
            type: PageTransitionType.fade);
/*       case "/hero":
      return PageTransition(child: HeroRoute(heroName: heroName, raceName: raceName), type: PageTransitionType.fade) */
      default:
        return PageTransition(
            child: const ErrorRoute(), type: PageTransitionType.leftToRight);
    }
  }
}
