

import 'package:hybridtravelagency/data/responses/airports_response.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';
import 'package:hybridtravelagency/data/usecases/flight_use_cases.dart';

class FlightSearchPresenter {
  FlightSearchPresenter(this._flightUseCases);

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
          tripType:tripType);

  Future<AirportsResponse?> getAirports({
    required bool isLoading,
    required String query
  }) async =>
      await _flightUseCases.getAirports(
          isLoading: isLoading,
          query: query
      );
}
