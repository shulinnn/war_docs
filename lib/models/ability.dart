class Ability {
  int? id;
  String? name;
  String? description;
  String? icon;
  int? heroId;
  int? raceId;
  String? createdAt;
  String? updatedAt;

  Ability(
      {this.id,
      this.name,
      this.description,
      this.icon,
      this.heroId,
      this.raceId,
      this.createdAt,
      this.updatedAt});

  Ability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    icon = json['icon'];
    heroId = json['heroId'];
    raceId = json['raceId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['icon'] = icon;
    data['heroId'] = heroId;
    data['raceId'] = raceId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
