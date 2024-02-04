import 'package:war_docs/models/ability.dart';

class Race {
  int? id;
  String? name;
  String? icon;
  String? createdAt;
  String? updatedAt;
  Ability? ability;

  Race(
      {this.id,
      this.name,
      this.icon,
      this.createdAt,
      this.updatedAt,
      this.ability});

  Race.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ability =
        json['ability'] != null ? Ability.fromJson(json['ability']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (ability != null) {
      data['ability'] = ability!.toJson();
    }
    return data;
  }
}
