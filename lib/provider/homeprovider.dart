import 'dart:developer';

import 'package:calculater_2/contains/enums.dart';
import 'package:calculater_2/contains/fire_const.dart';
import 'package:calculater_2/models/tasksmodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homeprovider extends ChangeNotifier {
  bool isLoading = false;
  load({bool? load}) {
    if (load == null) {
      isLoading = !isLoading;
    } else {
      isLoading = load;
    }
    notifyListeners();
  }

  BottomBar selectedtab = BottomBar.all;
  TextEditingController titlecontroler = TextEditingController();
  TextEditingController detailscontroler = TextEditingController();

  List<TaskModel> lsttasks = [];
  List<TaskModel> listcompleted = [];
  TaskModel? addTaskDetails;

  changetab(index) {
    selectedtab = BottomBar.values[index];
    notifyListeners();
  }

  createTask() {
    addTaskDetails = TaskModel(
      taskName: titlecontroler.text.trim().toString(),
      taskDetails: detailscontroler.text.trim().toString(),
      completed: true,
      ct: DateTime.now().millisecondsSinceEpoch,
      id: "",
    );
  }

  addtask(BuildContext context) {
    if (addTaskDetails != null) {
      FirebaseFirestore.instance.collection(FireConsts.task).add(addTaskDetails!.toJson()).then((e) {
        Navigator.pop(context);
        lsttasks.add(TaskModel.fromJson(addTaskDetails!.toJson(), e.id));
        log(e.id);

        notifyListeners();
      });
    }
  }

  getData() {
    lsttasks.clear();
    load(load: true);
    FirebaseFirestore.instance.collection(FireConsts.task).get().then((res) {
      lsttasks = List.from(res.docs.map((e) => TaskModel.fromJson(e.data(), e.id)));
      notifyListeners();
    }).whenComplete(() {
      load(load: false);
    });
  }

  Future completdtask(TaskModel task, int index) {
    return FirebaseFirestore.instance.collection(FireConsts.task).doc(task.id).update({"completed": !task.completed}).then((v) {
      task.completed = !task.completed;
      lsttasks[index] = task;
      notifyListeners();
      // return "";
    });
  }

  getCompletedtasks() {
    listcompleted.clear();

    FirebaseFirestore.instance.collection(FireConsts.task).where("completed", isEqualTo: true).get().then((res) {
      listcompleted = List.from(res.docs.map((e) => TaskModel.fromJson(e.data(), "")));
      notifyListeners();
    });
  }

  deletetask(index) {
    FirebaseFirestore.instance.collection(FireConsts.task).doc(lsttasks[index].id).delete().then((e) {
      lsttasks.removeAt(index);
      notifyListeners();
    });
  }

  editTask(TaskModel task, index, BuildContext context) {
    FirebaseFirestore.instance.collection(FireConsts.task).doc(task.id).update({
      "taskName": titlecontroler.text.trim(),
      "taskDetails": detailscontroler.text.trim(),
    }).then((v) {
      Navigator.pop(context);
      task.taskName = titlecontroler.text.trim();
      task.taskDetails = detailscontroler.text.trim();
      lsttasks[index] = task;
      notifyListeners();
    });
  }
}
