

import 'package:hybridtravelagency/data/responses/book_flight_response.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';
import 'package:hybridtravelagency/data/usecases/flight_use_cases.dart';

class FlightBookPresenter {
  FlightBookPresenter(this._flightUseCases);

  final FlightUseCases _flightUseCases;

  Future<SearchFlightsResponse?> searchFlight({
    required bool isLoading,
    required String origin,
    required String destination,
    required String departureDate,
    required String returnDate,
    required int adults,
    required int children,
    required int infants,
    required String cabinClass,
    required String tripType,
  }) async =>
      await _flightUseCases.searchFlight(
          isLoading: isLoading,
          origin: origin,
          destination: destination,
          departureDate: departureDate,
          returnDate: returnDate,
          adults: adults,
          children: children,
          infants: infants,
          cabinClass: cabinClass,
          tripType: tripType);

  Future<BookFlightResponse?> flightBook({
    required bool isLoading,
    required Map<dynamic, dynamic> body,
  }) async =>
      await _flightUseCases.flightBook(
        isLoading: isLoading,
        body: body
      );
}
