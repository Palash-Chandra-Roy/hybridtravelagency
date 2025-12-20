import 'package:hybridtravelagency/data/responses/get_user_holiday_bookings_response.dart';
import 'package:hybridtravelagency/data/usecases/holidays_use_cases.dart';

class MyHolidaysPresenter {
  MyHolidaysPresenter(this._holidaysUseCases);

  final HolidaysUseCases _holidaysUseCases;

  Future<GetUserHolidayBookingsResponse?> userHolidaysBooking(
      {required bool isLoading,}) async =>
      await _holidaysUseCases.userHolidaysBooking(
        isLoading: isLoading,
      );

}
