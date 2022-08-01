import 'package:argon_user/Constants/color_constant.dart';
import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Models/AttandanceLIstModel.dart';
import 'package:argon_user/Utilities/customeDialogs.dart';
import 'package:argon_user/Utilities/submit_button.dart';
import 'package:argon_user/Utilities/text_field.dart';
import 'package:argon_user/Utilities/utility_functions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
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
                                        child: GroupedListView<dynamic, String>(
                                          elements: controller.attandanceList,
                                          // shrinkWrap: true,
                                          // physics:
                                          //     NeverScrollableScrollPhysics(),
                                          groupBy: (element) =>
                                              element.dateFrom.substring(0, 7),
                                          groupComparator: (value1, value2) =>
                                              value2.compareTo(value1),
                                          itemComparator: (item1, item2) =>
                                              (item1.dateFrom)
                                                  .compareTo(item2.dateFrom),
                                          order: GroupedListOrder.ASC,
                                          // useStickyGroupSeparators: true,
                                          groupSeparatorBuilder:
                                              (String value) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: MySize.size15!),
                                              child: Text(
                                                DateFormat('MMM, yyyy').format(
                                                    getDateFromString(value,
                                                        formatter: "yyyy-MM")),
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          itemBuilder: (c, element) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  bottom: MySize
                                                      .getScaledSizeHeight(20)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MySize.getScaledSizeWidth(
                                                          15),
                                                  vertical: MySize.size10!),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
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
                                                      // Row(
                                                      //   children: [
                                                      //     // Text(
                                                      //     //   "Leave date : ",
                                                      //     //   style: TextStyle(
                                                      //     //     color:
                                                      //     //         Colors.black,
                                                      //     //     fontWeight:
                                                      //     //         FontWeight
                                                      //     //             .bold,
                                                      //     //     fontSize:
                                                      //     //         MySize.size16,
                                                      //     //   ),
                                                      //     // ),
                                                      //     // Space.width(10),
                                                      //     Text(
                                                      //       element.dateFrom
                                                      //               .toString() +
                                                      //           " - " +
                                                      //           element.dateTo
                                                      //               .toString(),
                                                      //       style: TextStyle(
                                                      //         color:
                                                      //             Colors.black,
                                                      //         fontWeight:
                                                      //             FontWeight
                                                      //                 .bold,
                                                      //         fontSize:
                                                      //             MySize.size20,
                                                      //       ),
                                                      //     ),
                                                      //     Container(
                                                      //       padding: EdgeInsets
                                                      //           .symmetric(
                                                      //         horizontal: MySize
                                                      //             .getScaledSizeWidth(
                                                      //                 12),
                                                      //         vertical: MySize
                                                      //             .size10!,
                                                      //       ),
                                                      //       decoration:
                                                      //           BoxDecoration(
                                                      //         color: (element
                                                      //                     .status
                                                      //                     .toString() ==
                                                      //                 "in_verify")
                                                      //             ? Colors.brown
                                                      //             : (element.status
                                                      //                         .toString() ==
                                                      //                     "verified")
                                                      //                 ? Colors
                                                      //                     .green
                                                      //                 : Colors
                                                      //                     .red,
                                                      //         borderRadius:
                                                      //             BorderRadius
                                                      //                 .circular(
                                                      //           MySize.size15!,
                                                      //         ),
                                                      //       ),
                                                      //       child: Text(
                                                      //         (element.status
                                                      //                     .toString() ==
                                                      //                 "in_verify")
                                                      //             ? "Pending"
                                                      //             : (element.status
                                                      //                         .toString() ==
                                                      //                     "rejected")
                                                      //                 ? "Rejected"
                                                      //                 : "Approved",
                                                      //         style: TextStyle(
                                                      //           color: Colors
                                                      //               .white,
                                                      //           fontWeight:
                                                      //               FontWeight
                                                      //                   .w500,
                                                      //           fontSize: MySize
                                                      //               .size16,
                                                      //         ),
                                                      //       ),
                                                      //     ),
                                                      //   ],
                                                      //   mainAxisAlignment:
                                                      //       MainAxisAlignment
                                                      //           .spaceBetween,
                                                      // ),
                                                      if (element.dateFrom
                                                              .toString() !=
                                                          element.dateTo
                                                              .toString())
                                                        Text(
                                                          DateFormat("EEE, dd MMM").format(
                                                                  getDateFromString(
                                                                      element
                                                                          .dateFrom
                                                                          .toString(),
                                                                      formatter:
                                                                          "yyyy-MM-dd")) +
                                                              "  -  " +
                                                              DateFormat(
                                                                      "EEE, dd MMM")
                                                                  .format(getDateFromString(
                                                                      element
                                                                          .dateTo
                                                                          .toString(),
                                                                      formatter:
                                                                          "yyyy-MM-dd")),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                MySize.size20,
                                                          ),
                                                        )
                                                      else
                                                        Text(
                                                          DateFormat(
                                                                  "EEE, dd MMM")
                                                              .format(getDateFromString(
                                                                  element
                                                                      .dateFrom
                                                                      .toString(),
                                                                  formatter:
                                                                      "yyyy-MM-dd")),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                MySize.size20,
                                                          ),
                                                        ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: MySize
                                                              .getScaledSizeWidth(
                                                                  12),
                                                          vertical:
                                                              MySize.size5!,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: (element.status
                                                                      .toString() ==
                                                                  "in_verify")
                                                              ? Color(
                                                                  0xff01a7fe)
                                                              : (element.status
                                                                          .toString() ==
                                                                      "verified")
                                                                  ? Color(
                                                                      0xff4caf50)
                                                                  : Color(
                                                                      0xfff44336),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            MySize.size8!,
                                                          ),
                                                        ),
                                                        child: Text(
                                                          (element.status
                                                                      .toString() ==
                                                                  "in_verify")
                                                              ? "Awaiting"
                                                              : (element.status
                                                                          .toString() ==
                                                                      "rejected")
                                                                  ? "Rejected"
                                                                  : "Declined",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                MySize.size16,
                                                          ),
                                                        ),
                                                      ),
                                                      // Row(
                                                      //   crossAxisAlignment:
                                                      //       CrossAxisAlignment
                                                      //           .center,
                                                      //   children: [
                                                      //     IconButton(
                                                      //       onPressed: () {
                                                      //         _asyncConfirmDialog(
                                                      //             context,
                                                      //             element,
                                                      //             controller);
                                                      //       },
                                                      //       icon: Icon(
                                                      //         Icons.delete,
                                                      //         color: Colors.red,
                                                      //       ),
                                                      //     ),
                                                      //   ],
                                                      // ),
                                                    ],
                                                  ),
                                                  Space.height(5),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // Text(
                                                      //   "Reason : ",
                                                      //   style: TextStyle(
                                                      //     color: Colors.black,
                                                      //     fontWeight:
                                                      //         FontWeight.bold,
                                                      //     fontSize:
                                                      //         MySize.size16,
                                                      //   ),
                                                      // ),
                                                      Space.width(0),
                                                      Expanded(
                                                        child: Text(
                                                          element.reason
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
                                                  Space.height(5),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: InkWell(
                                                      onTap: () {
                                                        _asyncConfirmDialog(
                                                            context,
                                                            element,
                                                            controller);
                                                      },
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xfff44336),
                                                          fontSize:
                                                              MySize.size16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // Row(
                                                  //   children: [
                                                  //     Text(
                                                  //       "Status : ",
                                                  //       style: TextStyle(
                                                  //         color: Colors.black,
                                                  //         fontWeight:
                                                  //             FontWeight.bold,
                                                  //         fontSize:
                                                  //             MySize.size16,
                                                  //       ),
                                                  //     ),
                                                  //     Space.width(10),
                                                  //     Container(
                                                  //       padding: EdgeInsets
                                                  //           .symmetric(
                                                  //         horizontal: MySize
                                                  //             .getScaledSizeWidth(
                                                  //                 12),
                                                  //         vertical:
                                                  //             MySize.size10!,
                                                  //       ),
                                                  //       decoration:
                                                  //           BoxDecoration(
                                                  //         color: (element.status
                                                  //                     .toString() ==
                                                  //                 "in_verify")
                                                  //             ? Colors.brown
                                                  //             : (element.status
                                                  //                         .toString() ==
                                                  //                     "verified")
                                                  //                 ? Colors.green
                                                  //                 : Colors.red,
                                                  //         borderRadius:
                                                  //             BorderRadius
                                                  //                 .circular(
                                                  //           MySize.size15!,
                                                  //         ),
                                                  //       ),
                                                  //       child: Text(
                                                  //         (element.status
                                                  //                     .toString() ==
                                                  //                 "in_verify")
                                                  //             ? "Pending"
                                                  //             : (element.status
                                                  //                         .toString() ==
                                                  //                     "rejected")
                                                  //                 ? "Rejected"
                                                  //                 : "Approved",
                                                  //         style: TextStyle(
                                                  //           color: Colors.white,
                                                  //           fontWeight:
                                                  //               FontWeight.w500,
                                                  //           fontSize:
                                                  //               MySize.size16,
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  Space.height(9),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        // child: ListView.separated(
                                        //   itemBuilder: (context, i) {
                                        //     return Container(
                                        //       padding: EdgeInsets.symmetric(
                                        //           horizontal:
                                        //               MySize.getScaledSizeWidth(
                                        //                   15),
                                        //           vertical: MySize.size10!),
                                        //       decoration: BoxDecoration(
                                        //         border: Border.all(
                                        //           color: Colors.black,
                                        //         ),
                                        //         borderRadius:
                                        //             BorderRadius.circular(
                                        //                 MySize.size12!),
                                        //       ),
                                        //       child: Column(
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.start,
                                        //         children: [
                                        //           Row(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment
                                        //                     .spaceBetween,
                                        //             crossAxisAlignment:
                                        //                 CrossAxisAlignment
                                        //                     .center,
                                        //             children: [
                                        //               Row(
                                        //                 children: [
                                        //                   Text(
                                        //                     "Leave date : ",
                                        //                     style: TextStyle(
                                        //                       color:
                                        //                           Colors.black,
                                        //                       fontWeight:
                                        //                           FontWeight
                                        //                               .bold,
                                        //                       fontSize:
                                        //                           MySize.size16,
                                        //                     ),
                                        //                   ),
                                        //                   Space.width(10),
                                        //                   Text(
                                        //                     controller
                                        //                             .attandanceList[
                                        //                                 i]
                                        //                             .dateFrom
                                        //                             .toString() +
                                        //                         " - " +
                                        //                         controller
                                        //                             .attandanceList[
                                        //                                 i]
                                        //                             .dateTo
                                        //                             .toString(),
                                        //                     style: TextStyle(
                                        //                       color:
                                        //                           Colors.black,
                                        //                       fontWeight:
                                        //                           FontWeight
                                        //                               .w500,
                                        //                       fontSize:
                                        //                           MySize.size16,
                                        //                     ),
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //               Row(
                                        //                 crossAxisAlignment:
                                        //                     CrossAxisAlignment
                                        //                         .center,
                                        //                 children: [
                                        //                   IconButton(
                                        //                     onPressed: () {
                                        //                       _asyncConfirmDialog(
                                        //                           context,
                                        //                           i,
                                        //                           controller);
                                        //                     },
                                        //                     icon: Icon(
                                        //                       Icons.delete,
                                        //                       color: Colors.red,
                                        //                     ),
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           Space.height(5),
                                        //           Row(
                                        //             crossAxisAlignment:
                                        //                 CrossAxisAlignment
                                        //                     .start,
                                        //             children: [
                                        //               Text(
                                        //                 "Reason : ",
                                        //                 style: TextStyle(
                                        //                   color: Colors.black,
                                        //                   fontWeight:
                                        //                       FontWeight.bold,
                                        //                   fontSize:
                                        //                       MySize.size16,
                                        //                 ),
                                        //               ),
                                        //               Space.width(10),
                                        //               Expanded(
                                        //                 child: Text(
                                        //                   controller
                                        //                       .attandanceList[i]
                                        //                       .reason
                                        //                       .toString(),
                                        //                   style: TextStyle(
                                        //                     color: Colors.black,
                                        //                     fontWeight:
                                        //                         FontWeight.w500,
                                        //                     fontSize:
                                        //                         MySize.size16,
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           Space.height(10),
                                        //           Row(
                                        //             children: [
                                        //               Text(
                                        //                 "Status : ",
                                        //                 style: TextStyle(
                                        //                   color: Colors.black,
                                        //                   fontWeight:
                                        //                       FontWeight.bold,
                                        //                   fontSize:
                                        //                       MySize.size16,
                                        //                 ),
                                        //               ),
                                        //               Space.width(10),
                                        //               Container(
                                        //                 padding: EdgeInsets
                                        //                     .symmetric(
                                        //                   horizontal: MySize
                                        //                       .getScaledSizeWidth(
                                        //                           12),
                                        //                   vertical:
                                        //                       MySize.size10!,
                                        //                 ),
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   color: (controller
                                        //                               .attandanceList[
                                        //                                   i]
                                        //                               .status
                                        //                               .toString() ==
                                        //                           "in_verify")
                                        //                       ? Colors.brown
                                        //                       : (controller
                                        //                                   .attandanceList[
                                        //                                       i]
                                        //                                   .status
                                        //                                   .toString() ==
                                        //                               "verified")
                                        //                           ? Colors.green
                                        //                           : Colors.red,
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(
                                        //                     MySize.size15!,
                                        //                   ),
                                        //                 ),
                                        //                 child: Text(
                                        //                   (controller
                                        //                               .attandanceList[
                                        //                                   i]
                                        //                               .status
                                        //                               .toString() ==
                                        //                           "in_verify")
                                        //                       ? "Pending"
                                        //                       : (controller
                                        //                                   .attandanceList[
                                        //                                       i]
                                        //                                   .status
                                        //                                   .toString() ==
                                        //                               "rejected")
                                        //                           ? "Rejected"
                                        //                           : "Approved",
                                        //                   style: TextStyle(
                                        //                     color: Colors.white,
                                        //                     fontWeight:
                                        //                         FontWeight.w500,
                                        //                     fontSize:
                                        //                         MySize.size16,
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           Space.height(9),
                                        //         ],
                                        //       ),
                                        //     );
                                        //   },
                                        //   separatorBuilder: (context, i) {
                                        //     return Space.height(20);
                                        //   },
                                        //   itemCount:
                                        //       controller.attandanceList.length,
                                        //   reverse: false,
                                        //   padding: EdgeInsets.zero,
                                        // ),
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
                ),
                Expanded(
                  child: Container(
                    width: MySize.getScaledSizeWidth(500),
                    child: Obx(() {
                      return Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Spacing.height(20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: MySize.getScaledSizeWidth(50),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.applyLeave.value = true;
                                  },
                                  child: button(
                                    width: 150,
                                    textColor: Colors.white,
                                    title: "Leave Apply",
                                    fontsize: MySize.size20!,

                                    backgroundColor: Color(0xff01a7fe),

                                    // backgroundColor: appTheme.
                                  ),
                                ),
                              ),
                            ),
                            // Text(
                            //   "Apply Leave",
                            //   style: TextStyle(
                            //       color: Colors.black,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            Spacing.height(20),
                            if (controller.applyLeave.value)
                              Column(
                                children: [
                                  Obx(() {
                                    return Container(
                                      width: MySize.getScaledSizeWidth(500),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/calendar.png"),
                                              height: MySize.size30,
                                              width: MySize.size30,
                                            ),
                                            padding:
                                                EdgeInsets.all(MySize.size10!),
                                            decoration: BoxDecoration(
                                                color: Color(0xff01a7fe),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  MySize.size10!,
                                                )),
                                          ),
                                          Space.width(20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Date",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MySize.size16!,
                                                ),
                                              ),
                                              if (controller.range.value
                                                          .endDate !=
                                                      null &&
                                                  (controller.range.value
                                                          .startDate !=
                                                      controller
                                                          .range.value.endDate))
                                                Text(
                                                  DateFormat("EEE, dd MMM yyyy")
                                                          .format(controller
                                                              .range
                                                              .value
                                                              .startDate!) +
                                                      " - " +
                                                      DateFormat(
                                                              "EEE, dd MMM yyyy")
                                                          .format(controller
                                                              .range
                                                              .value
                                                              .endDate!),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: MySize.size16!,
                                                      color: Colors.grey),
                                                )
                                              else
                                                Text(
                                                  DateFormat("EEE, dd MMM yyyy")
                                                      .format(controller.range
                                                          .value.startDate!),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: MySize.size16!,
                                                      color: Colors.grey),
                                                )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                  Space.height(30),
                                  Obx(() {
                                    return Container(
                                      width: MySize.getScaledSizeWidth(500),
                                      child: SfDateRangePicker(
                                        onSelectionChanged:
                                            (DateRangePickerSelectionChangedArgs
                                                args) {
                                          controller.range.value = args.value;

                                          if (controller.range.value != null) {
                                            if (controller
                                                    .range.value.endDate !=
                                                null) {
                                              controller.count.value =
                                                  controller
                                                      .range.value.endDate!
                                                      .difference(controller
                                                          .range
                                                          .value
                                                          .startDate!)
                                                      .inDays;

                                              if (controller.count.value == 0) {
                                                controller.count.value = 1;
                                              } else {
                                                controller.count.value++;
                                              }
                                            } else {
                                              controller.count.value = 1;
                                            }
                                          }
                                        },
                                        headerStyle: DateRangePickerHeaderStyle(
                                          textAlign: TextAlign.center,
                                        ),
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                        //showTodayButton: true,
                                        initialSelectedRange:
                                            controller.range.value,
                                        initialDisplayDate: DateTime.now(),
                                        minDate: DateTime.now(),
                                      ),
                                    );
                                  }),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: MySize.size20!),
                                    child: Container(
                                      width: MySize.getScaledSizeWidth(500),
                                      child: Align(
                                        child: Text(
                                          "Cause",
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
                                        fillColor: Color(0xfff3fbff),
                                        hintText: "Enter Cause",
                                        // hintTextStyle: TextStyle(
                                        //   color: Colors.black,
                                        //   fontWeight: FontWeight.bold,
                                        // ),
                                        borderRadius: MySize.size12!,
                                        isFillColor: true,
                                        textEditingController:
                                            controller.reasonController.value,

                                        // borderColor: appTheme.textGrayColor,
                                        validation: (val) {
                                          if (val!.isEmpty) {
                                            return "Please enter reason";
                                          }
                                          return null;
                                        }),
                                  ),
                                  Spacing.height(30),
                                  Center(
                                    child: InkWell(
                                      child: button(
                                        title:
                                            "Apply For ${controller.count.value} Days Leave",
                                        backgroundColor: Color(0xff01a7fe),
                                      ),
                                      onTap: () {
                                        if (controller.formKey.currentState!
                                            .validate()) {
                                          DateTime fromDate =
                                              controller.range.value.startDate!;
                                          DateTime? toDate;
                                          if (controller.range.value.endDate !=
                                              null) {
                                            toDate =
                                                controller.range.value.endDate!;
                                          } else {
                                            toDate = controller
                                                .range.value.startDate!;
                                          }

                                          bool base = false;
                                          controller.attandanceList
                                              .forEach((element) {
                                            if ((toDate!.isBefore(getDateFromString(element.dateTo!, formatter: 'yyyy-MM-dd')) &&
                                                    fromDate.isAfter(
                                                        getDateFromString(
                                                            element.dateFrom!,
                                                            formatter:
                                                                'yyyy-MM-dd'))) ||
                                                (toDate.isBefore(getDateFromString(element.dateTo!, formatter: 'yyyy-MM-dd')) &&
                                                    toDate.isAfter(getDateFromString(
                                                        element.dateFrom!,
                                                        formatter:
                                                            'yyyy-MM-dd'))) ||
                                                (fromDate.isBefore(getDateFromString(element.dateTo!, formatter: 'yyyy-MM-dd')) &&
                                                    fromDate.isAfter(
                                                        getDateFromString(
                                                            element.dateFrom!,
                                                            formatter:
                                                                'yyyy-MM-dd'))) ||
                                                (DateTime(getDateFromString(element.dateTo!, formatter: 'yyyy-MM-dd').year, getDateFromString(element.dateTo!, formatter: 'yyyy-MM-dd').month, getDateFromString(element.dateTo!, formatter: 'yyyy-MM-dd').day) ==
                                                    DateTime(toDate.year, toDate.month, toDate.day)) ||
                                                (DateTime(
                                                      getDateFromString(
                                                              element.dateTo!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .year,
                                                      getDateFromString(
                                                              element.dateTo!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .month,
                                                      getDateFromString(
                                                              element.dateTo!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .day,
                                                    ) ==
                                                    DateTime(
                                                      fromDate.year,
                                                      fromDate.month,
                                                      fromDate.day,
                                                    )) ||
                                                (DateTime(
                                                      getDateFromString(
                                                              element.dateFrom!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .year,
                                                      getDateFromString(
                                                              element.dateFrom!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .month,
                                                      getDateFromString(
                                                              element.dateFrom!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .day,
                                                    ) ==
                                                    DateTime(
                                                      toDate.year,
                                                      toDate.month,
                                                      toDate.day,
                                                    )) ||
                                                (DateTime(
                                                      getDateFromString(
                                                              element.dateFrom!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .year,
                                                      getDateFromString(
                                                              element.dateFrom!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .month,
                                                      getDateFromString(
                                                              element.dateFrom!,
                                                              formatter:
                                                                  'yyyy-MM-dd')
                                                          .day,
                                                    ) ==
                                                    DateTime(
                                                      fromDate.year,
                                                      fromDate.month,
                                                      fromDate.day,
                                                    ))) {
                                              // isDateBetween = true;
                                              base = true;
                                            }
                                          });
                                          if (!base) {
                                            controller
                                                .callApiForApplyLeaveEntry(
                                                    context: context);
                                          } else {
                                            app.resolve<CustomDialogs>().getDialog(
                                                title: "Leave",
                                                desc:
                                                    "Already leave applied on selected day.");
                                          }
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  _asyncConfirmDialog(
      BuildContext context, Attandance index, controller) async {
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
                    id: index.id.toString());
              },
            )
          ],
        );
      },
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    controller.range.value = args.value;
  }
}
