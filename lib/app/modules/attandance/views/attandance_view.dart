import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:flutter/material.dart' hide TableCell;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../../home_drawer/views/home_drawer_view.dart';
import '../controllers/attandance_controller.dart';

class AttandanceView extends GetWidget<AttandanceController> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    MySize().init(context);
    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.white,
        // drawer: HomeDrawerView(),
        // appBar: AppBar(
        //   title: Text('Attandance'),
        //   centerTitle: true,
        // ),
        body: Container(
          height: MySize.screenHeight,
          width: MySize.screenWidth,
          padding: EdgeInsets.symmetric(
              // horizontal: MySize.size15!,
              //vertical: MySize.size15!,
              ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () async {
                      DateTime? selected = await showMonthYearPicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019),
                        lastDate: DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                        ),
                      );

                      if (selected != null) {
                        controller.selected = selected;
                        controller.now.value = selected;
                        controller.callApiForGetTodayEntry(
                            context: context, isFromButton: true);
                      }

                      // print(selected);
                    },
                    color: Colors.blue,
                    child: const Text(
                      "Select Month",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MySize.getScaledSizeHeight(10),
                      bottom: MySize.getScaledSizeHeight(10),
                    ),
                    child: Text((controller.now.value.month ==
                            DateTime.now().month)
                        ? "This Month"
                        : DateFormat('MMM, yyyy').format(controller.now.value)),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        (controller.hasData.value)
                            ? ((!isNullEmptyOrFalse(controller.attandanceList))
                                ? Container(
                                    width: MySize.getScaledSizeWidth(600),
                                    child: StickyHeadersTable(
                                      rowsLength:
                                          controller.attandanceList.length,
                                      columnsLength:
                                          controller.columnData.length,
                                      columnsTitleBuilder: (i) =>
                                          TableCell.stickyRow(
                                        controller.columnData[i],
                                        textStyle: textTheme.button!
                                            .copyWith(fontSize: 15.0),
                                      ),
                                      rowsTitleBuilder: (i) =>
                                          TableCell.stickyColumn(
                                        "${i + 1}",
                                        textStyle: textTheme.button!
                                            .copyWith(fontSize: 15.0),
                                      ),
                                      scrollControllers:
                                          controller.scrollController,
                                      contentCellBuilder: (i, j) =>
                                          TableCell.content(
                                        getDataTextForDay(i, j),
                                        onTap: () {
                                          controller.getDataOfDay.clear();
                                          controller.getDataOfDay.addAll(
                                              controller
                                                  .attandanceList[controller
                                                          .attandanceList
                                                          .length -
                                                      (j + 1)]
                                                  .data!);
                                          controller.selectedDate.value =
                                              controller
                                                  .attandanceList[controller
                                                          .attandanceList
                                                          .length -
                                                      (j + 1)]
                                                  .date
                                                  .toString();
                                        },
                                        textStyle: textTheme.bodyText2!
                                            .copyWith(fontSize: 12.0),
                                      ),
                                      legendCell: TableCell.legend(
                                        'No',
                                        textStyle: textTheme.button!
                                            .copyWith(fontSize: 16.5),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: MySize.getScaledSizeWidth(600),
                                    child: const Center(
                                      child: Text("No any entry found."),
                                    ),
                                  ))
                            : Container(
                                width: MySize.getScaledSizeWidth(600),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                        Column(
                          children: [
                            Text(
                              controller.selectedDate.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MySize.size18!,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacing.height(10),
                            Expanded(
                                child: (!isNullEmptyOrFalse(
                                        controller.getDataOfDay))
                                    ? Container(
                                        width: MySize.getScaledSizeWidth(300),
                                        child: StickyHeadersTable(
                                          rowsLength:
                                              controller.getDataOfDay.length,
                                          columnsLength: controller
                                              .columnDataForDay.length,
                                          columnsTitleBuilder: (i) =>
                                              TableCell.stickyRow(
                                            controller.columnDataForDay[i],
                                            textStyle: textTheme.button!
                                                .copyWith(fontSize: 15.0),
                                          ),
                                          rowsTitleBuilder: (i) =>
                                              TableCell.stickyColumn(
                                            "${i + 1}",
                                            textStyle: textTheme.button!
                                                .copyWith(fontSize: 15.0),
                                          ),
                                          scrollControllers:
                                              controller.scrollController1,
                                          contentCellBuilder: (i, j) =>
                                              TableCell.content(
                                            getDataText(i, j),
                                            textStyle: textTheme.bodyText2!
                                                .copyWith(fontSize: 12.0),
                                          ),
                                          legendCell: TableCell.legend(
                                            'No',
                                            textStyle: textTheme.button!
                                                .copyWith(fontSize: 16.5),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: MySize.getScaledSizeWidth(300),
                                        child: const Center(
                                          child: Text("No any entry found."),
                                        ),
                                      )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  getDataText(int i, int j) {
    if (i == 0) {
      return controller
          .getDataOfDay[controller.getDataOfDay.length - (j + 1)].st;
    } else {
      return controller
          .getDataOfDay[controller.getDataOfDay.length - (j + 1)].time;
    }
  }

  getDataTextForDay(int i, int j) {
    if (i == 0) {
      return controller
          .attandanceList[controller.attandanceList.length - (j + 1)].date;
      // return "aa";
    } else {
      // return controller.clockInOutModel!
      //     .data![controller.clockInOutModel!.data!.length - (j + 1)].time;

      if (!isNullEmptyOrFalse(controller
          .attandanceList[controller.attandanceList.length - (j + 1)].data)) {
        return controller.getTotalTime(int.parse(controller
            .attandanceList[controller.attandanceList.length - (j + 1)]
            .data!
            .last
            .total
            .toString()));
      }
      return controller.getTotalTime(0);
    }
  }
}
