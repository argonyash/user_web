import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Utilities/text_field.dart';
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
                          Container(
                            width: MySize.getScaledSizeWidth(500),
                            child: SfDateRangePicker(
                              onSelectionChanged: _onSelectionChanged,
                              selectionMode: DateRangePickerSelectionMode.range,
                              //showTodayButton: true,
                              initialSelectedRange: controller.range,
                              initialDisplayDate: DateTime.now(),
                              minDate: DateTime.now(),
                            ),
                          ),
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
                    child: Column(
                      children: [
                        Text(
                          "Your Leaves",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    controller.range = args.value;

    // print(range.endDate);
  }
}
