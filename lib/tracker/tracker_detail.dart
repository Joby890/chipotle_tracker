import 'package:chipotle_tracker/tracker/tracker_state.dart';

class TrackerDetail {
  final int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
  final String deliveryAddress;
  final DateTime quotedDeliveryTime;
  final DeliveryState deliveryState;
  final double currentStateSeconds;
  final double currentStateMeters;

  final DateTime actualDeliveryTime;

  TrackerDetail(
      {this.deliveryAddress,
      this.quotedDeliveryTime,
      this.deliveryState,
      this.currentStateSeconds,
      this.currentStateMeters,
      this.actualDeliveryTime});

  static TrackerDetail fromJSON(Map<String, dynamic> json) {
    print(json);

    return new TrackerDetail(
      deliveryAddress: _getDeliveryAddress(json),
      quotedDeliveryTime: _getQuotedDeliveryTime(json),
      deliveryState: _getDeliveryState(json),
      currentStateSeconds: _getCurrentSeconds(json),
      currentStateMeters: _getCurrentMeters(json),
      actualDeliveryTime: _getActualDeliveryTime(json),
    );
  }

  static String _getDeliveryAddress(Map<String, dynamic> json) {
    Map<String, dynamic> deliveryAddress = json["delivery_address"];
    if (deliveryAddress != null &&
        deliveryAddress["address"] != null &&
        deliveryAddress["address"]["shortname"] != null) {
      return deliveryAddress["address"]["shortname"];
    }
    return "Unknown Address";
  }

  static _getQuotedDeliveryTime(Map<String, dynamic> json) {
    String quotedTime = json["quoted_delivery_time"];
    if (quotedTime != null) {
      return DateTime.parse(quotedTime);
    }
    return null;
  }

  static DeliveryState _getDeliveryState(Map<String, dynamic> json) {
    Map<String, dynamic> internalStatus = json["drive_internal_status"];
    if (internalStatus != null && internalStatus["category"] != null) {
      String category = internalStatus["category"];
      switch (category) {
        case "picked_up":
          return DeliveryState.PICKED_UP;
        case 'dropped_off':
          return DeliveryState.DROPPED_OFF;
        case "dasher_online":
          return DeliveryState.DRIVER_FOUND;
        case "dasher_arrived_mx":
          return DeliveryState.DRIVER_AT_PICKUP;
        case "no_dasher":
          return DeliveryState.NO_DRIVER;
      }
    }
    return DeliveryState.UNKNOWN;
  }

  static double _getCurrentSeconds(Map<String, dynamic> json) {
    Map<String, dynamic> internalStatus = json["drive_internal_status"];
    if (internalStatus != null &&
        internalStatus["metadata"] != null &&
        internalStatus["metadata"]["travel_duration_seconds"] != null) {
      num result = internalStatus["metadata"]["travel_duration_seconds"] - 600;
      return result.toDouble();
    }
    return -1;
  }

  static double _getCurrentMeters(Map<String, dynamic> json) {
    Map<String, dynamic> internalStatus = json["drive_internal_status"];
    if (internalStatus != null &&
        internalStatus["metadata"] != null &&
        internalStatus["metadata"]["travel_distance_meters"] != null) {
      num result = internalStatus["metadata"]["travel_distance_meters"];
      return result.toDouble();
    }
    return -1;
  }

  static _getActualDeliveryTime(Map<String, dynamic> json) {
    String deliveryTime = json["actual_delivery_time"];
    if(deliveryTime != null) {
      return DateTime.parse(deliveryTime);
    }
    return null;

  }
}
