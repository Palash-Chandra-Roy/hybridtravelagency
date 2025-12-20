import 'package:hybridtravelagency/data/responses/get_flight_booking_details_response.dart';
import 'package:hybridtravelagency/data/usecases/flight_use_cases.dart';

class MyFlightDetailsPresenter {
  MyFlightDetailsPresenter(this._flightUseCases);

  final FlightUseCases _flightUseCases;

  Future<GetFlightBookingDetailsResponse?> getUserFlightBookingDetail({
    required bool isLoading,
    required int bookingId,
  }) async =>
      await _flightUseCases.getUserFlightBookingDetail(
          isLoading: isLoading, bookingId: bookingId);
}
