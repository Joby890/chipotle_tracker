import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:flutter/material.dart';

class DriverAtPickupDeliveryContent extends StatelessWidget {

  final TrackerDetail _trackerDetail;

  const DriverAtPickupDeliveryContent(this._trackerDetail);

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "At Resturant",
            style: new TextStyle(fontSize: 28.0),
          ),
        ),
      ],
    );
  }
}
