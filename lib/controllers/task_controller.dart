// UI send to controller and controller to Model

// import 'dart:ffi';
// import 'dart:html';

import 'package:flutter_todo/db/db_helper.dart';
import 'package:get/get.dart';

import '../Models/task.dart';

class TaskController extends GetxController {
  // get tasks => null;

  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  //get all the data from table
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();

    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }
}
