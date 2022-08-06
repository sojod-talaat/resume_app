import 'dart:io';
import 'dart:typed_data';

import 'package:task_management/data/db_helper.dart';

class WorkModel {
  int? i;
  String? date;
  //File? image;
  String? title;
  String? url;
  Uint8List? picture;

  // WorkModel.fromFile(date, image, title, url);
  // static List<WorkModel> workModel = [];
  WorkModel({
    required this.date,
    //required this.image,
    required this.title,
    required this.url,
    required this.picture,
  });

  WorkModel.fromMap(Map<String, dynamic> map) {
    i = map[DbHelper.workidcoulum];
    title = map[DbHelper.workname];
    picture = map[DbHelper.image];
    date = map[DbHelper.workdate];
    url = map[DbHelper.url];
  }
  Map<String, dynamic> toMap() {
    return {
      DbHelper.workname: title,
      DbHelper.image: picture,
      DbHelper.workdate: date,
      DbHelper.url: url,
    };
  }
}
