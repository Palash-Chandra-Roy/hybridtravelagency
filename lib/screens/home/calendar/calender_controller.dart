import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderControllerDesign extends GetxController{
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  late DateTime selectedDay;
  Map<DateTime, List> eventsList = {};
  // ignore: prefer_typing_uninitialized_variables
  dynamic  formattedDate;



  @override
  void onInit() {
    // TODO: implement onInit
    selectedDay = focusedDay;
    super.onInit();
  }

  dynamic onFormatChange(dynamic format){
    if (calendarFormat != format) {
      calendarFormat = format;
      update();
    }
  }

  dynamic onDaySelected(dynamic daySelected,dayFocus){
    selectedDay = daySelected;
    focusedDay = dayFocus;
    update();
  }
}