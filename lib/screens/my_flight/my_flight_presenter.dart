import 'package:hybridtravelagency/data/responses/get_user_flight_bookings_response.dart';
import 'package:hybridtravelagency/data/usecases/flight_use_cases.dart';

class MyFlightPresenter {
  MyFlightPresenter(this._flightUseCases);

  final FlightUseCases _flightUseCases;

  Future<GetUserFlightBookingsResponse?> getUserFlightBookings({
    required bool isLoading,
  }) async =>
      await _flightUseCases.getUserFlightBookings(
        isLoading: isLoading,
      );

}
