import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Utilities/text_field.dart';
import 'package:argon_user/Utilities/utility_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../Constants/string_constants.dart';
import '../../../../main.dart';
import '../../../routes/app_pages.dart';
import '../../home_drawer/views/home_drawer_view.dart';
import '../controllers/leave_controller.dart';

class LeaveView extends GetWidget<LeaveController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: HomeDrawerView(),
      appBar: AppBar(
        title: Text('Apply '),
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
        child: Center(
          child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "assets/ic_dashboard.png"),
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
                                      bottomLeft:
                                          Radius.circular(MySize.size12!),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage("assets/ic_leave.png"),
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
                Expanded(
                  child: Container(
                    width: MySize.getScaledSizeWidth(500),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Spacing.height(20),
                          Text(
                            "Apply Leave",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacing.height(20),
                          Obx(() {
                            return Container(
                              width: MySize.getScaledSizeWidth(500),
                              child: SfDateRangePicker(
                                onSelectionChanged: _onSelectionChanged,
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
                                //showTodayButton: true,
                                initialSelectedRange: controller.range.value,
                                initialDisplayDate: DateTime.now(),
                                minDate: DateTime.now(),
                              ),
                            );
                          }),
                          Padding(
                            padding: EdgeInsets.only(top: MySize.size20!),
                            child: Container(
                              width: MySize.getScaledSizeWidth(500),
                              child: Align(
                                child: Text(
                                  "Leave Reason",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          Spacing.height(10),
                          Container(
                            width: MySize.getScaledSizeWidth(500),
                            child: getTextFormField(
                                maxLine: 3,
                                textEditingController:
                                    controller.reasonController.value,
                                validation: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter reason";
                                  }
                                  return null;
                                }),
                          ),
                          Spacing.height(30),
                          Center(
                            child: FlatButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.callApiForApplyLeaveEntry(
                                      context: context);
                                }
                              },
                              color: Colors.blue,
                              child: Text(
                                "Apply Leave",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MySize.size20!,
                    ),
                    child: Obx(() {
                      return Column(
                        children: [
                          Text(
                            "Your Leaves",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacing.height(20),
                          Expanded(
                            child: (controller.hasData.value)
                                ? ((controller.attandanceList.isNotEmpty)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                MySize.getScaledSizeWidth(100)),
                                        child: ListView.separated(
                                          itemBuilder: (context, i) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MySize.getScaledSizeWidth(
                                                          15),
                                                  vertical: MySize.size10!),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        MySize.size12!),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Leave date : ",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  MySize.size16,
                                                            ),
                                                          ),
                                                          Space.width(10),
                                                          Text(
                                                            controller
                                                                    .attandanceList[
                                                                        i]
                                                                    .dateFrom
                                                                    .toString() +
                                                                " - " +
                                                                controller
                                                                    .attandanceList[
                                                                        i]
                                                                    .dateTo
                                                                    .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  MySize.size16,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          // IconButton(
                                                          //   onPressed: () {
                                                          //     DateTime
                                                          //         fromDate =
                                                          //         getDateFromString(
                                                          //             controller
                                                          //                 .attandanceList[
                                                          //                     i]
                                                          //                 .dateFrom
                                                          //                 .toString(),
                                                          //             formatter:
                                                          //                 "yyyy-MM-dd");
                                                          //     DateTime toDate =
                                                          //         getDateFromString(
                                                          //             controller
                                                          //                 .attandanceList[
                                                          //                     i]
                                                          //                 .dateTo
                                                          //                 .toString(),
                                                          //             formatter:
                                                          //                 "yyyy-MM-dd");
                                                          //     controller.range
                                                          //             .value =
                                                          //         PickerDateRange(
                                                          //             fromDate,
                                                          //             toDate);
                                                          //     print(controller
                                                          //         .range.value);
                                                          //   },
                                                          //   icon: Icon(
                                                          //     Icons.edit,
                                                          //     color:
                                                          //         Colors.blue,
                                                          //   ),
                                                          // ),
                                                          // Space.width(15),
                                                          IconButton(
                                                            onPressed: () {
                                                              _asyncConfirmDialog(
                                                                  context, i);
                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Space.height(5),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Reason : ",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              MySize.size16,
                                                        ),
                                                      ),
                                                      Space.width(10),
                                                      Text(
                                                        controller
                                                            .attandanceList[i]
                                                            .reason
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize:
                                                              MySize.size16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Space.height(10),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Status : ",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              MySize.size16,
                                                        ),
                                                      ),
                                                      Space.width(10),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: MySize
                                                              .getScaledSizeWidth(
                                                                  12),
                                                          vertical:
                                                              MySize.size10!,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: (controller
                                                                      .attandanceList[
                                                                          i]
                                                                      .status
                                                                      .toString() ==
                                                                  "in_verify")
                                                              ? Colors.brown
                                                              : (controller
                                                                          .attandanceList[
                                                                              i]
                                                                          .status
                                                                          .toString() ==
                                                                      "verified")
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            MySize.size15!,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          (controller
                                                                      .attandanceList[
                                                                          i]
                                                                      .status
                                                                      .toString() ==
                                                                  "in_verify")
                                                              ? "Pending"
                                                              : (controller
                                                                          .attandanceList[
                                                                              i]
                                                                          .status
                                                                          .toString() ==
                                                                      "rejected")
                                                                  ? "Rejected"
                                                                  : "Approved",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                MySize.size16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Space.height(9),
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, i) {
                                            return Space.height(20);
                                          },
                                          itemCount:
                                              controller.attandanceList.length,
                                          reverse: false,
                                          padding: EdgeInsets.zero,
                                        ),
                                      )
                                    : Center(
                                        child: Text("No any leave found."),
                                      ))
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ],
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _asyncConfirmDialog(BuildContext context, int index) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Leave'),
          content: const Text('Are you sure you want to delete your leave?'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
                controller.callApiForDeleteLeave(
                    context: Get.context!,
                    isFromButton: true,
                    id: controller.attandanceList[index].id.toString());
              },
            )
          ],
        );
      },
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    controller.range.value = args.value;

    // print(range.endDate);
  }
}
