import 'package:chipotle_tracker/tracker_details/tracker_detail_page.dart';
import 'package:chipotle_tracker/tracker_list/AddTrackerForm.dart';
import 'package:chipotle_tracker/tracker_list/tracker_list_persistence.dart';
import 'package:flutter/material.dart';

class TrackerItem extends StatelessWidget {
  final String _trackerId;

  const TrackerItem(this._trackerId);

  void Function() openTracker(context) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new TrackerDetailPage(_trackerId)),
      );
    };

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
            onTap: this.openTracker(context),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.white),
            ),
            title: Text(
              "Chipotle on TODO Date",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ID: " + _trackerId, style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
      ),
    );
  }
}

class TrackerListPage extends StatefulWidget {
  final TrackerListPersistence _trackerListPersistence;

  const TrackerListPage(this._trackerListPersistence);

  @override
  _TrackerListPageState createState() => _TrackerListPageState();
}

class _TrackerListPageState extends State<TrackerListPage> {
  List<String> _trackerIds = [];

  @override
  void initState() {
    super.initState();
    updateTrackerIds();
  }

  void _addItem(String tracker) {
    widget._trackerListPersistence.addTracker(tracker);
    updateTrackerIds();
  }

  void updateTrackerIds() {
    setState(() {
      _trackerIds = widget._trackerListPersistence.getAllTrackers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chipotle Tracker"),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new AddTrackerForm(this._addItem),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _trackerIds.length,
              itemBuilder: (BuildContext context, int index) {
                return new TrackerItem(_trackerIds[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
