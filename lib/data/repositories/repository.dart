import 'dart:async';
import 'dart:convert';

import 'package:hybridtravelagency/data/models/response_model.dart';
import 'package:hybridtravelagency/data/repositories/data_repositories.dart';
import 'package:hybridtravelagency/data/responses/airports_response.dart';
import 'package:hybridtravelagency/data/responses/book_flight_response.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/data/responses/currencies_response.dart';
import 'package:hybridtravelagency/data/responses/get_activities_time_slots_response.dart';
import 'package:hybridtravelagency/data/responses/get_activity_details_response.dart';
import 'package:hybridtravelagency/data/responses/get_current_user_response.dart';
import 'package:hybridtravelagency/data/responses/get_flight_booking_details_response.dart';
import 'package:hybridtravelagency/data/responses/get_holiday_cities_response.dart';
import 'package:hybridtravelagency/data/responses/get_holiday_countries_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_destinations_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_facilities_response.dart';
import 'package:hybridtravelagency/data/responses/get_hotel_types_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_activity_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_flight_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_holiday_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_hotel_bookings_response.dart';
import 'package:hybridtravelagency/data/responses/get_user_visa_applications_response.dart';
import 'package:hybridtravelagency/data/responses/get_visa_countries_response.dart';
import 'package:hybridtravelagency/data/responses/login_response.dart';
import 'package:hybridtravelagency/data/responses/register_response.dart';
import 'package:flutter/material.dart';
import 'package:hybridtravelagency/data/responses/search_activities_response.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';
import 'package:hybridtravelagency/data/responses/search_holidays_response.dart';
import 'package:hybridtravelagency/data/responses/search_hotels_response.dart';
import 'package:hybridtravelagency/navigators/routes_management.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';

