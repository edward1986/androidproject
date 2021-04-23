import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../navi/bottom_navi.dart';
import '../../navi/left_navi.dart';
import '../../navi/navi_controller.dart';
import 'home_widget.dart';
import 'settings_widget.dart';
import 'test_widget.dart';
import '../../pages/login/login_controller.dart';
import '../../utils/main_controlller.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final NaviController naviController = Get.put(NaviController());
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = <Widget>[
      homeWidget(),
      testWidget(),
      settingsWidget()
    ];
    return Scaffold(
      appBar: AppBar(title: Text('home')),
      drawer: leftNavi(loginController.myUser.value.name.toString()),
      bottomNavigationBar: bottomNavi(naviController),
      body:
      Obx(() => _widgetList.elementAt(naviController.selectedIndex.value)),
    );
  }
}