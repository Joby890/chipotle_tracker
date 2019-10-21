import 'dart:convert';

import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:http/http.dart';

typedef TrackerDetailCallback = void Function(TrackerDetail detail);


class TrackerDetailApi {

  final String _trackerId;

  TrackerDetailApi(this._trackerId);

  Future<TrackerDetail> getTrackerDetail() async {

    String url = "https://api.doordash.com/v2/deliveries/$_trackerId/?expand=consumer&expand=dasher&expand=order_cart&expand=store&extra=drive_order_id&extra=fee&extra=consumer&extra=dasher&extra=dasher_approaching_customer_time&extra=actual_pickup_time&extra=dasher_confirmed_at_consumer_time&extra=dasher_at_store_time&extra=dasher_confirmed_at_store_time&extra=dasher_confirmed_time&extra=order_cart.%5Bsubmitted_at%2Curl_code%2Ctip_amount%5D&extra=orders.order_items&extra=delivery_address.address.%5Bcountry_code%2Cshortname%5D&extra=drive_external_order_reference&extra=drive_internal_status&extra=store.%5Bid%2Ctimezone%2Cphone_number%2Cbusiness%5D&extra=pickup_address.address.%5Bcountry_code%2Cshortname%5D&extra=estimated_pickup_time&extra=quoted_delivery_time&extra=subtotal&extra=total&extra=url_code&extra=business_id&extra=drive_order_type&extra=quantity&extra=abandoned_at&extra=post_tip_amount";
    Response response = await get(url);
    String jsonString = response.body;
    TrackerDetail result = TrackerDetail.fromJSON(json.decode(jsonString));
    print(result);
    return result;
  }



}