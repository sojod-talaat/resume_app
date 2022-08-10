import 'package:flutter/material.dart';
import 'package:task_management/data/db_helper.dart';
import 'package:task_management/data/model.dart';
import 'package:task_management/data/workmodel.dart';

class DbProvider extends ChangeNotifier {
  DbProvider() {
    selectAllExperince();
  }
  List<Experince> allexperince = [];
  List<WorkModel> allwork = [];
  fillLists(List<Experince> experince) {
    allexperince = experince;
    notifyListeners();
  }

  fillListswork(List<WorkModel> work) {
    allwork = work;
    notifyListeners();
  }

  addTaskToList(Experince experince) {
    allexperince.add(experince);
    fillLists(allexperince);
  }

  addworkToList(WorkModel work) {
    allwork.add(work);
    fillListswork(allwork);
  }

  createNewTask(Experince experince) async {
    await DbHelper.dbHelper.insertNewexperince(experince);
    addTaskToList(experince);
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
