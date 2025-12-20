import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/airports_response.dart';
import 'package:hybridtravelagency/data/responses/book_flight_response.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';
import 'package:hybridtravelagency/data/responses/get_flight_booking_details_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_flight_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';

class FlightUseCases {
  FlightUseCases(this._repository);
  final Repository _repository;

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
      await _repository.searchFlight(
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
  Future<RegisterResponse?> flightOffer({
    required bool isLoading,
    required String searchId,
    required String offerId,
  }) async =>
      await _repository.flightOffer(
        isLoading: isLoading,
        searchId: searchId,
        offerId: offerId,
      );
  Future<BookFlightResponse?> flightBook({
    required bool isLoading,
    required Map<dynamic, dynamic> body,
  }) async =>
      await _repository.flightBook(
        isLoading: isLoading,
        body: body
      );
  Future<GetUserFlightBookingsResponse?> getUserFlightBookings({
    required bool isLoading,
  }) async =>
      await _repository.getUserFlightBookings(
        isLoading: isLoading,
      );
  Future<GetFlightBookingDetailsResponse?> getUserFlightBookingDetail(
          {required bool isLoading, required int bookingId}) async =>
      await _repository.getUserFlightBookingDetail(
        isLoading: isLoading,
        bookingId: bookingId,
      );
  Future<GetArtsResponse?> cancelFlightBookingDetail(
          {required bool isLoading, required int userId}) async =>
      await _repository.cancelFlightBookingDetail(
        isLoading: isLoading,
        userId: userId,
      );

  Future<AirportsResponse?> getAirports({
    required bool isLoading,
    required String query
  }) async =>
      await _repository.getAirports(
          isLoading: isLoading,
          query: query
      );
}
