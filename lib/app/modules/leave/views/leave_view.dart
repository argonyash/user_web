import 'package:argon_user/Constants/color_constant.dart';
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
    return GetBuilder<LeaveController>(
        init: LeaveController(),
        builder: (controller) {
          return Expanded(
            child: Row(
              children: [
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
                                onSelectionChanged:
                                    (DateRangePickerSelectionChangedArgs args) {
                                  controller.range.value = args.value;

                                  // print(range.endDate);
                                },
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
                                borderColor: appTheme.textGrayColor,
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
                                                                  context,
                                                                  i,
                                                                  controller);
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                      Expanded(
                                                        child: Text(
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
          );
        });
  }

  _asyncConfirmDialog(BuildContext context, int index, controller) async {
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
