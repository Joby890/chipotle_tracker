import 'package:shared_preferences/shared_preferences.dart';

class TrackerListPersistence {
  static const String TRACKER_KEY = "tracker_list";

  final SharedPreferences _sharedPreferences;

  const TrackerListPersistence(this._sharedPreferences);

  List<String> getAllTrackers() {
    if(_sharedPreferences.containsKey(TRACKER_KEY)) {
      return _sharedPreferences.getStringList(TRACKER_KEY);
    }
    return [];
  }

  void addTracker(String tracker) {
    List<String> allTackers = getAllTrackers();
    allTackers.add(tracker);
    _sharedPreferences.setStringList(TRACKER_KEY, allTackers);
  }
}
