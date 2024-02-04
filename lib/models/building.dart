class Building {
  int? id;
  String? name;
  String? icon;
  String? description;
  int? priceGold;
  int? priceWood;
  String? createdAt;
  String? updatedAt;
  int? raceId;

  Building(
      {this.id,
      this.name,
      this.icon,
      this.description,
      this.priceGold,
      this.priceWood,
      this.createdAt,
      this.updatedAt,
      this.raceId});

  Building.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
    priceGold = json['priceGold'];
    priceWood = json['priceWood'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    raceId = json['raceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['description'] = description;
    data['priceGold'] = priceGold;
    data['priceWood'] = priceWood;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['raceId'] = raceId;
    return data;
  }
}
