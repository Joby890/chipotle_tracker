import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:chipotle_tracker/tracker/tracker_state.dart';
import 'package:chipotle_tracker/tracker_details/content/no_driver_delivery_content.dart';
import 'package:chipotle_tracker/tracker_details/content/picked_up_delivery_content.dart';
import 'package:flutter/material.dart';

import 'package:chipotle_tracker/tracker_details/content/delivered_delivery_content.dart';
import 'package:chipotle_tracker/tracker_details/content/driver_found_delivery_content.dart';

import 'content/drover_at_pickup_delivery_content.dart';

class TrackerStateContent extends StatelessWidget {
  final TrackerDetail _trackerDetail;

  const TrackerStateContent(this._trackerDetail);

  @override
  Widget build(BuildContext context) {
    switch (_trackerDetail.deliveryState) {
      case DeliveryState.UNKNOWN:
        return new Column(
          children: <Widget>[
            new Text("Unkown delivery state"),
          ],
        );
      case DeliveryState.DRIVER_FOUND:
        return new DriverFoundDeliveryContent(_trackerDetail);
      case DeliveryState.PICKED_UP:
        return new PickedUpDeliveryContent(_trackerDetail);
      case DeliveryState.DROPPED_OFF:
        return new DeliveredDeliveryContent(_trackerDetail);
      case DeliveryState.DRIVER_AT_PICKUP:
        return new DriverAtPickupDeliveryContent(_trackerDetail);
      case DeliveryState.NO_DRIVER:
        return new NoDriverDeliveryContent(_trackerDetail);
    }
  }
}

