import 'package:war_docs/models/ability.dart';

class Character {
  int? id;
  String? name;
  String? icon;
  int? move;
  int? damage;
  int? health;
  int? cost;
  String? attackType;
  int? raceId;
  String? createdAt;
  String? updatedAt;
  List<Ability>? ability;

  Character(
      {this.id,
      this.name,
      this.icon,
      this.move,
      this.damage,
      this.health,
      this.cost,
      this.attackType,
      this.raceId,
      this.createdAt,
      this.updatedAt,
      this.ability});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    move = json['move'];
    damage = json['damage'];
    health = json['health'];
    cost = json['cost'];
    attackType = json['attack_type'];
    raceId = json['raceId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ability'] != null) {
      ability = <Ability>[];
      json['ability'].forEach((v) {
        ability!.add(Ability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['move'] = move;
    data['damage'] = damage;
    data['health'] = health;
    data['cost'] = cost;
    data['attack_type'] = attackType;
    data['raceId'] = raceId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (ability != null) {
      data['ability'] = ability!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
