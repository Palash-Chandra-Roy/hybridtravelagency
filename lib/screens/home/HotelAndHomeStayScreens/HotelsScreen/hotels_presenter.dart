

import 'package:hybridtravelagency/data/responses/search_hotels_response.dart';
import 'package:hybridtravelagency/data/usecases/hotels_use_cases.dart';

class HotelsPresenter {
  HotelsPresenter(this._hotelsUseCases);

  final HotelsUseCases _hotelsUseCases;


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
