import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:flutter/material.dart';

class TrackerTimePrediction extends StatelessWidget {
  final TrackerDetail _trackerDetail;

  const TrackerTimePrediction(this._trackerDetail);

  @override
  Widget build(BuildContext context) {
    if (_trackerDetail.currentStateSeconds != -1) {
      return new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text(
                  "Predited mins left: " + (_trackerDetail.currentStateSeconds / 60).toString()),
            ],
          )
        ],
      );
    }
    return new Container();
  }
}
