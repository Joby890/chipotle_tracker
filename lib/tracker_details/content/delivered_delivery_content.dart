import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

class DeliveredDeliveryContent extends StatelessWidget {
  final TrackerDetail _trackerDetail;

  const DeliveredDeliveryContent(this._trackerDetail);

  @override
  Widget build(BuildContext context) {
    String deliveryDescription = "Unknown";
    if (_trackerDetail.actualDeliveryTime != null && _trackerDetail.quotedDeliveryTime != null) {
      int duration = (_trackerDetail.actualDeliveryTime.millisecondsSinceEpoch -
          _trackerDetail.quotedDeliveryTime.millisecondsSinceEpoch);

      String formattedDur = printDuration(new Duration(milliseconds: duration.abs()));
      if (duration > 0) {
        deliveryDescription = "Arrived $formattedDur late";
      } else {
        deliveryDescription = "Arrived $formattedDur early";
      }
    }

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "Delivered",
            style: new TextStyle(fontSize: 28.0),
          ),
        ),
        new Text(
          deliveryDescription,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
