class Item {
  int? id;
  String? name;
  String? description;
  String? icon;
  int? priceGold;
  int? priceWood;
  String? type;
  String? obtainability;
  String? createdAt;
  String? updatedAt;

  Item(
      {this.id,
      this.name,
      this.description,
      this.icon,
      this.priceGold,
      this.priceWood,
      this.type,
      this.obtainability,
      this.createdAt,
      this.updatedAt});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    icon = json['icon'];
    priceGold = json['price_gold'];
    priceWood = json['price_wood'];
    type = json['type'];
    obtainability = json['obtainability'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['icon'] = icon;
    data['price_gold'] = priceGold;
    data['price_wood'] = priceWood;
    data['type'] = type;
    data['obtainability'] = obtainability;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
