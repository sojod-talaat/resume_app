import 'dart:typed_data';

import 'package:task_management/data/db_helper.dart';

class Experince {
  int? id;
  String? title;
  String? progress;
  String? startDate;
  String? endDate;
  String? numberofhoure;
  Experince({
    required this.title,
    required this.progress,
    required this.startDate,
    required this.endDate,
    required this.numberofhoure,
  });
  Experince.fromMap(Map<String, dynamic> map) {
    id = map[DbHelper.experinceIdColumName];
    title = map[DbHelper.experinceNameColumName];
    progress = map[DbHelper.experinceprogress];
    startDate = map[DbHelper.experincestartDateColum];
    endDate = map[DbHelper.experincendDateColum];
    numberofhoure = map[DbHelper.experincenumbe];
  }
  Map<String, dynamic> toMap() {
    return {
      DbHelper.experinceNameColumName: title,
      DbHelper.experinceprogress: progress,
      DbHelper.experincestartDateColum: startDate,
      DbHelper.experincendDateColum: endDate,
      DbHelper.experincenumbe: numberofhoure,
    };
  }
}
