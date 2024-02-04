class CharacterSpell {
  int? id;
  String? spellName;
  String? spellIcon;
  String? spellDescription;
  String? createdAt;
  String? updatedAt;
  int? heroId;

  CharacterSpell(
      {this.id,
      this.spellName,
      this.spellIcon,
      this.spellDescription,
      this.createdAt,
      this.updatedAt,
      this.heroId});

  CharacterSpell.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    spellName = json['spell_name'];
    spellIcon = json['spell_icon'];
    spellDescription = json['spell_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    heroId = json['heroId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['spell_name'] = spellName;
    data['spell_icon'] = spellIcon;
    data['spell_description'] = spellDescription;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['heroId'] = heroId;
    return data;
  }
}
