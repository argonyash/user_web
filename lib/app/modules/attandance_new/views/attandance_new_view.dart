import 'package:flutter/material.dart' hide TableCell;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import '../../../../Constants/sizeConstant.dart';
import '../../home/views/home_view.dart';
import '../../home_drawer/views/home_drawer_view.dart';
import '../controllers/attandance_new_controller.dart';

class AttandanceNewView extends GetWidget<AttandanceNewController> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    MySize().init(context);
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.grey.withOpacity(0.2),
      drawer: HomeDrawerView(),
      appBar: AppBar(
        title: Text('Attendance'),
        centerTitle: true,
      ),
      body: Container(
        height: MySize.screenHeight,
        width: MySize.screenWidth,
        padding: EdgeInsets.symmetric(
          horizontal: MySize.size15!,
          vertical: MySize.size15!,
        ),
      ),
    );
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
