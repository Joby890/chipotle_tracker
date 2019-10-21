import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

class DriverFoundDeliveryContent extends StatelessWidget {
  final TrackerDetail _trackerDetail;

  const DriverFoundDeliveryContent(this._trackerDetail);

  @override
  Widget build(BuildContext context) {

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "Driver found",
            style: new TextStyle(fontSize: 28.0),
          ),
        ),
        new Row(
          children: <Widget>[
            new Text("Seconds till delivery "),
            new Text(_trackerDetail.currentStateSeconds.toString()),
          ],
        ),
        new Row(
          children: <Widget>[
            new Text("Meters till delivery "),
            new Text(_trackerDetail.currentStateMeters.toString()),
          ],
        ),
      ],
    );
  }
}
