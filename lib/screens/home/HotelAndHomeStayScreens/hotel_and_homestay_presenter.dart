

import 'package:hybridtravelagency/data/responses/get_hotel_destinations_response.dart';
import 'package:hybridtravelagency/data/responses/search_hotels_response.dart';
import 'package:hybridtravelagency/data/usecases/hotels_use_cases.dart';

class HotelAndHomeStayPresenter {
  HotelAndHomeStayPresenter(this._hotelsUseCases);

  final HotelsUseCases _hotelsUseCases;


  Future<List<GetHotelDestinationsResponse>?> getHotelDestinations({
    required bool isLoading,
    required String search
  }) async =>
      await _hotelsUseCases.getHotelsDestinations(
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
      await _hotelsUseCases.hotelsSearch(
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
}
