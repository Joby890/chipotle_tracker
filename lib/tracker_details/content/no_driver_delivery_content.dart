import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:chipotle_tracker/tracker/tracker_time_perdiction.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

class NoDriverDeliveryContent extends StatelessWidget {
  final TrackerDetail _trackerDetail;

  const NoDriverDeliveryContent(this._trackerDetail);

  @override
  Widget build(BuildContext context) {


    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "No Driver",
            style: new TextStyle(fontSize: 28.0),
          ),
        ),
        new TrackerTimePrediction(_trackerDetail)
      ],
    );
  }
}
