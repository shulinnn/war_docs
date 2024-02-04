class Board {
  int? id;
  String? name;
  String? image;
  int? teamCount;
  String? createdAt;
  String? updatedAt;

  Board(
      {this.id,
      this.name,
      this.image,
      this.teamCount,
      this.createdAt,
      this.updatedAt});

  Board.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    teamCount = json['team_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['team_count'] = teamCount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
