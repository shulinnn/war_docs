class Card {
  int? id;
  String? name;
  String? description;
  String? icon;
  int? timesInDeck;
  String? createdAt;
  String? updatedAt;

  Card(
      {this.id,
      this.name,
      this.description,
      this.icon,
      this.timesInDeck,
      this.createdAt,
      this.updatedAt});

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    icon = json['icon'];
    timesInDeck = json['times_in_deck'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['icon'] = icon;
    data['times_in_deck'] = timesInDeck;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
