import 'package:get/get.dart';
import '../routes/app_pages.dart';

class NaviController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    print("On init NaviController");

    super.onInit();
  }

  void onBottomNavItemTapped(int index) {
    print("tab item clicked:" + index.toString());
    selectedIndex.value = index;
  }
}