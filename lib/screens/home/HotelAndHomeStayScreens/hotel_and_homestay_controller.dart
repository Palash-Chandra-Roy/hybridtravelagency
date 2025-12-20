import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_destinations_response.dart';
import 'package:hybridtravelagency/navigators/routes_management.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/hotel_and_homestay_presenter.dart';
import 'package:hybridtravelagency/utils/utils.dart';

class HotelAndHomeStayController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HotelAndHomeStayController(this._hotelAndHomeStayPresenter);
  final HotelAndHomeStayPresenter _hotelAndHomeStayPresenter;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'UPTO 5 ROOMS'),
    Tab(text: '5+ROOMS'),
  ];
  final List<int> selectedIds = [];
  late TabController tabController;
  String destinationText = '';
  String destinationId = '';
  String checkIn = '';
  String checkInDisplay = '';
  String checkOut = '';
  String checkOutDisplay = '';
  String roomsAdultsChilds = '';

  int selectedRooms = 1;
  int selectedAdults = 1;
  int selectedChildren = 1;
  final List<int> options = List.generate(10, (index) => index + 1);
  @override
  void onInit() {
    super.onInit();
    roomsAdultsChilds =
    '$selectedRooms Rooms, $selectedAdults Adults, $selectedChildren Children';
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void setDestination(GetHotelDestinationsResponse destination) {
    destinationText = destination.text!;
    destinationId = destination.id!;
    update();
  }

  void setCheckIn(DateTime selectedDay) {
    checkInDisplay =
        "${dateFormatter.format(selectedDay)} ${dayFormatter.format(selectedDay)}, ${yearFormatter.format(selectedDay)}";
    checkIn = "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
    update();
  }

  void setCheckOut(DateTime selectedDay) {
    checkOutDisplay =
        "${dateFormatter.format(selectedDay)} ${dayFormatter.format(selectedDay)}, ${yearFormatter.format(selectedDay)}";
    checkOut = "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
    update();
  }

  void setRooms(int rooms) {
    selectedRooms = rooms;
    roomsAdultsChilds =
        '$selectedRooms Rooms, $selectedAdults Adults, $selectedChildren Children';
    update();
  }

  void setAdults(int adults) {
    selectedAdults = adults;
    roomsAdultsChilds =
        '$selectedRooms Rooms, $selectedAdults Adults, $selectedChildren Children';
    update();
  }

  void setChildren(int childs) {
    selectedChildren = childs;
    roomsAdultsChilds =
        '$selectedRooms Rooms, $selectedAdults Adults, $selectedChildren Children';
    update();
  }

  Future<void> searchHotels() async {
    if (destinationText.isEmpty) {
      showError("Enter Destination to proceed.");
      return;
    } else if (checkIn.isEmpty) {
      showError("Enter Check-In Date to proceed.");
      return;
    } else if (checkOut.isEmpty) {
      showError("Enter Check-Out Date to proceed.");
      return;
    }


    RouteManagement.goToHotelsScreen(
        destination: destinationId,
        checkIn: checkIn,
        checkOut: checkOut,
        adults: selectedAdults,
        children: selectedChildren,
        rooms: selectedRooms,
      hotelTypesIds:selectedIds
        );
  }

  void removeId(int id){
    selectedIds.remove(id);
    update();
  }

  void addId(int id){
    selectedIds.add(id);
    update();
  }
}
