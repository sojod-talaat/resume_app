import 'dart:typed_data';

import 'db_helper.dart';

class PersonModel {
  int? id;
  String? Name;
  String? field;
  String? info;
  Uint8List? persomim;
  String? personlang;
  PersonModel(
      {required this.Name,
      required this.field,
      required this.info,
      required this.persomim,
      required this.personlang});
  PersonModel.fromMap(Map<String, dynamic> map) {
    id = map[DbHelper.personeid];
    Name = map[DbHelper.personname];
    persomim = map[DbHelper.personeimage];
    field = map[DbHelper.personefield];
    info = map[DbHelper.personefield];
    personlang = map[DbHelper.personlang];
  }
  Map<String, dynamic> toMap() {
    return {
      DbHelper.personname: Name,
      DbHelper.personeimage: persomim,
      DbHelper.personefield: field,
      DbHelper.personeinfo: info,
      DbHelper.personlang: personlang,
    };
  }
}
