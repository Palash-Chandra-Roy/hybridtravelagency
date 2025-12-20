import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_user_activity_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_flight_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_holiday_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_hotel_bookings_response.dart';
import 'package:hybridtravelagency/screens/MyTripScreen/my_trip_presenter.dart';

class MyTripController extends GetxController with GetTickerProviderStateMixin {
  MyTripController(this._myTripPresenter);

  final MyTripPresenter _myTripPresenter;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'UPCOMING'),
    Tab(text: 'CANCELLED'),
    Tab(text: 'COMPLETED'),
    Tab(text: 'UNSUCCESSFUL'),
  ];

  late TabController tabController;
  late TabController bookingController;
  late TabController cancelController;
  final List<Tab> bookingTabs = <Tab>[
    Tab(text: 'Flight'),
    Tab(text: 'Activity'),
    Tab(text: 'Hotel'),
    Tab(text: 'Holidays'),
  ];
  final List<Tab> cancelTabs = <Tab>[
    Tab(text: 'Flight'),
    Tab(text: 'Activity'),
    Tab(text: 'Hotel'),
    Tab(text: 'Holidays'),
  ];

  // Loading states
  bool isFlightBookingsLoading = false;
  bool isActivityBookingsLoading = false;
  bool isHotelBookingsLoading = false;
  bool isHolidayBookingsLoading = false;

  // Booking data
  List<FlightBookingData>? flightBookings;
  List<ActivityData>? activityBookings;
  List<HotelBookingData>? hotelBookings;
  List<HolidayBookingData>? holidayBookings;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    bookingController = TabController(vsync: this, length: bookingTabs.length);
    cancelController = TabController(vsync: this, length: cancelTabs.length);

    // Fetch all bookings when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAllBookings();
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    bookingController.dispose();
    cancelController.dispose();
    super.onClose();
  }

  // Fetch all bookings
  void fetchAllBookings() {
    getFlightBookings();
    getActivityBookings();
    getHotelBookings();
    getHolidayBookings();
  }

  // Flight Bookings
  Future<void> getFlightBookings() async {
    isFlightBookingsLoading = true;
    update();

    try {
      final response = await _myTripPresenter.getUserFlightBookings(
        isLoading: false,
      );

      if (response != null && response.success == true) {
        flightBookings = response.data;
      } else {
        flightBookings = [];
      }
    } catch (e) {
      debugPrint("Error fetching flight bookings: $e");
      flightBookings = [];
    } finally {
      isFlightBookingsLoading = false;
      update();
    }
  }

  // Activity Bookings
  Future<void> getActivityBookings() async {
    isActivityBookingsLoading = true;
    update();

    try {
      final response = await _myTripPresenter.getUserActivitiesBookings(
        isLoading: false,
      );

      if (response != null && response.success == true) {
        activityBookings = response.data;
      } else {
        activityBookings = [];
      }
    } catch (e) {
      debugPrint("Error fetching activity bookings: $e");
      activityBookings = [];
    } finally {
      isActivityBookingsLoading = false;
      update();
    }
  }

  // Hotel Bookings
  Future<void> getHotelBookings() async {
    isHotelBookingsLoading = true;
    update();

    try {
      final response = await _myTripPresenter.getHotelsBookings(
        isLoading: false,
      );

      if (response != null && response.success == true) {
        hotelBookings = response.data;
      } else {
        hotelBookings = [];
      }
    } catch (e) {
      debugPrint("Error fetching hotel bookings: $e");
      hotelBookings = [];
    } finally {
      isHotelBookingsLoading = false;
      update();
    }
  }

  // Holiday Bookings
  Future<void> getHolidayBookings() async {
    isHolidayBookingsLoading = true;
    update();

    try {
      final response = await _myTripPresenter.getUserHolidaysBookings(
        isLoading: false,
      );

      if (response != null && response.success == true) {
        holidayBookings = response.data;
      } else {
        holidayBookings = [];
      }
    } catch (e) {
      debugPrint("Error fetching holiday bookings: $e");
      holidayBookings = [];
    } finally {
      isHolidayBookingsLoading = false;
      update();
    }
  }
}
