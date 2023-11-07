class Race {
  int? id;
  String? raceIcon;
  String? raceName;
  RaceSpell? raceSpell;

  Race({this.id, this.raceIcon, this.raceName, this.raceSpell});

  Race.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    raceIcon = json['race_icon'];
    raceName = json['race_name'];
    raceSpell = (json['RaceSpell'] != null
        ? RaceSpell.fromJson(json['RaceSpell'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['race_icon'] = this.raceIcon;
    data['race_name'] = this.raceName;
    if (this.raceSpell != null) {
      data['RaceSpell'] = this.raceSpell!.toJson();
    }
    return data;
  }
}

class RaceSpell {
  int? id;
  String? spellName;
  String? spellIcon;
  String? spellDescription;

  RaceSpell(
      {required this.id,
      required this.spellName,
      required this.spellIcon,
      required this.spellDescription});

  RaceSpell.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    spellName = json['spell_name'];
    spellIcon = json['spell_icon'];
    spellDescription = json['spell_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['spell_name'] = this.spellName;
    data['spell_icon'] = this.spellIcon;
    data['spell_description'] = this.spellDescription;
    return data;
  }
}
