import 'package:argon_user/Constants/api_constants.dart';
import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Constants/string_constants.dart';
import '../../../../Utilities/utility_functions.dart';
import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../../home_drawer/views/home_drawer_view.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetWidget<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKey,
        drawer: HomeDrawerView(),
        appBar: AppBar(
          title: Text('User Profile'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.LOGIN);

                box.write(StringConstants.isUserLogIn, false);
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
          ],
        ),
        body: Container(
          height: MySize.screenHeight,
          width: MySize.screenWidth,
          padding: EdgeInsets.only(top: MySize.size15!),
          child: (controller.hasData.value)
              ? (controller.userProfileModel != null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            MySize.size100!,
                          ),
                          child: (!isNullEmptyOrFalse(
                                  controller.userProfileModel!.img))
                              ? CircleAvatar(
                                  radius: MySize.size60,
                                  child: CommonNetworkImageView(
                                    url: imageURL +
                                        controller.userProfileModel!.img
                                            .toString(),
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: MySize.size60,
                                  child: CommonNetworkImageView(
                                    url: "",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MySize.size20!,
                          ),
                          child: Text(
                            isNullEmptyOrFalse(
                                    controller.userProfileModel!.name)
                                ? "N/A"
                                : controller.userProfileModel!.name.toString(),
                            style: TextStyle(
                              fontSize: MySize.size24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MySize.size20!,
                          ),
                          child: getDataWithTitlle(
                              name: "Email : ",
                              data: (isNullEmptyOrFalse(
                                      controller.userProfileModel!.email)
                                  ? "N/A"
                                  : controller.userProfileModel!.email
                                      .toString())),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MySize.size20!,
                          ),
                          child: getDataWithTitlle(
                              name: "Mobile No. : ",
                              data: (isNullEmptyOrFalse(
                                      controller.userProfileModel!.mobile)
                                  ? "N/A"
                                  : controller.userProfileModel!.mobile
                                      .toString())),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MySize.size20!,
                          ),
                          child: getDataWithTitlle(
                              name: "Address : ",
                              data: (isNullEmptyOrFalse(
                                      controller.userProfileModel!.adr)
                                  ? "N/A"
                                  : controller.userProfileModel!.adr
                                      .toString())),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MySize.size20!,
                          ),
                          child: getDataWithTitlle(
                            name: "Gender : ",
                            data: (isNullEmptyOrFalse(
                                    controller.userProfileModel!.gender)
                                ? "N/A"
                                : controller.userProfileModel!.gender
                                    .toString()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MySize.size20!,
                          ),
                          child: getDataWithTitlle(
                            name: "Role : ",
                            data: (isNullEmptyOrFalse(
                                    controller.userProfileModel!.role)
                                ? "N/A"
                                : controller.userProfileModel!.role.toString()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MySize.size20!,
                          ),
                          child: getDataWithTitlle(
                            name: "Salary : ",
                            data: (isNullEmptyOrFalse(
                                    controller.userProfileModel!.salary)
                                ? "N/A"
                                : controller.userProfileModel!.salary
                                    .toString()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MySize.size20!,
                          ),
                          child: getDataWithTitlle(
                            name: "Joining Date : ",
                            data: (isNullEmptyOrFalse(
                                    controller.userProfileModel!.joining)
                                ? "N/A"
                                : controller.userProfileModel!.joining
                                    .toString()),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     top: MySize.size20!,
                        //   ),
                        //   child: getDataWithTitlle(
                        //     name: "Joining Date : ",
                        //     data: (isNullEmptyOrFalse(
                        //             controller.userProfileModel!.joining)
                        //         ? "N/A"
                        //         : DateFormat('yyyy-MM-dd').format(
                        //             getDateFromString(
                        //                 controller.userProfileModel!.joining
                        //                     .toString(),
                        //                 formatter: "yyyy-MM-dd HH:mm:ss"),
                        //           )),
                        //   ),
                        // ),
                      ],
                    )
                  : Center(
                      child: Text("No data found."),
                    )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      );
    });
  }

  Row getDataWithTitlle({String? name, String? data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name.toString(),
          style: TextStyle(
            fontSize: MySize.size24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data.toString(),
          style: TextStyle(
            fontSize: MySize.size22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
