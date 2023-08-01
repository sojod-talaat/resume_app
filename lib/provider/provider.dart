import 'package:flutter/material.dart';
import 'package:task_management/data/db_helper.dart';
import 'package:task_management/data/model.dart';
import 'package:task_management/data/workmodel.dart';

import '../data/persone-model.dart';

class DbProvider extends ChangeNotifier {
  TextEditingController personename = TextEditingController();
  TextEditingController PersoneField = TextEditingController();
  TextEditingController personeinfo = TextEditingController();
  TextEditingController personImage = TextEditingController();
  TextEditingController personlan = TextEditingController();
  DbProvider() {
    selectAllExperince();
  }
  List<Experince> allexperince = [];
  List<WorkModel> allwork = [];
  List<PersonModel> allPersone = [];
  fillListPerson(List<PersonModel> persone) {
    allPersone = persone;
    notifyListeners();
  }

  fillLists(List<Experince> experince) {
    allexperince = experince;
    notifyListeners();
  }

  fillListswork(List<WorkModel> work) {
    allwork = work;
    notifyListeners();
  }

  addNewPerson(PersonModel persone) {
    allPersone.add(persone);
    fillListPerson(allPersone);
  }

  addexperincetolist(Experince experince) {
    allexperince.add(experince);
    fillLists(allexperince);
  }

  addworkToList(WorkModel work) {
    allwork.add(work);
    fillListswork(allwork);
  }

  createNewPerson(PersonModel persone) async {
    await DbHelper.dbHelper.insertNewPerson(persone);
  }

  createNewExperince(Experince experince) async {
    await DbHelper.dbHelper.insertNewexperince(experince);
    addexperincetolist(experince);
  }

  createNewwork(WorkModel work) async {
    await DbHelper.dbHelper.insertNewWork(work);
    addworkToList(work);
  }

  selectAllExperince() async {
    List<Experince> tasks = await DbHelper.dbHelper.selectAllexperinces();
    fillLists(tasks);
  }

  selectAllwork() async {
    List<WorkModel> work = await DbHelper.dbHelper.selectAllwork();
    fillListswork(work);
  }

  deleteOneExperince2(Experince experince) async {
    await DbHelper.dbHelper.deleteOneExperince(experince.id!);
    selectAllExperince();
    notifyListeners();
  }
}
