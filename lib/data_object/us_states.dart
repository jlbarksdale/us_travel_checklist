import 'package:flutter/cupertino.dart';
import 'package:us_travel_checklist/util/database.dart';
import 'package:us_travel_checklist/util/us_states.dart';

class States extends ChangeNotifier {
  static final stateMap = US_STATES;
  static final stateIcons = STATE_ICONS;

  List<StateValue> _states = [];

  final Database db = Database();

  States() {
    bool visitedValue;
    String keyString;
    for (String key in stateMap.keys) {
      keyString = key.toString();
      visitedValue = db.getSavedState(keyString);
      _states.add(StateValue(keyString, visitedValue, stateIcons[keyString]!));
    }
    //notifyListeners();
  }

  String getStateName(int index) {
    return _states.elementAt(index).stateName;
  }

  bool getVisitedValue(int index) {
    return _states.elementAt(index).visited;
  }

  IconData getStateIcon(int index) {
    return _states.elementAt(index).iconData;
  }

  void setVisited(int index) {
    _states.elementAt(index).visited = !_states.elementAt(index).visited;
    db.saveStateVisited(
        _states.elementAt(index).stateName, _states.elementAt(index).visited);
    notifyListeners();
  }
}

class StateValue {
  String stateName;
  bool visited;
  IconData iconData;

  StateValue(this.stateName, this.visited, this.iconData);
}
