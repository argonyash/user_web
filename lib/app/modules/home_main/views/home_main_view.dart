import 'package:argon_user/app/modules/attandance/views/attandance_view.dart';
import 'package:argon_user/app/modules/attandance_new/views/attandance_new_view.dart';
import 'package:argon_user/app/modules/home/views/home_view.dart';
import 'package:argon_user/app/modules/leave/views/leave_view.dart';
import 'package:argon_user/app/modules/user_profile/views/user_profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../Constants/api_constants.dart';
import '../../../../Constants/sizeConstant.dart';
import '../../../../Constants/string_constants.dart';
import '../../../../Utilities/utility_functions.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_main_controller.dart';

class HomeMainView extends GetWidget<HomeMainController> {
  GetStorage box = GetStorage();
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
      body: Obx(() {
        return Container(
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
                        //  if (Get.currentRoute != Routes.HOME) {
                        //Get.offAllNamed(Routes.HOME);
                        controller.currentWidget = HomeView();
                        controller.index.value = 0;

                        //}
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
                                height: MySize.size52,
                                child: Center(
                                  child: AnimatedContainer(
                                    width: (controller.index.value == 0)
                                        ? MySize.size7
                                        : 00,
                                    height: (controller.index.value == 0)
                                        ? MySize.size52
                                        : 0,
                                    decoration: BoxDecoration(
                                      color: Color(0xff01a7fe),
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(MySize.size12!),
                                        bottomLeft:
                                            Radius.circular(MySize.size12!),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 300),
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
                        controller.currentWidget = AttandanceView();

                        controller.count.value++;
                        controller.index.value = 1;

                        // }
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
                                      image: AssetImage(
                                          "assets/ic_Attandance.png"),
                                      height: MySize.getScaledSizeHeight(30),
                                      width: MySize.getScaledSizeHeight(30),
                                      fit: BoxFit.fill,
                                    ),
                                    Space.width(12),
                                    Text(
                                      "Attendance",
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
                                height: MySize.size52,
                                child: Center(
                                  child: AnimatedContainer(
                                    width: (controller.index.value == 1)
                                        ? MySize.size7
                                        : 00,
                                    height: (controller.index.value == 1)
                                        ? MySize.size52
                                        : 0,
                                    decoration: BoxDecoration(
                                      color: Color(0xff01a7fe),
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(MySize.size12!),
                                        bottomLeft:
                                            Radius.circular(MySize.size12!),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 300),
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
                        //if (Get.currentRoute != Routes.LEAVE) {
                        // controller.currentWidget!.value = Container();
                        controller.currentWidget = LeaveView();
                        controller.count.value++;
                        controller.index.value = 2;
                        // }
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
                            //if (controller.index.value == 2)
                            Positioned(
                              right: 0,
                              child: Container(
                                height: MySize.size52,
                                child: Center(
                                  child: AnimatedContainer(
                                    width: (controller.index.value == 2)
                                        ? MySize.size7
                                        : 00,
                                    height: (controller.index.value == 2)
                                        ? MySize.size52
                                        : 0,
                                    decoration: BoxDecoration(
                                      color: Color(0xff01a7fe),
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(MySize.size12!),
                                        bottomLeft:
                                            Radius.circular(MySize.size12!),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 300),
                                  ),
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
              Space.width(30),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff9fbfc),
                        borderRadius: BorderRadius.only(
                          // topLeft: Radius.circular(MySize.size12!),
                          bottomLeft: Radius.circular(MySize.size42!),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MySize.getScaledSizeWidth(30),
                      ),
                      height: MySize.getScaledSizeHeight(110),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              (controller.index.value == 0)
                                  ? "Dashboard"
                                  : ((controller.index.value == 1)
                                      ? "Attendance"
                                      : (controller.index.value == 2)
                                          ? "Leave"
                                          : "My Profile"),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MySize.size32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                    "assets/ic_noti.png",
                                  ),
                                  height: MySize.size32,
                                  width: MySize.size32,
                                ),
                                Space.width(20),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    MySize.size100!,
                                  ),
                                  child: (!isNullEmptyOrFalse(
                                          box.read(StringConstants.userImage)))
                                      ? CircleAvatar(
                                          radius: MySize.size30,
                                          child: CommonNetworkImageView(
                                            url: imageURL +
                                                box
                                                    .read(StringConstants
                                                        .userImage)
                                                    .toString(),
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: MySize.size30,
                                          child: CommonNetworkImageView(
                                            url: "",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                                Space.width(12),
                                InkWell(
                                  onTap: () {
                                    // Get.offAllNamed(Routes.LOGIN);
                                    // box.write(
                                    //     StringConstants.isUserLogIn, false);
                                    controller.currentWidget =
                                        UserProfileView();
                                    controller.index.value = 5;
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        box.read(StringConstants.userName),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MySize.size18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Space.height(8),
                                      Text(
                                        box.read(StringConstants.role),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: MySize.size14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    if (controller.count.value >= 0)
                      (controller.index.value == 0)
                          ? HomeView()
                          : ((controller.index.value == 1)
                              ? AttandanceView()
                              : (controller.index.value == 2)
                                  ? LeaveView()
                                  : UserProfileView())
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
