import 'dart:convert';

import 'package:flutter/material.dart';import 'package:get/get.dart';
import '../providers/task_provider.dart';

class HomeController extends GetxController {
  var lstTask = List<dynamic>.empty(growable: true).obs;
  var page = 1;
  var isDataProcessing = false.obs;


  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;


  TextEditingController titleEditingController, descriptionEditingController;
  var selectedPriority = 1.obs;
  var isProcessing = false.obs;

  @override
  void onInit() async {
    super.onInit();

    getTask(page);


    paginateTask();


    titleEditingController = TextEditingController();
    descriptionEditingController = TextEditingController();
  }


  void getTask(var page) {
    try {
      isMoreDataAvailable(false);
      isDataProcessing(true);
      TaskProvider().getTask(page).then((resp) {
        isDataProcessing(false);
        lstTask.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }


  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }


  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        page++;
        getMoreTask(page);
      }
    });
  }


  void getMoreTask(var page) {
    try {
      TaskProvider().getTask(page).then((resp) {
        if (resp.length > 0) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          showSnackBar("Message", "No more items", Colors.lightBlueAccent);
        }
        lstTask.addAll(resp);
      }, onError: (err) {
        isMoreDataAvailable(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isMoreDataAvailable(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }


  void refreshList() async {
    page = 1;
    getTask(page);
  }


  void saveTask(Map data) {
    try {
      isProcessing(true);
      TaskProvider().saveTask(data).then((resp) {
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Add Task", "Task Added", Colors.green);
          lstTask.clear();
          refreshList();
        } else {
          showSnackBar("Add Task", "Failed to Add Task", Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  void updateTask(Map data) {
    try {
      isProcessing(true);
      TaskProvider().updateTask(data).then((resp) {
        if (resp == "success") {
          clearTextEditingControllers();
          isProcessing(false);

          showSnackBar("Edit Task", "Task Updated", Colors.green);
          lstTask.clear();
          refreshList();
        }
        else {
          showSnackBar("Edit Task", "Task not Updated", Colors.red);
        }
      }, onError: (err) {
        isProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }


  void deleteTask(Map data) {
    print("step2");
    try {
      isProcessing(true);

      TaskProvider().deleteTask(data).then((resp) {
        isProcessing(false);
        print(resp);
        if (resp == "success") {
          showSnackBar("Delete Task", "Task Deleted", Colors.green);
          lstTask.clear();
          refreshList();
        }
        else {
          showSnackBar("Delete Task", "Task not Deleted", Colors.red);
        }
      }, onError: (err) {
        print("step4");
        isProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  void clearTextEditingControllers() {
    titleEditingController.clear();
    descriptionEditingController.clear();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    titleEditingController.dispose();
    descriptionEditingController.dispose();
  }
}
