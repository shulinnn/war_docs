import 'package:war_docs/models/item.dart';

class Creep {
  int? id;
  String? name;
  String? icon;
  int? level;
  int? health;
  int? damage;
  String? attackType;
  String? unitType;
  String? createdAt;
  String? updatedAt;
  List<Item>? item;

  Creep(
      {this.id,
      this.name,
      this.icon,
      this.level,
      this.health,
      this.damage,
      this.attackType,
      this.unitType,
      this.createdAt,
      this.updatedAt,
      this.item});

  Creep.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    level = json['level'];
    health = json['health'];
    damage = json['damage'];
    attackType = json['attack_type'];
    unitType = json['unit_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(Item.fromJson(v));
      });
    }
  }
}
