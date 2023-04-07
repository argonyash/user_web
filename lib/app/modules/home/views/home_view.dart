import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/Utilities/submit_button.dart';
import 'package:argon_user/app/modules/user_profile/views/user_profile_view.dart';
import 'package:argon_user/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import '../../../../Constants/api_constants.dart';
import '../../../../Constants/color_constant.dart';
import '../../../../Models/chart_sample_data.dart';
import '../../../../Utilities/utility_functions.dart';
import '../../../../main.dart';
import '../../home_drawer/views/home_drawer_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<HomeController>(
      assignId: true,
      init: HomeController(),
      builder: (controller) {
        return Obx(() {
          return Expanded(
            child: (controller.myHasData.isFalse)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: MySize.screenHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Average Hours:- ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MySize.size26,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "${(Duration(seconds: controller.monthTotalTime.value).inHours / controller.dataList.length).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MySize.size26,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: MySize.getScaledSizeHeight(400),
                              width: MySize.getScaledSizeWidth(500),
                              child: SfCartesianChart(
                                plotAreaBorderWidth: 0,
                                title: ChartTitle(
                                    text:
                                        "${DateFormat("MMM").format(controller.selectedMonth.value)} / ${controller.selectedMonth.value.year}"),
                                primaryXAxis: CategoryAxis(
                                  majorGridLines: MajorGridLines(width: 0),
                                ),
                                primaryYAxis: NumericAxis(
                                    axisLine: AxisLine(width: 0),
                                    labelFormat: '{value}',
                                    title: AxisTitle(text: "Hours"),
                                    majorTickLines: MajorTickLines(size: 0)),
                                series: _getDefaultColumnSeries(
                                    controller: controller),
                                tooltipBehavior: TooltipBehavior(
                                  enable: true,
                                  header: '',
                                  canShowMarker: false,
                                  format: 'point.x - point.y',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Color(0xfff9fbfc),
                            //     borderRadius: BorderRadius.only(
                            //       // topLeft: Radius.circular(MySize.size12!),
                            //       bottomLeft: Radius.circular(MySize.size42!),
                            //     ),
                            //   ),
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: MySize.getScaledSizeWidth(30),
                            //   ),
                            //   height: MySize.getScaledSizeHeight(110),
                            //   child: Center(
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           "Dashboard",
                            //           style: TextStyle(
                            //             color: Colors.black,
                            //             fontSize: MySize.size32,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //         Row(
                            //           crossAxisAlignment: CrossAxisAlignment.center,
                            //           children: [
                            //             Image(
                            //               image: AssetImage(
                            //                 "assets/ic_noti.png",
                            //               ),
                            //               height: MySize.size32,
                            //               width: MySize.size32,
                            //             ),
                            //             Space.width(20),
                            //             ClipRRect(
                            //               borderRadius: BorderRadius.circular(
                            //                 MySize.size100!,
                            //               ),
                            //               child: (!isNullEmptyOrFalse(
                            //                       box.read(StringConstants.userImage)))
                            //                   ? CircleAvatar(
                            //                       radius: MySize.size30,
                            //                       child: CommonNetworkImageView(
                            //                         url: imageURL +
                            //                             box
                            //                                 .read(StringConstants.userImage)
                            //                                 .toString(),
                            //                         fit: BoxFit.fill,
                            //                       ),
                            //                     )
                            //                   : CircleAvatar(
                            //                       radius: MySize.size30,
                            //                       child: CommonNetworkImageView(
                            //                         url: "",
                            //                         fit: BoxFit.fill,
                            //                       ),
                            //                     ),
                            //             ),
                            //             Space.width(12),
                            //             InkWell(
                            //               onTap: () {
                            //                 Get.offAllNamed(Routes.LOGIN);
                            //                 box.write(StringConstants.isUserLogIn, false);
                            //               },
                            //               child: Column(
                            //                 crossAxisAlignment: CrossAxisAlignment.start,
                            //                 mainAxisAlignment: MainAxisAlignment.center,
                            //                 children: [
                            //                   Text(
                            //                     box.read(StringConstants.userName),
                            //                     style: TextStyle(
                            //                       fontWeight: FontWeight.bold,
                            //                       fontSize: MySize.size18,
                            //                       color: Colors.black,
                            //                     ),
                            //                   ),
                            //                   Space.height(8),
                            //                   Text(
                            //                     box.read(StringConstants.role),
                            //                     style: TextStyle(
                            //                       fontWeight: FontWeight.w400,
                            //                       fontSize: MySize.size14,
                            //                       color: Colors.black,
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             )
                            //           ],
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Container(
                              width: MySize.getScaledSizeWidth(350),
                              padding: EdgeInsets.symmetric(
                                  horizontal: MySize.size15!,
                                  vertical: MySize.size15!),
                              child: Column(
                                children: [
                                  // StreamBuilder(
                                  //   stream: Stream.periodic(
                                  //     const Duration(
                                  //       seconds: 1,
                                  //     ),
                                  //   ),
                                  //   builder: (context, snapshot) {
                                  //     return Center(
                                  //       child: Text(
                                  //         DateFormat('MM/dd/yyyy EEEE \nhh:mm:ss a')
                                  //             .format(
                                  //           DateTime.now(),
                                  //         ),
                                  //         textAlign: TextAlign.center,
                                  //         style: TextStyle(
                                  //           fontSize: MySize.size20,
                                  //           fontWeight: FontWeight.bold,
                                  //         ),
                                  //       ),
                                  //     );
                                  //   },
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MySize.size18!,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller
                                                    .totalMonthHourVisibleCounter++;
                                              },
                                              child: Text(
                                                "Today's Hours : ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: MySize.size26,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            (controller.totalMonthHourVisibleCounter
                                                        .value >
                                                    5)
                                                ? Text(
                                                    "${Duration(seconds: controller.monthTotalTime.value).inHours}",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: MySize.size26,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                        Space.height(15),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MySize.getScaledSizeWidth(
                                                          10),
                                                  vertical: MySize.size12!),
                                              decoration: BoxDecoration(
                                                color: Color(0xfff3fbff),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        MySize.size12!),
                                              ),
                                              child: Obx(() {
                                                return Text(
                                                  controller.hours.value
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: MySize.size18,
                                                    color: Colors.black,
                                                  ),
                                                );
                                              }),
                                            ),
                                            Text(
                                              " : ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MySize.size22,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MySize.getScaledSizeWidth(
                                                          10),
                                                  vertical: MySize.size12!),
                                              decoration: BoxDecoration(
                                                color: Color(0xfff3fbff),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        MySize.size12!),
                                              ),
                                              child: Obx(() {
                                                return Text(
                                                  controller.minutes.value
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: MySize.size18,
                                                    color: Colors.black,
                                                  ),
                                                );
                                              }),
                                            ),
                                            Text(
                                              " : ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MySize.size22,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MySize.getScaledSizeWidth(
                                                          10),
                                                  vertical: MySize.size12!),
                                              decoration: BoxDecoration(
                                                color: Color(0xfff3fbff),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        MySize.size12!),
                                              ),
                                              child: Obx(() {
                                                return Text(
                                                  controller.second.value
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: MySize.size18,
                                                    color: Colors.black,
                                                  ),
                                                );
                                              }),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: MySize.size20!,
                                    ),
                                    child: Obx(() {
                                      return InkWell(
                                        onTap: () {
                                          if (controller.webClockIn.value) {
                                            _asyncConfirmDialog(
                                                context, controller);
                                          } else {
                                            controller.callApiForClockInOrOut(
                                                context: context);
                                          }
                                        },
                                        child: button(
                                            title: (controller.webClockIn.value)
                                                ? "Clock Out"
                                                : "Clock In",
                                            backgroundColor: Color(0xff01a7fe),
                                            width: 200,
                                            radius: 20,
                                            fontsize: 22),
                                      );
                                    }),
                                    // child: FlatButton(
                                    //   color: Colors.blue,
                                    //   child: Obx(() {
                                    //     return Text(
                                    //       (controller.webClockIn.value)
                                    //           ? "Clock Out"
                                    //           : "Clock In",
                                    //       style: TextStyle(
                                    //         color: Colors.white,
                                    //       ),
                                    //     );
                                    //   }),
                                    //   onPressed: () {
                                    //     if (controller.webClockIn.value) {
                                    //       _asyncConfirmDialog(context);
                                    //     } else {
                                    //       controller.callApiForClockInOrOut(
                                    //           context: context);
                                    //     }
                                    //   },
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Space.width(15),
                            //     Card(
                            //       child: Container(
                            //         width: MySize.getScaledSizeWidth(350),
                            //         padding: EdgeInsets.symmetric(
                            //             horizontal: MySize.size15!,
                            //             vertical: MySize.size15!),
                            //         child: Column(
                            //           crossAxisAlignment: CrossAxisAlignment.center,
                            //           children: [
                            //             Text(
                            //               box.read(StringConstants.userName),
                            //               style: TextStyle(
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: MySize.size18,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //             Space.height(10),
                            //             Text(
                            //               box.read(StringConstants.userEmailAddress),
                            //               style: TextStyle(
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: MySize.size18,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //             Space.height(10),
                            //             Text(
                            //               box.read(StringConstants.role).toString(),
                            //               style: TextStyle(
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: MySize.size18,
                            //                 color: Colors.black,
                            //               ),
                            //             ),
                            //             Space.height(10),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MySize.size60!,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Today's Entry logs",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MySize.size26,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Obx(() {
                                return Center(
                                  child: (controller.hasData.value)
                                      ? ((controller.clockInOutModel != null &&
                                              !isNullEmptyOrFalse(controller
                                                  .clockInOutModel!.data))
                                          ? Center(
                                              child: Container(
                                                width:
                                                    MySize.getScaledSizeWidth(
                                                        500),
                                                padding: EdgeInsets.only(
                                                    top: MySize
                                                        .getScaledSizeHeight(
                                                            40)),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: MySize
                                                          .getScaledSizeWidth(
                                                              500),
                                                      height: MySize
                                                          .getScaledSizeHeight(
                                                              45),
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: MySize
                                                              .getScaledSizeWidth(
                                                                  15)),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff01a7fe),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(MySize
                                                                    .size14!),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "NO.",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  MySize.size20,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            "STATUS",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  MySize.size20,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            "TIME",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  MySize.size20,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Space.height(20),
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            for (int i = 0;
                                                                i <
                                                                    controller
                                                                        .clockInOutModel!
                                                                        .data!
                                                                        .length;
                                                                i++)
                                                              Container(
                                                                width: MySize
                                                                    .getScaledSizeWidth(
                                                                        500),
                                                                height: MySize
                                                                    .getScaledSizeHeight(
                                                                        45),
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        MySize.getScaledSizeWidth(
                                                                            15)),
                                                                margin: EdgeInsets.only(
                                                                    bottom: MySize
                                                                        .getScaledSizeHeight(
                                                                            15)),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xfff9fbfc),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          MySize
                                                                              .size14!),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Center(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            (i + 1).toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: MySize.size20,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            controller.clockInOutModel!.data![controller.clockInOutModel!.data!.length - (i + 1)].time.toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: MySize.size20,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .clockInOutModel!
                                                                            .data![controller.clockInOutModel!.data!.length -
                                                                                (i + 1)]
                                                                            .st
                                                                            .toString()
                                                                            .toUpperCase(),
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: MySize.size20,
                                                                            color: Colors.black),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Space.height(40),
                                                  ],
                                                ),
                                                // child: IntrinsicWidth(
                                                //   child: StickyHeadersTable(
                                                //       rowsLength: controller
                                                //           .clockInOutModel!
                                                //           .data!
                                                //           .length,
                                                //       columnsLength:
                                                //           controller.columnData.length,
                                                //       columnsTitleBuilder: (i) => Text(
                                                //           controller.columnData[i]),
                                                //       rowsTitleBuilder: (i) =>
                                                //           TableCell.stickyColumn(
                                                //             "${i + 1}",
                                                //             textStyle: textTheme.button!
                                                //                 .copyWith(
                                                //                     fontSize: 15.0),
                                                //           ),
                                                //       scrollControllers:
                                                //           controller.scrollController,
                                                //       contentCellBuilder: (i, j) =>
                                                //           TableCell.content(
                                                //             getDataText(i, j),
                                                //             textStyle: textTheme
                                                //                 .bodyText2!
                                                //                 .copyWith(
                                                //                     fontSize: 12.0),
                                                //           ),
                                                //       legendCell: Text("No")),
                                                // ),
                                              ),
                                            )
                                          : const Center(
                                              child:
                                                  Text("No any entry found."),
                                            ))
                                      : const Center(
                                          // child: CircularProgressIndicator(),
                                          ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        });
      },
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries(
      {required HomeController controller}) {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: controller.chartData,
        xValueMapper: (ChartSampleData sales, _) =>
            sales.x.toString().split("-")[2],
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        pointColorMapper: (ChartSampleData sales, index) =>
            (sales.y! > 8 && sales.y! <= 10)
                ? Colors.orange
                : (sales.y! > 10)
                    ? Colors.red
                    : Colors.blue,
      )
    ];
  }

  getDataText(int i, int j, controller) {
    if (i == 0) {
      return controller.clockInOutModel!
          .data![controller.clockInOutModel!.data!.length - (j + 1)].st;
    } else {
      return controller.clockInOutModel!
          .data![controller.clockInOutModel!.data!.length - (j + 1)].time;
    }
  }

  _asyncConfirmDialog(BuildContext context, controller) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Clock Out',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          content: const Text('Are you sure you want to clock out time?'),
          actions: <Widget>[
            // FlatButton(
            //   child: const Text('Cancel'),
            //
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MySize.getScaledSizeWidth(10),
                  vertical: MySize.size8!,
                ),
                child: button(
                    title: "Cancel",
                    textColor: Colors.black,
                    backgroundColor: Color(0xfff9fbfc),
                    width: 120,
                    radius: 100,
                    fontsize: 18),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();

                controller.callApiForClockInOrOut(context: context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MySize.getScaledSizeWidth(10),
                  vertical: MySize.size8!,
                ),
                child: button(
                    title: "Clock out",
                    backgroundColor: Color(0xff01a7fe),
                    width: 120,
                    radius: 100,
                    fontsize: 18),
              ),
            ),

            // FlatButton(
            //   child: const Text(
            //     'Clock out',
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            //   color: Colors.blue,
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //
            //     controller.callApiForClockInOrOut(context: context);
            //   },
            // )
          ],
        );
      },
    );
  }
}

