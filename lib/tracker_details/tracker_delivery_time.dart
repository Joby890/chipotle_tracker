import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:chipotle_tracker/tracker_details/formatter_date_supplier.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

class TrackerDeliveryTime extends StatelessWidget {
  final TrackerDetail _detail;

  TrackerDeliveryTime(this._detail);

  @override
  Widget build(BuildContext context) {


    String deliveryDescription = "Unknown";
    final DateTime now = DateTime.now();
    if (_detail.quotedDeliveryTime != null) {
      int duration = (now.millisecondsSinceEpoch -
          _detail.quotedDeliveryTime.millisecondsSinceEpoch);

      String formattedDur = printDuration(new Duration(milliseconds: duration.abs()));
      if (duration > 0) {
        deliveryDescription = "Arrived $formattedDur late";
      } else {
        deliveryDescription = "Arrived $formattedDur early";
      }
    }

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "Delivery Time Predicted",
            style: new TextStyle(fontSize: 28.0),
          ),
        ),

        Row(
          children: <Widget>[
            new Text(
              "Quoted Delivery Time: ",
              style: new TextStyle(fontSize: 14.0),
            ),
            new Text(
              formatDate(_detail.quotedDeliveryTime),
              style: new TextStyle(fontSize: 14.0),
            ),
          ],
        ),

        Row(
          children: <Widget>[
            new Text(
              deliveryDescription,
              style: new TextStyle(fontSize: 14.0),
            ),
          ],
        ),

      ],
    );
  }
}
