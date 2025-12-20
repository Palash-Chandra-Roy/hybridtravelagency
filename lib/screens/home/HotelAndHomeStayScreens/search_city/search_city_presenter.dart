

import 'package:hybridtravelagency/data/responses/get_hotel_destinations_response.dart';
import 'package:hybridtravelagency/data/usecases/hotels_use_cases.dart';

class SearchCityPresenter {
  SearchCityPresenter(this._hotelsUseCases);

  final HotelsUseCases _hotelsUseCases;


  Future<List<GetHotelDestinationsResponse>?> getHotelDestinations({
    required bool isLoading,
    required String search
  }) async =>
      await _hotelsUseCases.getHotelsDestinations(
          isLoading: isLoading,
          search: search
      );
}
