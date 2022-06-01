import 'package:argon_user/Constants/color_constant.dart';
import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/Utilities/responsive.dart';
import 'package:argon_user/Utilities/validation.dart';
import 'package:argon_user/app/routes/app_pages.dart';
import 'package:argon_user/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: ResponsiveWidget(
        largeScreen: Container(
          height: MySize.screenHeight,
          width: MySize.screenWidth,
          child: Form(
            key: controller.formKey,
            child: Stack(
              children: [
                // Container(
                //   height: MySize.screenHeight,
                //   width: MySize.screenWidth,
                //   child: Column(
                //     children: [
                //       Expanded(
                //         child: Container(),
                //       ),
                //       Expanded(
                //         child: Container(
                //           color: Colors.blue,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  height: MySize.screenHeight,
                  width: MySize.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/image.png"),
                        width: (ResponsiveWidget.isMediumScreen(context))
                            ? MySize.getScaledSizeWidth(400)
                            : MySize.getScaledSizeWidth(700),
                        height: MySize.screenHeight,
                        fit: BoxFit.fill,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: MySize.getScaledSizeHeight(70),
                            horizontal: MySize.getScaledSizeWidth(25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "LOG IN",
                                style: TextStyle(
                                  color: appTheme.primaryTheme,
                                  fontSize: MySize.size50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Space.height(5),
                              Text(
                                "Please enter your mail and password to continue",
                                style: TextStyle(
                                  color: appTheme.primaryTheme.withOpacity(0.7),
                                  fontSize: MySize.size25,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Space.height(45),
                              Container(
                                padding: EdgeInsets.only(
                                  top: MySize.getScaledSizeHeight(20),
                                ),
                                width: MySize.getScaledSizeWidth(550),
                                child: getTextFormField(
                                  textEditingController:
                                      controller.emailController.value,
                                  borderRadius: MySize.size20,
                                  isFillColor: true,
                                  hintText: "Email",
                                  validation: (input) => input!.isValidEmail()
                                      ? null
                                      : "Check your email",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(MySize.size15!),
                                    child: Image(
                                      image: AssetImage("assets/ic_mail.png"),
                                      height: MySize.size25,
                                      width: MySize.size25,
                                    ),
                                  ),
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
                                    //size: MySize.size70,
                                    borderRadius: MySize.size20,
                                    isFillColor: true,
                                    hintText: "Password",
                                    validation: (input) => input!.isNotEmpty
                                        ? null
                                        : "Check your Password",
                                    textVisible:
                                        controller.passwordVisible.value,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(MySize.size15!),
                                      child: Image(
                                        image: AssetImage("assets/ic_lock.png"),
                                        height: MySize.size25,
                                        width: MySize.size25,
                                      ),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        controller.passwordVisible.toggle();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(MySize.size15!),
                                        child: Image(
                                          image: AssetImage((!controller
                                                  .passwordVisible.value)
                                              ? "assets/ic_eye_offf.png"
                                              : "assets/ic_eye.png"),
                                          height: MySize.size25,
                                          width: MySize.size30,
                                        ),
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
                                      return InkWell(
                                        onTap: () {
                                          controller.isChecked.toggle();
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              (!controller.isChecked.value)
                                                  ? "assets/ic_box.png"
                                                  : "assets/ic_check_box.png"),
                                          height: MySize.size25,
                                          width: MySize.size30,
                                        ),
                                      );
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
                                //width: MySize.getScaledSizeWidth(550),
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

                                        box.write(
                                            StringConstants.userPassword,
                                            controller
                                                .passController.value.text);
                                      } else {
                                        box.write(
                                            StringConstants.isRemember, false);
                                      }
                                      box.write(
                                          StringConstants.userEmailAddress,
                                          controller
                                              .emailController.value.text);
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
                                    radius: MySize.size20!,
                                    width: MySize.getScaledSizeWidth(220),
                                    fontWeight: FontWeight.w500,
                                    title: "LOG IN",
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
        // smallScreen: Text("Small"),
      ),
    );
  }
}
