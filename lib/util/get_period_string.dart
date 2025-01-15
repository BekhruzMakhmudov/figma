import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getPeriodString({
  required DateTimeRange period,
  required String format,
}) {
  String start=DateFormat(format).format(period.start);
  String end=DateFormat(format).format(period.end);
  return '$start - $end';
}
