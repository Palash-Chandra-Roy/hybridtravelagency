import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/models/passenger_model.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_presenter.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

class FlightBookController extends GetxController
    with GetSingleTickerProviderStateMixin {
  FlightBookController(this._flightBookPresenter);
  final FlightBookPresenter _flightBookPresenter;
  dynamic  selectedIndex;

  dynamic onIndexChange(dynamic index) {
    selectedIndex = index;
    update();
  }

  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextWidget.PoppinsMedium(
            text: "Cheapest",
            fontSize: 10,
            textAlign: TextAlign.center,
          ),
          CommonTextWidget.PoppinsMedium(
            text: "₹ 5,956 | 2 h 15m",
            fontSize: 9,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextWidget.PoppinsMedium(
            text: "Fastest",
            fontSize: 10,
            textAlign: TextAlign.center,
          ),
          CommonTextWidget.PoppinsMedium(
            text: "₹ 11,956 | 1 h 15m",
            fontSize: 9,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Tab(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonTextWidget.PoppinsMedium(
            text: "You May Prefer",
            fontSize: 10,
            textAlign: TextAlign.center,
          ),
          CommonTextWidget.PoppinsMedium(
            text: "₹ 8,956 | 2 h",
            fontSize: 9,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ];

  late TabController tabController;
  bool isLoading = false;
  bool isBookingLoading = false;
  List<Offers> sortedOffers = [];
  List<Offers> allOffers = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (Get.arguments != null) {
        origin = Get.arguments['origin'] ?? '';
        destination = Get.arguments['destination'] ?? '';
        departureDate = Get.arguments['departureDate'] ?? '';
        returnDate = Get.arguments['returnDate'] ?? '';
        adults = Get.arguments['adults'] ?? 0;
        children = Get.arguments['children'] ?? 0;
        infants = Get.arguments['infants'] ?? 0;
        cabinClass = Get.arguments['cabinClass'] ?? '';
        tripType = Get.arguments['tripType'] ?? '';

        searchFlights();
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  var click = false.obs;

  String origin = '';
  String destination = '';
  String departureDate = '';
  String returnDate = '';
  int adults = 0;
  int children = 0;
  int infants = 0;
  String cabinClass = '';
  String tripType = '';

  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  dynamic setBookingLoading(dynamic value) {
    isBookingLoading = value;
    update();
  }

  FlightData? flightData;
  int? expandedIndex;

  void toggleExpand(int index) {
    if (expandedIndex == index) {
      expandedIndex = null; // collapse if clicked again
    } else {
      expandedIndex = index; // expand new one
    }
    update();
  }

  Future<void> searchFlights() async {
    setLoading(true);
    try {
      String formattedCabinClass = cabinClass.toLowerCase().replaceAll(' ', '_');
      final response = await _flightBookPresenter.searchFlight(
          isLoading: false,
          origin: origin,
          destination: destination,
          departureDate: departureDate,
          returnDate: returnDate,
          adults: adults,
          children: children,
          infants: infants,
          cabinClass: formattedCabinClass,
          tripType: tripType);

      if (response != null && response.success == true) {
        flightData = response.data!.data!.data!;
        allOffers = flightData!.offers!;
        applySort(allOffers, SharedPrefUtil.sortSelections);
        // Get.snackbar(
        //   "Success",
        //   response.message ?? "Registration successful",
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );
      }
    } catch (e) {
      debugPrint("Search Flight error: $e");
    } finally {
      setLoading(false);
    }
  }

  Future<void> bookFlight(String passengerId, double percentage,
      double extraBagsAmount, double amount, double totalWithCommission) async {
    setBookingLoading(true);
    List<PassengerModel> passengers = [
      PassengerModel(
        id: passengerId,
        type: "adult",
        title: "${SharedPrefUtil.user!.salutation}",
        givenName: "${SharedPrefUtil.user!.name}",
        familyName: "",
        email: "${SharedPrefUtil.user!.email}",
        phoneNumber: "${SharedPrefUtil.user!.phone}",
        bornOn: "",
        gender: "${SharedPrefUtil.user!.age}",
      ),
      // Add more passengers here...
    ];

    var body = {
      "percentage": percentage,
      "passengers": passengers.map((p) => p.toJson()).toList(),
      "extra_bags_amount": extraBagsAmount,
      "currency": "USD",
      "amount": amount,
      "totalWithCommission": totalWithCommission,
      "checkFlightType": "Flights International"
    };

    try {
      final response =
          await _flightBookPresenter.flightBook(isLoading: false, body: body);

      if (response != null && response.success == true) {
        // flightData = response.data!.data!.data!;
        // Get.snackbar(
        //   "Success",
        //   response.message ?? "Registration successful",
        //   snackPosition: SnackPosition.TOP,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );
      }
    } catch (e) {
      debugPrint("Book Flight error: $e");
    } finally {
      setBookingLoading(false);
    }
  }

  void applySort(List<Offers> offers, Map<String, dynamic> sortSelections) {
    var sorted = List<Offers>.from(offers);

    // Sort by Price
    if (sortSelections.containsKey("price")) {
      final priceOption = sortSelections["price"];
      if (priceOption == 0) {
        // None → skip sorting
      } else if (priceOption == 1) {
        sorted.sort((a, b) => (double.parse(a.totalAmount ?? '0'))
            .compareTo(double.parse(b.totalAmount ?? '0'))); // Cheapest first
      } else if (priceOption == 2) {
        sorted.sort((a, b) => (double.parse(b.totalAmount ?? '0'))
            .compareTo(double.parse(a.totalAmount ?? '0'))); // Highest first
      }
    }

    // Sort by Duration (sum of slice durations)
    if (sortSelections.containsKey("duration")) {
      final durationOption = sortSelections["duration"];

      int durationOf(Offers o) {
        return parseDuration(
          o.slices!.last.segments!.last.arrivingAt!,
          o.slices!.first.segments!.first.departingAt!,
        );
      }

      if (durationOption == 0) {
        // None → skip sorting
      } else if (durationOption == 1) {
        sorted.sort((a, b) => durationOf(a).compareTo(durationOf(b))); // Shortest
      } else if (durationOption == 2) {
        sorted.sort((a, b) => durationOf(b).compareTo(durationOf(a))); // Longest
      }
    }

    // Sort by Departure Time
    if (sortSelections.containsKey("departure time")) {
      final depOption = sortSelections["departure time"];

      DateTime? departureOf(Offers o) =>
          DateTime.tryParse(o.slices!.first.segments!.first.departingAt ?? "");

      if (depOption == 0) {
        // None → skip sorting
      } else if (depOption == 1) {
        sorted.sort((a, b) => departureOf(a)!.compareTo(departureOf(b)!)); // Earliest
      } else if (depOption == 2) {
        sorted.sort((a, b) => departureOf(b)!.compareTo(departureOf(a)!)); // Latest
      }
    }

    // Sort by Arrival Time
    if (sortSelections.containsKey("arrival time")) {
      final arrOption = sortSelections["arrival time"];

      DateTime? arrivalOf(Offers o) =>
          DateTime.tryParse(o.slices!.last.segments!.last.arrivingAt ?? "");

      if (arrOption == 0) {
        // None → skip sorting
      } else if (arrOption == 1) {
        sorted.sort((a, b) => arrivalOf(a)!.compareTo(arrivalOf(b)!)); // Earliest
      } else if (arrOption == 2) {
        sorted.sort((a, b) => arrivalOf(b)!.compareTo(arrivalOf(a)!)); // Latest
      }
    }

    // Stops filter
    if (sortSelections.containsKey("stops")) {
      final stopsOption = sortSelections["stops"];
      if (stopsOption != null && stopsOption > 0) {
        sorted= sorted.where((offer) {
          final stopCount = (offer.slices?.first.segments?.length ?? 1) - 1;
          if (stopsOption == 1) return stopCount == 0; // Nonstop
          if (stopsOption == 2) return stopCount == 1; // 1 stop
          if (stopsOption == 3) return stopCount >= 2; // 2+ stops
          return true;
        }).toList();
      }
    }

    // Departure time slot filter
    if (sortSelections.containsKey("departure_at")) {
      final depOption = sortSelections["departure_at"];
      if (depOption != null && depOption > 0) {
        sorted = sorted.where((offer) {
          final depTime =
          DateTime.tryParse(offer.slices!.first.segments!.first.departingAt ?? "");
          if (depTime == null) return false;

          final hour = depTime.hour;
          if (depOption == 1) return hour < 6; // before 6AM
          if (depOption == 2) return hour >= 6 && hour < 12; // 6AM–12
          if (depOption == 3) return hour >= 12 && hour < 18; // 12–6PM
          if (depOption == 4) return hour >= 18; // after 6PM
          return true;
        }).toList();
      }
    }

    // Arrival time slot filter
    if (sortSelections.containsKey("arrival_at")) {
      final arrOption = sortSelections["arrival_at"];
      if (arrOption != null && arrOption > 0) {
        sorted = sorted.where((offer) {
          final arrTime =
          DateTime.tryParse(offer.slices!.last.segments!.last.arrivingAt ?? "");
          if (arrTime == null) return false;

          final hour = arrTime.hour;
          if (arrOption == 1) return hour < 6; // before 6AM
          if (arrOption == 2) return hour >= 6 && hour < 12; // 6AM–12
          if (arrOption == 3) return hour >= 12 && hour < 18; // 12–6PM
          if (arrOption == 4) return hour >= 18; // after 6PM
          return true;
        }).toList();
      }
    }

    // Airline filter (multi-select)
    if (sortSelections.containsKey("airlines")) {
      final selectedAirlines = sortSelections["airlines"];
      if (selectedAirlines.isNotEmpty) {
        sorted = sorted
            .where((offer) => selectedAirlines.contains(offer.owner?.name ?? ""))
            .toList();
      }
    }

    // Refundable filter
    if (sortSelections.containsKey("refundable")) {
      final refundableOnly = sortSelections["refundable"] == true;
      if (refundableOnly) {
        sorted =
            sorted.where((offer) => offer.conditions!.refundBeforeDeparture!=null? offer.conditions!.refundBeforeDeparture!.allowed == true: false).toList();
      }
    }

    sortedOffers.clear();
    sortedOffers = sorted;
    update();
  }

}
