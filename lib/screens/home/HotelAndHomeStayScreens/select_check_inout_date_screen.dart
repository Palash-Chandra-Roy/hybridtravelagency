import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/font_family.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/hotel_and_homestay_controller.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/select_check_inout_date_controller.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/widgets/check_inout_cart.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectCheckInOutDateScreen extends StatelessWidget {
  final String from;
  SelectCheckInOutDateScreen({super.key, required this.from});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectCheckInOutControllerDesign>(
      init: SelectCheckInOutControllerDesign(),
      builder: (controller){
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: primary,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: white, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Select $from",
          color: white,
          fontSize: 18,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: CommonTextWidget.PoppinsMedium(
              text: "Reset",
              color: white,
              fontSize: 12,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
              availableCalendarFormats: {
                CalendarFormat.month: 'Month',
              },
              availableGestures: AvailableGestures.none,
              firstDay: DateTime.utc(2021, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: controller.focusedDay,
              calendarFormat: controller.calendarFormat,
              onFormatChanged: (format) {
                controller.onFormatChange(format);
              },
              selectedDayPredicate: (day) {
                return isSameDay(controller.selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(controller.selectedDay, selectedDay)) {
                  controller.onDaySelected(selectedDay, focusedDay);
                }
                print(selectedDay);
              },
              onPageChanged: (focusedDay) {
                controller.focusedDay = focusedDay;
              },
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: FontFamily.PoppinsRegular,
                    color: grey717),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                    color: redCA0, borderRadius: BorderRadius.circular(4)),
                selectedTextStyle: TextStyle(
                  color: white,
                  fontFamily: FontFamily.PoppinsMedium,
                  fontSize: 16,
                ),
                disabledTextStyle: TextStyle(
                  color: grey717,
                  fontFamily: FontFamily.PoppinsRegular,
                  fontSize: 16,
                ),
                todayDecoration: BoxDecoration(
                    color: redCA0, borderRadius: BorderRadius.circular(4)),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamily.PoppinsRegular,
                  color: black2E2,
                ),
                titleCentered: true,
              ),
            ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: grey4B4.withValues(alpha: 0.25),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 20),

                CheckInOutCard(selectedDay:controller.selectedDay,from: from,),

                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CommonButtonWidget.button(
                    buttonColor: primary,
                    onTap: () {
                      if(from.contains('Check-In') || from.contains('Check In')) {
                        Get.find<HotelAndHomeStayController>().setCheckIn(
                            controller.selectedDay);
                      }
                      else if(from.contains('Check-Out') || from.contains('Check Out')) {
                        Get.find<HotelAndHomeStayController>().setCheckOut(
                            controller.selectedDay);
                      }
                      Get.back();
                    },
                    text: "Done",
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      )
    );});
  }
}
