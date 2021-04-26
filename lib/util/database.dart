import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:us_travel_checklist/data_object/us_states.dart';

class Database {
  final String databaseName = 'states';

  Database();

  Future<void> setup() async {
    await Hive.initFlutter();
    await Hive.openBox(databaseName);

    if (Hive.box(databaseName).isEmpty && Hive.box(databaseName).length != 50) {
      await Hive.box(databaseName).clear();
      for (String key in States.stateMap.keys) {
        saveStateVisited(key.toString(), false);
      }
    }
  }

  void saveStateVisited(String stateName, bool value) {
    Hive.box(databaseName).put(stateName.toLowerCase(), value);
  }

  bool getSavedState(String stateName) {
    return Hive.box(databaseName).get(stateName.toLowerCase());
  }
}
