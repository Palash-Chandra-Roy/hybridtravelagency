import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_destinations_response.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/search_city/search_city_presenter.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';

class SearchCityController extends GetxController
    with GetSingleTickerProviderStateMixin {
  SearchCityController(this._searchCityPresenter);
  final SearchCityPresenter _searchCityPresenter;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'ONE WAY'),
    Tab(text: 'ROUNDTRIP'),
    Tab(text: 'MULTICITY'),
  ];

  late TabController tabController;
  String destinationText = '';
  String destinationId = '';
  TextEditingController destinationController = TextEditingController();

  List<GetHotelDestinationsResponse> destinationsList = [];
  List<GetHotelDestinationsResponse> recentDestinationsList = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();

    getRecentSearches();
  }


  dynamic setDestination(GetHotelDestinationsResponse destination){
    destinationController.text = destination.text??'';
    destinationText = destination.text??'';
    destinationId = destination.id??'';
    getRecentSearches();
    update();
  }

  dynamic getRecentSearches() async {
    recentDestinationsList = await SharedPrefUtil.getDestinationsSearches();
    update();
  }

  dynamic clearDestinationList(){
    destinationsList.clear();
    update();
  }


  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> getDestinations(String query) async {
    try {
      setLoading(true);
      final response =
      await _searchCityPresenter.getHotelDestinations(isLoading: false, search: query);

      if (response != null) {
        destinationsList = response;

      }
    } finally {
      setLoading(false);
    }
  }

  // Future<void> searchFlights() async {
  //
  //   if (destinationController.text.isEmpty) {
  //     showError("Enter Origin to proceed.");
  //     return;
  //   }
  //   else if (destinationController.text.isEmpty) {
  //     showError("Enter Destination to proceed.");
  //     return;
  //   }
  //   else if (departureDate.isEmpty) {
  //     showError("Enter Departure Date to proceed.");
  //     return;
  //   }
  //
  //   if(tripType=='R'){
  //     if (returnDate.isEmpty) {
  //       showError("Enter Return Date to proceed.");
  //       return;
  //     }
  //   }
  //
  //   RouteManagement.goToFlightBookScreen(
  //       origin: destinationController.text,
  //       destination: destinationController.text,
  //       departureDate: departureDate,
  //       returnDate: returnDate,
  //       adults: adults,
  //       children: children,
  //       infants: infants,
  //       cabinClass: cabinClass,
  //       tripType: tripType);
  //
  // }

}
