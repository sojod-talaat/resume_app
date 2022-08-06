import 'package:flutter/material.dart';
import 'package:task_management/data/db_helper.dart';
import 'package:task_management/data/model.dart';
import 'package:task_management/data/workmodel.dart';

class DbProvider extends ChangeNotifier {
  DbProvider() {
    selectAllTasks();
  }
  List<Experince> allTasks = [];
  List<WorkModel> allwork = [];
  fillLists(List<Experince> tasks) {
    allTasks = tasks;
    notifyListeners();
  }

  fillListswork(List<WorkModel> work) {
    allwork = work;
    notifyListeners();
  }

  addTaskToList(Experince experince) {
    allTasks.add(experince);
    fillLists(allTasks);
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

  selectAllTasks() async {
    List<Experince> tasks = await DbHelper.dbHelper.selectAllexperinces();
    fillLists(tasks);
  }

  selectAllwork() async {
    List<WorkModel> work = await DbHelper.dbHelper.selectAllwork();
    fillListswork(work);
  }

  deleteTask(Experince experince) async {
    await DbHelper.dbHelper.deleteOneTask(experince.id!);
    selectAllTasks();
    notifyListeners();
  }
}
