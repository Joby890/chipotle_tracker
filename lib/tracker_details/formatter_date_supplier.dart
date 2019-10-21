import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {

  DateTime useTime = dateTime.subtract(new Duration(hours: 4));

  String line = ""
      "${new DateFormat("EEEE, MMM d").format(useTime)}"
      " at ${new DateFormat("hh:mm a").format(useTime)}";
  return line;
}