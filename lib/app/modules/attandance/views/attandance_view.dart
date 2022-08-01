import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:argon_user/Utilities/utility_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide TableCell;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
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
    return GetBuilder<AttandanceController>(
      assignId: true,
      init: AttandanceController(),
      builder: (controller) {
        // return Obx(() {
        return Obx(() {
          return Expanded(
              child: (controller.hasData.isTrue)
                  ? Padding(
                      padding: EdgeInsets.only(
                          right: MySize.getScaledSizeWidth(32),
                          bottom: MySize.getScaledSizeHeight(32)),
                      child: SfCalendar(
                        view: CalendarView.month,
                        allowViewNavigation: false,
                        monthViewSettings: MonthViewSettings(
                            appointmentDisplayMode:
                                MonthAppointmentDisplayMode.appointment),
                        dataSource:
                            MeetingDataSource(_getDataSource(controller)),
                        viewHeaderStyle: ViewHeaderStyle(),

                        // initialDisplayDate: DateTime.now(),
                        showNavigationArrow: true,

                        //initialSelectedDate: DateTime.now(),
                        allowAppointmentResize: true,

                        appointmentTextStyle: TextStyle(
                          fontSize: MySize.size20,
                          color: Colors.white,
                        ),

                        scheduleViewSettings: ScheduleViewSettings(
                          appointmentItemHeight: 500,
                        ),
                        appointmentBuilder: appointmentBuilder,
                        allowedViews: <CalendarView>[
                          //CalendarView.day,
                          // CalendarView.workWeek,
                          // CalendarView.week,
                          CalendarView.month,
                          // CalendarView.timelineDay,
                          // CalendarView.timelineWeek,
                          // CalendarView.timelineWorkWeek,
                          // CalendarView.timelineMonth,
                          CalendarView.schedule
                        ],
                        headerStyle: CalendarHeaderStyle(
                          textAlign: TextAlign.center,
                        ),
                        // cellEndPadding: 20,
                      ),
                    )
                  // ? Padding(
                  //     padding: EdgeInsets.only(
                  //         right: MySize.getScaledSizeWidth(32),
                  //         bottom: MySize.getScaledSizeHeight(32)),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Icon(
                  //               Icons.arrow_back_ios,
                  //             ),
                  //             Text(
                  //               controller.now.toString(),
                  //             ),
                  //             Icon(
                  //               Icons.arrow_forward_ios,
                  //             ),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   )
                  : Center(
                      child: CircularProgressIndicator(),
                    ));
        });
        // });
      },
    );
  }

  // _appointMentBuilder(BuildContext context,CalendarAppointmentDetails)? a){
  //
  // }
  Widget appointmentBuilder(BuildContext context,
      CalendarAppointmentDetails calendarAppointmentDetails) {
    // final ins = 1;
    final Meeting appointment = calendarAppointmentDetails.appointments.first;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int i = 0;
              i < calendarAppointmentDetails.appointments.length;
              i++)
            Container(
              width: calendarAppointmentDetails.bounds.width,
              // height: calendarAppointmentDetails.bounds.height,
              padding: EdgeInsets.symmetric(
                horizontal: MySize.getScaledSizeWidth(10),
              ),
              color: appointment.background,
              child: Text(
                appointment.eventName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MySize.size13,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  getDataText(int i, int j, controller) {
    if (i == 0) {
      return controller
          .getDataOfDay[controller.getDataOfDay.length - (j + 1)].st;
    } else {
      return controller
          .getDataOfDay[controller.getDataOfDay.length - (j + 1)].time;
    }
  }

  getDataTextForDay(int i, int j, controller) {
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

List<Meeting> _getDataSource(AttandanceController controller) {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  controller.leaveList.forEach((element) {
    if (element.status == "verified") {
      meetings.add(Meeting(
          "Leave",
          getDateFromString(element.dateFrom!, formatter: 'yyyy-MM-dd'),
          getDateFromString(element.dateTo!, formatter: 'yyyy-MM-dd'),
          Colors.green,
          true));
    }
  });

  controller.attandanceList.forEach((element) {
    bool isDateBetween = false;
    meetings.forEach((element2) {
      if (getDateFromString(element.date!, formatter: 'yyyy-MM-dd')
                  .isBefore(element2.to) &&
              getDateFromString(element.date!, formatter: 'yyyy-MM-dd')
                  .isAfter(element2.from) ||
          (DateTime(
                  getDateFromString(element.date!, formatter: 'yyyy-MM-dd')
                      .year,
                  getDateFromString(element.date!, formatter: 'yyyy-MM-dd')
                      .month,
                  getDateFromString(element.date!, formatter: 'yyyy-MM-dd')
                      .day) ==
              DateTime(element2.to.year, element2.to.month, element2.to.day)) ||
          (DateTime(
                  getDateFromString(element.date!, formatter: 'yyyy-MM-dd')
                      .year,
                  getDateFromString(element.date!, formatter: 'yyyy-MM-dd')
                      .month,
                  getDateFromString(element.date!, formatter: 'yyyy-MM-dd')
                      .day) ==
              DateTime(element2.from.year, element2.from.month,
                  element2.from.day))) {
        isDateBetween = true;
      }
    });
    if (!isDateBetween) {
      if (getDateFromString(element.date!, formatter: 'yyyy-MM-dd').weekday ==
          7) {
        meetings.add(Meeting(
            "Holiday",
            getDateFromString(element.date!, formatter: 'yyyy-MM-dd'),
            getDateFromString(element.date!, formatter: 'yyyy-MM-dd'),
            Colors.teal,
            false));
      }
      if (element.data!.isNotEmpty) {
        if (!isNullEmptyOrFalse(element.data!.last.total)) {
          meetings.add(Meeting(
              controller
                  .getTotalTime(int.parse(element.data!.last.total.toString())),
              getDateFromString(element.date!, formatter: 'yyyy-MM-dd'),
              getDateFromString(element.date!, formatter: 'yyyy-MM-dd'),
              Colors.red,
              true));
        }
      }
    }
    // controller.leaveList.forEach((element2) {
    //   if (getDateFromString(element.date!, formatter: 'yyyy-MM-dd').isBefore(
    //           getDateFromString(element2.dateTo!, formatter: 'yyyy-MM-dd')) &&
    //       getDateFromString(element.date!, formatter: 'yyyy-MM-dd').isAfter(
    //           getDateFromString(element2.dateFrom!, formatter: 'yyyy-MM-dd'))) {
    //   } else {
    //     if (element2.status == "verified") {
    //       meetings.add(Meeting(
    //           "Leave",
    //           getDateFromString(element2.dateFrom!, formatter: 'yyyy-MM-dd'),
    //           getDateFromString(element2.dateTo!, formatter: 'yyyy-MM-dd'),
    //           Colors.green,
    //           true));
    //     }
    //   }
    // });
  });
  controller.allHolidayList.forEach((element) {
    meetings.add(Meeting(
        element.des.toString(),
        getDateFromString(element.date1!, formatter: 'yyyy-MM-dd'),
        getDateFromString(element.date2!, formatter: 'yyyy-MM-dd'),
        const Color(0xFF0F8644),
        true));
  });
  // meetings.add(
  //     Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), true));
  // meetings.add(Meeting(
  //     'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
