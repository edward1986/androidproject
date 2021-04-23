import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../generated/models/user_model.dart';
import '../routes/app_pages.dart';
import '../services/login_api.dart';

class MainController extends GetxController {
  var myUser_val = "".obs;

  @override
  void onInit() {
    print("On init HomeController");

    String myUser_str = GetStorage().read<String>('myUser');

    if (!myUser_str.isNull) myUser_val.value = myUser_str;

    super.onInit();
  }
}