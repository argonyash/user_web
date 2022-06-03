import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Constants/sizeConstant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_main_controller.dart';

class HomeMainView extends GetWidget<HomeMainController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      //key: controller.scaffoldKey,
      backgroundColor: Colors.white,
      //  drawer: HomeDrawerView(),
      //   appBar: AppBar(
      //     title: Text('Dashboard'),
      //     centerTitle: true,
      //     actions: [
      //       IconButton(
      //         onPressed: () {
      //           Get.offAllNamed(Routes.LOGIN);
      //           box.write(StringConstants.isUserLogIn, false);
      //         },
      //         icon: const Icon(
      //           Icons.logout,
      //         ),
      //       ),
      //     ],
      //   ),
      body: Container(
        height: MySize.screenHeight,
        width: MySize.screenWidth,
        // padding: EdgeInsets.symmetric(
        //   horizontal: MySize.size15!,
        //   vertical: MySize.size15!,
        // ),
        child: Row(
          children: [
            Container(
              height: MySize.screenHeight,
              width: MySize.getScaledSizeWidth(320),
              decoration: BoxDecoration(
                color: Color(0xfff3fbff),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(MySize.size52!),
                  bottomRight: Radius.circular(MySize.size52!),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: ExactAssetImage("assets/logo1.png"),
                      width: MySize.getScaledSizeWidth(320),
                    ),
                  ),
                  Space.height(30),
                  InkWell(
                    onTap: () {
                      if (Get.currentRoute != Routes.HOME) {
                        Get.offAllNamed(Routes.HOME);
                      }
                    },
                    child: Container(
                      width: MySize.getScaledSizeWidth(320),
                      height: MySize.size52,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MySize.getScaledSizeWidth(80)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image:
                                        AssetImage("assets/ic_dashboard.png"),
                                    height: MySize.getScaledSizeHeight(30),
                                    width: MySize.getScaledSizeHeight(30),
                                    fit: BoxFit.fill,
                                  ),
                                  Space.width(12),
                                  Text(
                                    "Dashboard",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MySize.size20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: MySize.size7,
                              height: MySize.size52,
                              decoration: BoxDecoration(
                                color: Color(0xff01a7fe),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(MySize.size12!),
                                  bottomLeft: Radius.circular(MySize.size12!),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Space.height(10),
                  InkWell(
                    onTap: () {
                      if (Get.currentRoute != Routes.ATTANDANCE) {
                        Get.offAllNamed(Routes.ATTANDANCE);
                      }
                    },
                    child: Container(
                      width: MySize.getScaledSizeWidth(320),
                      height: MySize.size52,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MySize.getScaledSizeWidth(80)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image:
                                        AssetImage("assets/ic_Attandance.png"),
                                    height: MySize.getScaledSizeHeight(30),
                                    width: MySize.getScaledSizeHeight(30),
                                    fit: BoxFit.fill,
                                  ),
                                  Space.width(12),
                                  Text(
                                    "Attandance",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MySize.size20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Positioned(
                          //   right: 0,
                          //   child: Container(
                          //     width: MySize.size7,
                          //     height: MySize.size52,
                          //     decoration: BoxDecoration(
                          //       color: Color(0xff01a7fe),
                          //       borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(MySize.size12!),
                          //         bottomLeft: Radius.circular(MySize.size12!),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Space.height(10),
                  InkWell(
                    onTap: () {
                      if (Get.currentRoute != Routes.LEAVE) {
                        Get.offAllNamed(Routes.LEAVE);
                      }
                    },
                    child: Container(
                      width: MySize.getScaledSizeWidth(320),
                      height: MySize.size52,
                      child: Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MySize.getScaledSizeWidth(80)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage("assets/ic_leave.png"),
                                    height: MySize.getScaledSizeHeight(30),
                                    width: MySize.getScaledSizeHeight(30),
                                    fit: BoxFit.fill,
                                  ),
                                  Space.width(12),
                                  Text(
                                    "Leave",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MySize.size20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Positioned(
                          //   right: 0,
                          //   child: Container(
                          //     width: MySize.size7,
                          //     height: MySize.size52,
                          //     decoration: BoxDecoration(
                          //       color: Color(0xff01a7fe),
                          //       borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(MySize.size12!),
                          //         bottomLeft: Radius.circular(MySize.size12!),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Space.width(30),
          ],
        ),
      ),
    );
  }
}
