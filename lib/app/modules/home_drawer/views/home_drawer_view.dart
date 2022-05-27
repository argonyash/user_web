import 'package:argon_user/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Constants/sizeConstant.dart';
import '../controllers/home_drawer_controller.dart';

class HomeDrawerView extends GetWidget<HomeDrawerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDrawerController>(
        init: HomeDrawerController(),
        builder: (controller) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    margin: EdgeInsets.zero,
                    child: Center(
                      child: Image(
                        image: ExactAssetImage("assets/logo.png"),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () {
                      Get.back();
                      print(Get.currentRoute);
                      if (Get.currentRoute != Routes.HOME) {
                        Get.offAllNamed(Routes.HOME);
                      }
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.timer),
                    title: Text("Attandance"),
                    onTap: () {
                      Get.back();
                      print(Get.currentRoute);
                      if (Get.currentRoute != Routes.ATTANDANCE) {
                        Get.offAllNamed(Routes.ATTANDANCE);
                      }
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                    onTap: () {
                      Get.back();
                      print(Get.currentRoute);
                      if (Get.currentRoute != Routes.USER_PROFILE) {
                        Get.offAllNamed(Routes.USER_PROFILE);
                      }
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Leave"),
                    onTap: () {
                      Get.back();
                      print(Get.currentRoute);
                      if (Get.currentRoute != Routes.LEAVE) {
                        Get.offAllNamed(Routes.LEAVE);
                      }
                    },
                  ),
                ],
              ),
            );
          });
        });
  }
}
