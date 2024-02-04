import 'package:flutter/foundation.dart';

class RaceProvider extends ChangeNotifier {
  int? _race;
  int? get race => _race;

  void setRace(int? race) {
    _race = race;
    notifyListeners();
  }
}