import '../responses/get_art_response.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._dataRepository);

  final DataRepository _dataRepository;

  Future<LoginResponse?> login({
    required bool isLoading,
    required String email,
    required String password,
  }) async {
    try {
      var res = await _dataRepository.login(
        isLoading: isLoading,
        email: email,
        password: password,
      );
      debugPrint(res.data);
      if (!res.hasError) {
        var data = loginResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<RegisterResponse?> register({
    required bool isLoading,
    required String name,
    required String password,
    required String email,
    required String passwordConfirmation,
    required String phone,
  }) async {
    try {
      var res = await _dataRepository.register(
          isLoading: isLoading,
          name: name,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
          phone: phone);
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> logout({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.logout(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> updateProfile({
    required bool isLoading,
    required String name,
    required String phone,
    required String address,
    required String city,
    required String country,
  }) async {
    try {
      var res = await _dataRepository.updateProfile(
          isLoading: isLoading,
          name: name,
          phone: phone,
          address: address,
          city: city,
          country: country);
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetCurrentUserResponse?> getCurrentUser({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getCurrentUser(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getCurrentUserResponseFromJson(res.data);
        return data;
      } else {
        unauthorizedRedirection(res);

        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<CountriesResponse?> getCountries({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getCountries(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = countriesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<CitiesResponse?> getCities({
    required bool isLoading,
    required int countryId,
  }) async {
    try {
      var res = await _dataRepository.getCities(
          isLoading: isLoading, countryId: countryId);
      if (!res.hasError) {
        var data = citiesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<AirportsResponse?> getAirports(
      {required bool isLoading, required String query}) async {
    try {
      var res =
          await _dataRepository.getAirports(isLoading: isLoading, query: query);
      if (!res.hasError) {
        var data = airportsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<CurrenciesResponse?> getCurrencies({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getCurrencies(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = currenciesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<SearchFlightsResponse?> searchFlight({
    required bool isLoading,
    required String origin,
    required String destination,
    required String departureDate,
    required String returnDate,
    required int adults,
    required int children,
    required int infants,
    required String cabinClass,
    required String tripType,
  }) async {
    try {
      var res = await _dataRepository.searchFlight(
          isLoading: isLoading,
          origin: origin,
          destination: destination,
          departureDate: departureDate,
          returnDate: returnDate,
          adults: adults,
          children: children,
          infants: infants,
          cabinClass: cabinClass,
          tripType: tripType);
      if (!res.hasError) {
        var data = searchFlightsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> flightOffer({
    required bool isLoading,
    required String searchId,
    required String offerId,
  }) async {
    try {
      var res = await _dataRepository.flightOffer(
        isLoading: isLoading,
        searchId: searchId,
        offerId: offerId,
      );
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<BookFlightResponse?> flightBook({
    required bool isLoading,
    required Map<dynamic, dynamic> body,
  }) async {
    try {
      var res =
          await _dataRepository.flightBook(isLoading: isLoading, body: body);
      if (!res.hasError) {
        var data = bookFlightResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetUserFlightBookingsResponse?> getUserFlightBookings({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getUserFlightBookings(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getUserFlightBookingsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetFlightBookingDetailsResponse?> getUserFlightBookingDetail(
      {required bool isLoading, required int bookingId}) async {
    try {
      var res = await _dataRepository.getUserFlightBookingDetail(
        isLoading: isLoading,
        bookingId: bookingId,
      );
      if (!res.hasError) {
        var data = getFlightBookingDetailsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> cancelFlightBookingDetail(
      {required bool isLoading, required int userId}) async {
    try {
      var res = await _dataRepository.cancelFlightBookingDetail(
          isLoading: isLoading, userId: userId);
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<SearchHotelsResponse?> hotelsSearch(
      {required bool isLoading,
      required String destination,
      required String checkIn,
      required String checkOut,
      required String adults,
      required String children,
      required String rooms,
      required String countryCode,
      required String currency,
      required List<int> hotelTypesIds}) async {
    try {
      var res = await _dataRepository.hotelsSearch(
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
      if (!res.hasError) {
        var data = searchHotelsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetHotelTypesResponse?> getHotelsTypes(
      {required bool isLoading}) async {
    try {
      var res = await _dataRepository.getHotelsTypes(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getHotelTypesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetHotelFacilitiesResponse?> getHotelsFacilities(
      {required bool isLoading}) async {
    try {
      var res = await _dataRepository.getHotelsFacilities(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getHotelFacilitiesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<GetHotelDestinationsResponse>?> getHotelsDestinations(
      {required bool isLoading, required String search}) async {
    try {
      var res = await _dataRepository.getHotelsDestinations(
          isLoading: isLoading, search: search);
      if (!res.hasError) {
        var data = getHotelDestinationsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getHotelsDetail(
      {required bool isLoading, required int hotelId}) async {
    try {
      var res = await _dataRepository.getHotelsDetail(
        isLoading: isLoading,
        hotelId: hotelId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> hotelsBook({
    required bool isLoading,
    required String hotelId,
    required String roomId,
    required String checkIn,
    required String checkOut,
    required List guests,
    required String paymentMethod,
  }) async {
    try {
      var res = await _dataRepository.hotelsBook(
        isLoading: isLoading,
        hotelId: hotelId,
        roomId: roomId,
        checkIn: checkIn,
        checkOut: checkOut,
        guests: guests,
        paymentMethod: paymentMethod,
      );
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetUserHotelBookingsResponse?> getHotelsBookings({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getHotelsBookings(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getUserHotelBookingsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getHotelsBookingsDetail({
    required bool isLoading,
    required int hotelId,
  }) async {
    try {
      var res = await _dataRepository.getHotelsBookingsDetail(
        isLoading: isLoading,
        hotelId: hotelId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> cancelHotelsBooking({
    required bool isLoading,
    required int hotelId,
  }) async {
    try {
      var res = await _dataRepository.cancelHotelsBooking(
        isLoading: isLoading,
        hotelId: hotelId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<SearchActivitiesResponse?> activitiesSearch({
    required bool isLoading,
    required int countryId,
    required int cityId,
  }) async {
    try {
      var res = await _dataRepository.activitiesSearch(
        isLoading: isLoading,
        countryId: countryId,
        cityId: cityId,
      );
      if (!res.hasError) {
        var data = searchActivitiesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetActivityDetailsResponse?> getActivitiesDetail({
    required bool isLoading,
    required int activitieId,
    int? contractId,
    String? travelDate,
  }) async {
    try {
      var res = await _dataRepository.getActivitiesDetail(
        isLoading: isLoading,
        activitieId: activitieId,
        contractId: contractId,
        travelDate: travelDate,
      );
      if (!res.hasError) {
        var data = GetActivityDetailsResponse.fromJson(json.decode(res.data));
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getActivitiesOption({
    required bool isLoading,
    required int tourId,
    required int contractId,
  }) async {
    try {
      var res = await _dataRepository.getActivitiesOption(
        isLoading: isLoading,
        tourId: tourId,
        contractId: contractId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> activitiesPrice({
    required bool isLoading,
    required int tourId,
    required int contractId,
    required String optionId,
    required String adults,
    required String children,
    required String date,
  }) async {
    try {
      var res = await _dataRepository.activitiesPrice(
        isLoading: isLoading,
        tourId: tourId,
        contractId: contractId,
        optionId: optionId,
        adults: adults,
        children: children,
        date: date,
      );
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetActivitiesTimeSlotsResponse?> activitiesTimeSlots({
    required bool isLoading,
    required int activityId,
    required int date,
  }) async {
    try {
      var res = await _dataRepository.activitiesTimeSlots(
          isLoading: isLoading, activityId: activityId, date: date);
      if (!res.hasError) {
        var data = getActivitiesTimeSlotsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> activitiesBook({
    required bool isLoading,
    required int activityId,
    required int optionId,
    required String date,
    required String timeSlot,
    required String adults,
    required String children,
    required String paymentMethod,
  }) async {
    try {
      var res = await _dataRepository.activitiesBook(
        isLoading: isLoading,
        activityId: activityId,
        optionId: optionId,
        date: date,
        timeSlot: timeSlot,
        adults: adults,
        children: children,
        paymentMethod: paymentMethod,
      );
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetUserActivityBookingsResponse?> getUserActivitiesBookings({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getUserActivitiesBookings(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getUserActivityBookingsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getUserActivitiesBookingsDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    try {
      var res = await _dataRepository.getUserActivitiesBookingsDetail(
        isLoading: isLoading,
        bookingId: bookingId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> cancelActivitiesBookings({
    required bool isLoading,
    required int bookingId,
  }) async {
    try {
      var res = await _dataRepository.cancelActivitiesBookings(
        isLoading: isLoading,
        bookingId: bookingId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetHolidayCountriesResponse?> getHolidayCountries(
      {required bool isLoading}) async {
    try {
      var res = await _dataRepository.getHolidayCountries(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getHolidayCountriesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetHolidayCitiesResponse?> getHolidayCities({
    required bool isLoading,
    required String country,
  }) async {
    try {
      var res = await _dataRepository.getHolidayCities(
          isLoading: isLoading, country: country);
      if (!res.hasError) {
        var data = getHolidayCitiesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<SearchHolidaysResponse?> holidaysSearch(
      {required bool isLoading, required city, required country}) async {
    try {
      var res = await _dataRepository.holidaysSearch(
          isLoading: isLoading, city: city, country: country);
      if (!res.hasError) {
        var data = searchHolidaysResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getHolidaysDetail({
    required bool isLoading,
    required int holidayId,
  }) async {
    try {
      var res = await _dataRepository.getHolidaysDetail(
        isLoading: isLoading,
        holidayId: holidayId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> holidaysBook({
    required bool isLoading,
    required String holidayId,
    required String departureDate,
    required String adults,
    required String children,
    required List passengers,
    required String paymentMethod,
  }) async {
    try {
      var res = await _dataRepository.holidaysBook(
        isLoading: isLoading,
        holidayId: holidayId,
        departureDate: departureDate,
        adults: adults,
        children: children,
        passengers: passengers,
        paymentMethod: paymentMethod,
      );
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetUserHolidayBookingsResponse?> userHolidaysBooking({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.userHolidaysBooking(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getUserHolidayBookingsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> userHolidaysBookingDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    try {
      var res = await _dataRepository.userHolidaysBookingDetail(
        isLoading: isLoading,
        bookingId: bookingId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> cancelHolidaysBookingDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    try {
      var res = await _dataRepository.cancelHolidaysBookingDetail(
        isLoading: isLoading,
        bookingId: bookingId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetVisaCountriesResponse?> getVisaCountries({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getVisaCountries(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getVisaCountriesResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getVisaTypes({
    required bool isLoading,
    required int visaType,
  }) async {
    try {
      var res = await _dataRepository.getVisaTypes(
        isLoading: isLoading,
        visaType: visaType,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetUserVisaApplicationsResponse?> getVisaApplications({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getVisaApplications(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getUserVisaApplicationsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> visaApply({
    required bool isLoading,
    required String countryId,
    required String visaTypeId,
    required String purpose,
    required String entryDate,
    required String exitDate,
    required List applicant,
    required List documents,
  }) async {
    try {
      var res = await _dataRepository.visaApply(
          isLoading: isLoading,
          countryId: countryId,
          visaTypeId: visaTypeId,
          purpose: purpose,
          entryDate: entryDate,
          exitDate: exitDate,
          applicant: applicant,
          documents: documents);
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getVisaApplicationsDetail({
    required bool isLoading,
    required int applicationId,
  }) async {
    try {
      var res = await _dataRepository.getVisaApplicationsDetail(
        isLoading: isLoading,
        applicationId: applicationId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> cancelVisaApplications({
    required bool isLoading,
    required int applicationId,
  }) async {
    try {
      var res = await _dataRepository.cancelVisaApplications(
        isLoading: isLoading,
        applicationId: applicationId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getDashboardOverview({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getDashboardOverview(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getDashboardRecentBooking({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getDashboardRecentBooking(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getDashboardUpcomingTrips({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getDashboardUpcomingTrips(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getNotification({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getNotification(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> updateNotifcation({
    required bool isLoading,
    required int notifcationId,
  }) async {
    try {
      var res = await _dataRepository.updateNotifcation(
        isLoading: isLoading,
        notifcationId: notifcationId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> deleteNotifcation({
    required bool isLoading,
    required int notifcationId,
  }) async {
    try {
      var res = await _dataRepository.deleteNotifcation(
        isLoading: isLoading,
        notifcationId: notifcationId,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getAllUser({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getAllUser(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getAllBookings({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getAllBookings(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getAllStatistics({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getAllStatistics(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getAgentDashboard({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getAgentDashboard(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getAgentCustomers({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getAgentCustomers(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<GetArtsResponse?> getAgentBookings({
    required bool isLoading,
  }) async {
    try {
      var res = await _dataRepository.getAgentBookings(
        isLoading: isLoading,
      );
      if (!res.hasError) {
        var data = getArtsResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<RegisterResponse?> fcmToken({
    required bool isLoading,
    required String token,
  }) async {
    try {
      var res = await _dataRepository.fcmToken(
        isLoading: isLoading,
        token: token,
      );
      if (!res.hasError) {
        var data = registerResponseFromJson(res.data);
        return data;
      } else {
        // showErrorDialog(res);
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void unauthorizedRedirection(ResponseModel res) {
    if (res.errorCode == 401 ||
        res.errorCode == 402 ||
        res.errorCode == 500 ||
        res.errorCode == 1000) {
      SharedPrefUtil.isLogin = false;
      SharedPrefUtil.authToken = '';
      SharedPrefUtil.synchronizeSettingsToPhone().then((value) {
        SharedPrefUtil.synchronizeSettingsFromPhone().then((value) {
          RouteManagement.goToLoginScreen();
        });
      });
    }
  }
}
