import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Constants/string_constants.dart';
import 'package:argon_user/app/modules/user_profile/views/user_profile_view.dart';
import 'package:argon_user/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import '../../../../Constants/color_constant.dart';
import '../../../../main.dart';
import '../../home_drawer/views/home_drawer_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    MySize().init(context);
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: HomeDrawerView(),
      appBar: AppBar(
        title: Text('Dashboard'),
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
        padding: EdgeInsets.symmetric(
          horizontal: MySize.size15!,
          vertical: MySize.size15!,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Container(
                width: MySize.getScaledSizeWidth(350),
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.size15!, vertical: MySize.size15!),
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: Stream.periodic(
                        const Duration(
                          seconds: 1,
                        ),
                      ),
                      builder: (context, snapshot) {
                        return Center(
                          child: Text(
                            DateFormat('MM/dd/yyyy EEEE \nhh:mm:ss a').format(
                              DateTime.now(),
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: MySize.size20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MySize.size10!,
                      ),
                      child: FlatButton(
                        color: Colors.blue,
                        child: Obx(() {
                          return Text(
                            (controller.webClockIn.value)
                                ? "Clock Out"
                                : "Clock In",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        }),
                        onPressed: () {
                          if (controller.webClockIn.value) {
                            _asyncConfirmDialog(context);
                          } else {
                            controller.callApiForClockInOrOut(context: context);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MySize.size10!,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Today's Hours : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MySize.size18,
                              color: Colors.black,
                            ),
                          ),
                          Obx(() {
                            return Text(
                              controller.hours.value.toString() +
                                  " : " +
                                  controller.minutes.value.toString() +
                                  " : " +
                                  controller.second.value.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: MySize.size18,
                                color: Colors.black,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MySize.size10!,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Today's Entry logs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MySize.size18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MySize.size15!,
                      vertical: MySize.size15!,
                    ),
                    child: (controller.hasData.value)
                        ? ((controller.clockInOutModel != null &&
                                !isNullEmptyOrFalse(
                                    controller.clockInOutModel!.data))
                            ? StickyHeadersTable(
                                rowsLength:
                                    controller.clockInOutModel!.data!.length,
                                columnsLength: controller.columnData.length,
                                columnsTitleBuilder: (i) => TableCell.stickyRow(
                                  controller.columnData[i],
                                  textStyle: textTheme.button!
                                      .copyWith(fontSize: 15.0),
                                ),
                                rowsTitleBuilder: (i) => TableCell.stickyColumn(
                                  "${i + 1}",
                                  textStyle: textTheme.button!
                                      .copyWith(fontSize: 15.0),
                                ),
                                scrollControllers: controller.scrollController,
                                contentCellBuilder: (i, j) => TableCell.content(
                                  getDataText(i, j),
                                  textStyle: textTheme.bodyText2!
                                      .copyWith(fontSize: 12.0),
                                ),
                                legendCell: TableCell.legend(
                                  'No',
                                  textStyle: textTheme.button!
                                      .copyWith(fontSize: 16.5),
                                ),
                              )
                            : const Center(
                                child: Text("No any entry found."),
                              ))
                        : const Center(
                            // child: CircularProgressIndicator(),
                            ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  getDataText(int i, int j) {
    if (i == 0) {
      return controller.clockInOutModel!
          .data![controller.clockInOutModel!.data!.length - (j + 1)].st;
    } else {
      return controller.clockInOutModel!
          .data![controller.clockInOutModel!.data!.length - (j + 1)].time;
    }
  }

  _asyncConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Clock Out'),
          content: const Text('Are you sure you want to clock out time?'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text(
                'Clock out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();

                controller.callApiForClockInOrOut(context: context);
              },
            )
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
