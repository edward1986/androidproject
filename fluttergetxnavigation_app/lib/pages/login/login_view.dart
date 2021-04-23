import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../generated/models/user_model.dart';
import 'login_controller.dart';
import '../../routes/app_pages.dart';
import '../../services/login_api.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/images.dart';
import '../../utils/widgets.dart';
class LoginView extends StatelessWidget {
  bool rememberMe = false;
  final LoginController loginController = Get.put(LoginController());

  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");

  loginUser() async {
    String username = usernameController.text;
    String password = passController.text;

    if (username.length < 3) {
      Get.snackbar("Warning", "Please enter username!");
    } else if (password.length < 3) {
      Get.snackbar("Warning", "Please enter your password!");
    } else {
      loginController.loginUser(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                Image.asset(t1_ic_ring, height: 100, width: 100),
                SizedBox(height: 16),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      formHeading("Login/"),
                      formSubHeadingForm("Signup")
                    ]),
                SizedBox(height: 50),
                new Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        editTextStyle("Username", usernameController,
                            isPassword: false),
                        SizedBox(height: 16),
                        editTextStyle("Password", passController,
                            isPassword: true),
                      ],
                    )),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: CheckboxListTile(
                    title: text("Remember me", textColor: textColorPrimary),
                    value: rememberMe,
                    onChanged: (newValue) {
                      rememberMe = newValue;
                      //setState(() {});
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                    padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
                    child: shadowButton("Sign in", this.loginUser)),
                SizedBox(height: 24),
                text("forgot pass",
                    textColor: textColorPrimary, fontFamily: fontMedium)
              ],
            ),
          ),
        ),
      ),
    );
  }
}