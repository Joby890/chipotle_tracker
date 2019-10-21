import 'dart:async';

import 'package:chipotle_tracker/tracker/tracker_detail.dart';
import 'package:chipotle_tracker/tracker/tracker_detail_api.dart';
import 'package:chipotle_tracker/tracker/tracker_time_perdiction.dart';
import 'package:chipotle_tracker/tracker_details/formatter_date_supplier.dart';
import 'package:chipotle_tracker/tracker_details/tracker_delivery_time.dart';
import 'package:chipotle_tracker/tracker_details/tracker_state_content.dart';
import 'package:flutter/material.dart';

class TrackerDetailPage extends StatefulWidget {
  final String _trackerId;

  TrackerDetailPage(this._trackerId);

  @override
  _TrackerDetailPageState createState() =>
      _TrackerDetailPageState(new TrackerDetailApi(_trackerId));
}

class _TrackerDetailPageState extends State<TrackerDetailPage> {
  final TrackerDetailApi _trackerDetailApi;

  TrackerDetail _trackerDetail;
  List<Timer> _timers;

  _TrackerDetailPageState(this._trackerDetailApi);

  @override
  void initState() {
    super.initState();

    networkRequest(null);
    _timers = [
      Timer.periodic(new Duration(seconds: 15), this.networkRequest),
      Timer.periodic(new Duration(seconds: 1), this.updateUi)
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _timers.forEach((timer) {
      timer.cancel();
    });
  }

  void networkRequest(Timer timer) {
    _trackerDetailApi.getTrackerDetail().then((_detail) {
      setState(() {
        _trackerDetail = _detail;
      });
    });
  }

  void updateUi(Timer timer) {
    setState(() {});
  }

  Widget _getMainRender() {
    TrackerDetail detail = _trackerDetail;
    return new SingleChildScrollView(
        child: new Column(children: <Widget>[
//      new Row(
//        children: <Widget>[
//          new Text("Delivery to "),
//          new Text(_trackerDetail.deliveryAddress),
//        ],
//      ),
        new TrackerDeliveryTime(detail),
      new TrackerStateContent(detail),
      new TrackerTimePrediction(detail),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainRender = _trackerDetail == null
        ? new Center(
            child: new CircularProgressIndicator(),
          )
        : _getMainRender();

    return Scaffold(
        appBar: AppBar(
          title: Text("Chipotle Tracker"),
        ),
        body: mainRender);
  }
}
