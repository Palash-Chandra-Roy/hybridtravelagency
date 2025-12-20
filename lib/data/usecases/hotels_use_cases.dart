import 'package:hybridtravelagency/data/repositories/repository.dart';
import 'package:hybridtravelagency/data/responses/get_art_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_destinations_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_facilities_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_types_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_hotel_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';
import 'package:hybridtravelagency/data/responses/search_hotels_response.dart';

class HotelsUseCases {
  HotelsUseCases(this._repository);

  final Repository _repository;

  Future<GetHotelTypesResponse?> getHotelsTypes(
      {required bool isLoading}) async =>
      await _repository.getHotelsTypes(
        isLoading: isLoading,

      );

  Future<GetHotelFacilitiesResponse?> getHotelsFacilities(
      {required bool isLoading,}) async =>
      await _repository.getHotelsFacilities(
        isLoading: isLoading,

      );

  Future<List<GetHotelDestinationsResponse>?> getHotelsDestinations(
      {required bool isLoading,
        required String search}) async =>
      await _repository.getHotelsDestinations(
        isLoading: isLoading,
        search: search

      );

  Future<SearchHotelsResponse?> hotelsSearch({
    required bool isLoading,
    required String destination,
    required String checkIn,
    required String checkOut,
    required String adults,
    required String children,
    required String rooms,
    required String countryCode,
    required String currency,
    required List<int> hotelTypesIds
  }) async =>
      await _repository.hotelsSearch(
          isLoading: isLoading,
          destination: destination,
          checkIn: checkIn,
          checkOut: checkOut,
          adults: adults,
          children: children,
          rooms: rooms,
          countryCode: countryCode,
          currency: currency,
      hotelTypesIds: hotelTypesIds);

  Future<GetArtsResponse?> getHotelsDetail(
          {required bool isLoading, required int hotelId}) async =>
      await _repository.getHotelsDetail(
        isLoading: isLoading,
        hotelId: hotelId,
      );

  Future<RegisterResponse?> hotelsBook({
    required bool isLoading,
    required String hotelId,
    required String roomId,
    required String checkIn,
    required String checkOut,
    required List guests,
    required String paymentMethod,
  }) async =>
      await _repository.hotelsBook(
        isLoading: isLoading,
        hotelId: hotelId,
        roomId: roomId,
        checkIn: checkIn,
        checkOut: checkOut,
        guests: guests,
        paymentMethod: paymentMethod,
      );

  Future<GetUserHotelBookingsResponse?> getHotelsBookings({
    required bool isLoading,
  }) async =>
      await _repository.getHotelsBookings(
        isLoading: isLoading,
      );
  Future<GetArtsResponse?> getHotelsBookingsDetail({
    required bool isLoading,
    required int hotelId,
  }) async =>
      await _repository.getHotelsBookingsDetail(
        isLoading: isLoading,
        hotelId: hotelId,
      );
  Future<GetArtsResponse?> cancelHotelsBooking({
    required bool isLoading,
    required int hotelId,
  }) async =>
      await _repository.cancelHotelsBooking(
        isLoading: isLoading,
        hotelId: hotelId,
      );
}
