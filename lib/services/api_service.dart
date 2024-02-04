import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:war_docs/constants.dart';
import 'package:war_docs/models/board.dart';
import 'package:war_docs/models/building.dart';
import 'package:war_docs/models/card.dart';
import 'package:war_docs/models/character.dart';
import 'package:war_docs/models/creep.dart';
import 'package:war_docs/models/item.dart';
import 'package:war_docs/models/race.dart';

class ApiService {
  String getImage(String? imageUrl) {
    return "${Constants.baseApiUrl}/assets/${imageUrl.toString()}";
  }

  Future<List<Race>> getRaces() async {
    var response = await http.get(Uri.parse("${Constants.baseApiUrl}/races"));
    if (response.statusCode == 200) {
      List<Race> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Race.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<Race> getRace(int raceId) async {
    var response =
        await http.get(Uri.parse("${Constants.baseApiUrl}/race/$raceId"));
    if (response.statusCode == 200) {
      return Race.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<List<Character>> getHeroes(int raceId) async {
    var response = await http
        .get(Uri.parse("${Constants.baseApiUrl}/heroes/race/$raceId"));
    if (response.statusCode == 200) {
      List<Character> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Character.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<List<Character>> getTavernHeroes() async {
    var response = await http
        .get(Uri.parse("${Constants.baseApiUrl}/heroes/race/neutral"));
    if (response.statusCode == 200) {
      List<Character> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Character.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<Character> getHero(int heroId) async {
    var response =
        await http.get(Uri.parse("${Constants.baseApiUrl}/hero/$heroId"));
    if (response.statusCode == 200) {
      return Character.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<List<Board>> getMaps() async {
    var response = await http.get(Uri.parse("${Constants.baseApiUrl}/maps"));
    if (response.statusCode == 200) {
      List<Board> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Board.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<Board> getMap(int mapId) async {
    var response =
        await http.get(Uri.parse("${Constants.baseApiUrl}/map/$mapId"));
    if (response.statusCode == 200) {
      return Board.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<List<Card>> getCards(int raceId) async {
    var response =
        await http.get(Uri.parse("${Constants.baseApiUrl}/cards/race/$raceId"));
    if (response.statusCode == 200) {
      List<Card> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Card.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<List<Item>> getItems(int raceId) async {
    var response =
        await http.get(Uri.parse("${Constants.baseApiUrl}/items/race/$raceId"));
    if (response.statusCode == 200) {
      List<Item> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Item.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<List<Item>> getNeutralItems() async {
    var response =
        await http.get(Uri.parse("${Constants.baseApiUrl}/items/race/neutral"));
    if (response.statusCode == 200) {
      List<Item> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Item.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<List<Creep>> getCreeps() async {
    var response = await http.get(Uri.parse("${Constants.baseApiUrl}/creeps"));
    if (response.statusCode == 200) {
      List<Creep> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Creep.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<Creep> getCreep(int creepId) async {
    var response =
        await http.get(Uri.parse("${Constants.baseApiUrl}/creep/$creepId"));
    if (response.statusCode == 200) {
      return Creep.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception("API response failed.");
    }
  }

  Future<List<Building>> getBuildings(int raceId) async {
    var response = await http
        .get(Uri.parse("${Constants.baseApiUrl}/buildings/race/$raceId"));
    if (response.statusCode == 200) {
      List<Building> data = [];
      (json.decode(response.body.toString()).forEach((el) {
        data.add(Building.fromJson(el));
      }));
      return data;
    } else {
      throw Exception("API response failed.");
    }
  }

/*   Future<Creep> getCreepWithItems() async {
    var response =
        await http.get(Uri.parse("${Constants.baseApiUrl}/map/$mapId"));
    if (response.statusCode == 200) {
      return Creep.fromJson(json.decode(response.body.toString()));
    } else {
      throw Exception("API response failed.");
    }
  } */
}