class TableCell extends StatelessWidget {
  TableCell.content(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.blue,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.legend(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.blue,
    this.onTap,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.blue,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.only(left: 0.0);

  TableCell.stickyRow(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.blue,
    this.onTap,
  })  : cellWidth = cellDimensions.contentCellWidth,
        cellHeight = cellDimensions.stickyLegendHeight,
        _colorHorizontalBorder = Colors.white,
        _colorVerticalBorder = Colors.blue,
        _textAlign = TextAlign.center,
        _padding = EdgeInsets.zero;

  TableCell.stickyColumn(
    this.text, {
    this.textStyle,
    this.cellDimensions = CellDimensions.base,
    this.colorBg = Colors.white,
    this.onTap,
  })  : cellWidth = cellDimensions.stickyLegendWidth,
        cellHeight = cellDimensions.contentCellHeight,
        _colorHorizontalBorder = Colors.blue,
        _colorVerticalBorder = Colors.black38,
        _textAlign = TextAlign.start,
        _padding = EdgeInsets.only(left: 0.0);

  final CellDimensions cellDimensions;

  final String text;
  final Function()? onTap;

  final double? cellWidth;
  final double? cellHeight;

  final Color colorBg;
  final Color _colorHorizontalBorder;
  final Color _colorVerticalBorder;

  final TextAlign _textAlign;
  final EdgeInsets _padding;

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cellWidth,
        height: cellHeight,
        padding: _padding,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Text(
                  text,
                  style: textStyle,
                  maxLines: 2,
                  textAlign: _textAlign,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.1,
              color: _colorVerticalBorder,
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: _colorHorizontalBorder),
              right: BorderSide(color: _colorHorizontalBorder),
            ),
            color: colorBg),
      ),
    );
  }
}
