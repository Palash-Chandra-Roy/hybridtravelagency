import 'package:hybridtravelagency/data/responses/get_user_hotel_bookings_response.dart';
import 'package:hybridtravelagency/data/usecases/hotels_use_cases.dart';

class MyHotelPresenter {
  MyHotelPresenter(this._hotelsUseCases);

  final HotelsUseCases _hotelsUseCases;

  Future<GetUserHotelBookingsResponse?> getHotelsBookings({
    required bool isLoading,
  }) async =>
      await _hotelsUseCases.getHotelsBookings(
        isLoading: isLoading,
      );

}
