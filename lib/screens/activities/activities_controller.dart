import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/data/responses/search_activities_response.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';
import 'package:hybridtravelagency/screens/activities/activities_presenter.dart';

class ActivitiesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ActivitiesController(this._activitiesPresenter);
  final ActivitiesPresenter _activitiesPresenter;
  dynamic  selectedIndex;
  final TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  bool isCitiesLoading = false;
  List<Offers> sortedOffers = [];
  List<Offers> allOffers = [];
  List<ActivityData>? activitiesList;
  List<CityData> citiesList = [];
  int countryId = -1;
  int cityId = -1;

  List<ActivityData> _getDummyActivities() {
    return [
      ActivityData(
        tourId: 8091,
        countryId: 13063,
        countryName: "UAE",
        cityId: 13236,
        cityName: "Abu Dhabi",
        tourName: "Al Ain Zoo",
        rating: 5,
        duration: "7 Hours (Approx)",
        imagePath: "https://d23556buiqsurc.cloudfront.net/Tour-Images/Final/Al-Ain-Zoo-6263/1725541865555_S.jpg",
        cityTourType: "Culture and Attractions",
        cancellationPolicyName: "Non Refundable",
        price: "6.31",
      ),
      ActivityData(
        tourId: 8092,
        countryId: 13063,
        countryName: "UAE",
        cityId: 13236,
        cityName: "Abu Dhabi",
        tourName: "Qasr Al Hosn Abu Dhabi",
        rating: 5,
        duration: "9 - 10 Hours (Approx)",
        imagePath: "https://d23556buiqsurc.cloudfront.net/Tour-Images/false-486473/QASR.jpg",
        cityTourType: "Culture and Attractions",
        cancellationPolicyName: "Non Refundable",
        price: "8.00",
      ),
      ActivityData(
        tourId: 1674,
        countryId: 13063,
        countryName: "UAE",
        cityId: 13236,
        cityName: "Abu Dhabi",
        tourName: "Emirates Park Zoo",
        rating: 5,
        duration: "5 Hours (Approx)",
        imagePath: "https://d23556buiqsurc.cloudfront.net/Tour-Images/Final/Emirates-Park-Zoo-4710/1725541266008_S.jpg",
        cityTourType: "Wildlife Zoo and Aquarium",
        cancellationPolicyName: "Non Refundable",
        price: "11.10",
      ),
      ActivityData(
        tourId: 8090,
        countryId: 13063,
        countryName: "UAE",
        cityId: 13236,
        cityName: "Abu Dhabi",
        tourName: "The National Aquarium Abu Dhabi",
        rating: 5,
        duration: "Approx 90 min",
        imagePath: "https://d23556buiqsurc.cloudfront.net/Tour-Images/false-5901/Aquarium-Abu-Dhabi-01.jpg",
        cityTourType: "Theme Parks",
        cancellationPolicyName: "Non Refundable",
        price: "30.96",
      ),
    ];
  }

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) async {

    });
  }



  dynamic setLoading(dynamic value) {
    isLoading = value;
    update();
  }

  dynamic setCitiesLoading(dynamic value) {
    isCitiesLoading = value;
    update();
  }

  Future<void> setCountry(CountryData country) async{
   countryId = country.countryId!;
    update();
  }

  Future<void> setCity(CityData city) async{
    cityId = city.cityId!;
    update();
  }

  Future<void> getCities(int countryId) async {
    setCitiesLoading(true);
    try {
      final response = await _activitiesPresenter.getCities(
          isLoading: false,
        countryId: countryId
          );

      if (response != null && response.data != null) {
        citiesList = response.data!;
      }
    } catch (e) {
      debugPrint("Cities error: $e");
    } finally {
      setCitiesLoading(false);
    }
  }


  Future<void> searchActivities() async {
    setLoading(true);
    try {
      final response = await _activitiesPresenter.activitiesSearch(
          isLoading: false,
          cityId:cityId,
      countryId:countryId);

      if (response != null && response.data != null) {
        activitiesList = response.data!.activities!.data;
      }
      // activitiesList = _getDummyActivities();
    } catch (e) {
      debugPrint("Search Flight error: $e");
    } finally {
      setLoading(false);
    }
  }


}
