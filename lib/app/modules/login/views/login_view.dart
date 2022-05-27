import 'package:argon_user/Constants/color_constant.dart';
import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/Utilities/validation.dart';
import 'package:argon_user/app/routes/app_pages.dart';
import 'package:argon_user/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Constants/sizeConstant.dart';
import '../../../../Utilities/submit_button.dart';
import '../../../../Utilities/text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      //   centerTitle: true,
      //   backgroundColor: appTheme.primaryTheme,
      // ),
      body: Container(
        height: MySize.screenHeight,
        width: MySize.screenWidth,
        child: Form(
          key: controller.formKey,
          child: Stack(
            children: [
              Container(
                height: MySize.screenHeight,
                width: MySize.screenWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MySize.screenHeight,
                width: MySize.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: MySize.getScaledSizeHeight(70),
                          horizontal: MySize.getScaledSizeWidth(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "User Login",
                              style: TextStyle(
                                color: appTheme.primaryTheme,
                                fontSize: MySize.size24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: MySize.getScaledSizeHeight(20),
                              ),
                              width: MySize.getScaledSizeWidth(550),
                              child: getTextFormField(
                                textEditingController:
                                    controller.emailController.value,
                                hintText: "Email",
                                validation: (input) => input!.isValidEmail()
                                    ? null
                                    : "Check your email",
                              ),
                            ),
                            Obx(() {
                              return Container(
                                padding: EdgeInsets.only(
                                  top: MySize.getScaledSizeHeight(20),
                                ),
                                width: MySize.getScaledSizeWidth(550),
                                child: getTextFormField(
                                  textEditingController:
                                      controller.passController.value,
                                  hintText: "Password",
                                  validation: (input) => input!.isNotEmpty
                                      ? null
                                      : "Check your Password",
                                  textVisible: controller.passwordVisible.value,
                                  suffix: InkWell(
                                    onTap: () {
                                      controller.passwordVisible.toggle();
                                    },
                                    child: Text(
                                      (!controller.passwordVisible.isTrue)
                                          ? "Hide"
                                          : "Show",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ),
                              );
                            }),
                            Container(
                              padding: EdgeInsets.only(
                                top: MySize.getScaledSizeHeight(40),
                              ),
                              width: MySize.getScaledSizeWidth(550),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    return Checkbox(
                                        value: controller.isChecked.value,
                                        onChanged: (val) {
                                          controller.isChecked.toggle();
                                        });
                                  }),
                                  SizedBox(
                                    width: MySize.getScaledSizeWidth(10),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.isChecked.toggle();
                                    },
                                    child: Text(
                                      "Remember Me",
                                      style: TextStyle(
                                        fontSize: MySize.size18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MySize.getScaledSizeWidth(550),
                              padding: EdgeInsets.only(
                                top: MySize.getScaledSizeHeight(40),
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    if (controller.isChecked.value) {
                                      box.write(
                                          StringConstants.isRemember, true);

                                      box.write(StringConstants.userPassword,
                                          controller.passController.value.text);
                                    } else {
                                      box.write(
                                          StringConstants.isRemember, false);
                                    }
                                    box.write(StringConstants.userEmailAddress,
                                        controller.emailController.value.text);
                                    print(box.read(
                                        StringConstants.userEmailAddress));
                                    controller.callApiForLoginUser(
                                        context: context);
                                  }
                                },
                                child: button(
                                  backgroundColor: Colors.blue,
                                  textColor: appTheme.whiteColor,
                                  fontsize: MySize.size23,
                                  fontWeight: FontWeight.w500,
                                  title: "Log In",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
