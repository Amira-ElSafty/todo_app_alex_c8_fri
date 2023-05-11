import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_c8_fri/model/task.dart';
import '../firebase_utils.dart';

class ListProvider extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime selectedDay = DateTime.now();

  /// refresh todo
  getAllTasksFromFireStore() async {
    /// get all tasks
    QuerySnapshot<Task> querySnapShot = await getTaskCollection().get();

    /// list<task>  => list<QueryDocSnapshot<Task>>
    taskList = querySnapShot.docs.map((doc) {
      return doc.data();
    }).toList();

    /// filter
    taskList = taskList.where((task) {
      DateTime taskDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      if (selectedDay.day == taskDate.day &&
          selectedDay.month == taskDate.month &&
          selectedDay.year == taskDate.year) {
        return true;
      }
      return false;
    }).toList();

    /// sort
    taskList.sort((Task task1 , Task task2){
      DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return dateTime1.compareTo(dateTime2);
    });

    notifyListeners();
  }

  void setNewsSelectedDay(DateTime newDate) {
    selectedDay = newDate;
    getAllTasksFromFireStore();
  }
}
