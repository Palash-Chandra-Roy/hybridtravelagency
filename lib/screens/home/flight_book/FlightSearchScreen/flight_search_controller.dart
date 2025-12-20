import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/airports_response.dart';
import 'package:hybridtravelagency/navigators/navigators.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_presenter.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';

class FlightSearchController extends GetxController
    with GetSingleTickerProviderStateMixin {
  FlightSearchController(this._flightSearchPresenter);
  final FlightSearchPresenter _flightSearchPresenter;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'ONE WAY'),
    Tab(text: 'ROUNDTRIP'),
    Tab(text: 'MULTICITY'),
  ];

  late TabController tabController;

  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  String originAirportName = '';
  String originAirportCountry = '';
  String destinationAirportName = '';
  String destinationAirportCountry = '';
  String tripType = 'O';
  String departureDate = '';
  String returnDate = '';

  String selectedCabinClass = 'Economy';
  List<AirportData> airportsList = [];
  List<AirportData> popularAirports = [];
  bool isLoading = false;

  int selectedAdults = 0;
  int selectedChildren = 0;
  int selectedInfants = 0;
  final List<int> options = [0,1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List<String> classList = [
    "Economy",
    "Premium Economy",
    "Business",
    "First",
  ];

  // String? selectedClass;

  void updateSelectedClass(String? newClass) {
    selectedCabinClass = newClass!;
    update();
  }

  String roomsAdultsChilds = '';

  void setAdults(int adults) {
    selectedAdults = adults;
    roomsAdultsChilds =
        '$selectedCabinClass Class, $selectedAdults Adults, $selectedChildren Children';
    update();
  }

  void setChildren(int childs) {
    selectedChildren = childs;
    roomsAdultsChilds =
        '$selectedCabinClass Class, $selectedAdults Adults, $selectedChildren Children';
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    getPopularSearches();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  dynamic getPopularSearches() async {
    popularAirports = await SharedPrefUtil.getAirportsSearches();
    update();
  }

  dynamic clearAirportList() {
    airportsList.clear();
    update();
  }

  dynamic onTabTap(dynamic index) {
    switch (index) {
      case 0:
        tripType = 'O';
        break;
      case 1:
        tripType = 'R';
        break;
      case 2:
        tripType = 'M';
        break;
    }
    update();
  }

  dynamic setTravelDate(DateTime date) {
    departureDate = "${date.year}-${date.month}-${date.day}";
    update();
  }

  dynamic setReturnDate(DateTime date) {
    returnDate = "${date.year}-${date.month}-${date.day}";
    update();
  }

  dynamic setOrigin(AirportData airport) {
    originController.text = airport.code!;
    originAirportCountry = airport.countryName!;
    originAirportName = airport.name!;
    update();
  }

  dynamic setDestination(AirportData airport) {
    destinationController.text = airport.code!;
    destinationAirportCountry = airport.countryName!;
    destinationAirportName = airport.name!;
    update();
  }

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  Future<void> getAirports(String query) async {
    try {
      setLoading(true);
      final response = await _flightSearchPresenter.getAirports(
          isLoading: false, query: query);

      if (response != null &&
          response.success == true &&
          response.data != null) {
        airportsList = response.data!;
      }
    } finally {
      setLoading(false);
    }
  }

  Future<void> searchFlights() async {
    if (originController.text.isEmpty) {
      showError("Enter Origin to proceed.");
      return;
    } else if (destinationController.text.isEmpty) {
      showError("Enter Destination to proceed.");
      return;
    } else if (departureDate.isEmpty) {
      showError("Enter Departure Date to proceed.");
      return;
    }

    if (tripType == 'R') {
      if (returnDate.isEmpty) {
        showError("Enter Return Date to proceed.");
        return;
      }
    }

    RouteManagement.goToFlightBookScreen(
        origin: originController.text,
        destination: destinationController.text,
        departureDate: departureDate,
        returnDate: returnDate,
        adults: selectedAdults,
        children: selectedChildren,
        infants: selectedInfants,
        cabinClass: selectedCabinClass,
        tripType: tripType);
  }
}
