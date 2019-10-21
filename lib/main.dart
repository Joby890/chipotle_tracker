import 'package:chipotle_tracker/loading/LoadingPage.dart';
import 'package:chipotle_tracker/tracker_list/tracker_list_page.dart';
import 'package:chipotle_tracker/tracker_list/tracker_list_persistence.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  SharedPreferences _preferences;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((preferences) {
      setState(() {
        _preferences = preferences;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chipotle Tracker Tittle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _preferences == null ? new LoadingPage() : new TrackerListPage(
          new TrackerListPersistence(_preferences)),
    );
  }
}