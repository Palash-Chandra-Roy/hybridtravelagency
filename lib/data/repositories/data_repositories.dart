import 'package:hybridtravelagency/data/models/response_model.dart';
import 'package:hybridtravelagency/data/repositories/connect_helper.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  Future<ResponseModel> login({
    required bool isLoading,
    required String email,
    required String password,
  }) async {
    var res = await connectHelper.login(
      isLoading: isLoading,
      email: email,
      password: password,
    );
    return res;
  }

  Future<ResponseModel> register({
    required bool isLoading,
    required String name,
    required String password,
    required String email,
    required String passwordConfirmation,
    required String phone,
  }) async {
    var res = await connectHelper.register(
        isLoading: isLoading,
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        phone: phone);
    return res;
  }

  Future<ResponseModel> updateProfile({
    required bool isLoading,
    required String name,
    required String phone,
    required String address,
    required String city,
    required String country,
  }) async {
    var res = await connectHelper.updateProfile(
        isLoading: isLoading,
        name: name,
        phone: phone,
        address: address,
        city: city,
        country: country);
    return res;
  }

  Future<ResponseModel> logout({
    required bool isLoading,
  }) async {
    var res = await connectHelper.logout(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getCurrentUser({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getCurrentUser(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getCountries({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getCountries(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getCities({
    required bool isLoading,
    required int countryId,
  }) async {
    var res = await connectHelper.getCities(
        isLoading: isLoading, countryId: countryId);
    return res;
  }

  Future<ResponseModel> getAirports(
      {required bool isLoading, required String query}) async {
    var res =
        await connectHelper.getAirports(isLoading: isLoading, query: query);
    return res;
  }

  Future<ResponseModel> getCurrencies({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getCurrencies(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> searchFlight({
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
    var res = await connectHelper.searchFlight(
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
    return res;
  }

  Future<ResponseModel> flightOffer({
    required bool isLoading,
    required String searchId,
    required String offerId,
  }) async {
    var res = await connectHelper.flightOffer(
      isLoading: isLoading,
      searchId: searchId,
      offerId: offerId,
    );
    return res;
  }

  Future<ResponseModel> flightBook({
    required bool isLoading,
    required Map<dynamic, dynamic> body,
  }) async {
    var res = await connectHelper.flightBook(isLoading: isLoading, body: body);
    return res;
  }

  Future<ResponseModel> getUserFlightBookings({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getUserFlightBookings(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getUserFlightBookingDetail(
      {required bool isLoading, required int bookingId}) async {
    var res = await connectHelper.getUserFlightBookingDetail(
        isLoading: isLoading, bookingId: bookingId);
    return res;
  }

  Future<ResponseModel> cancelFlightBookingDetail(
      {required bool isLoading, required int userId}) async {
    var res = await connectHelper.cancelFlightBookingDetail(
        isLoading: isLoading, userId: userId);
    return res;
  }

  Future<ResponseModel> hotelsSearch(
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
    var res = await connectHelper.hotelsSearch(
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
    return res;
  }

  Future<ResponseModel> getHotelsTypes({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getHotelsTypes(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getHotelsFacilities({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getHotelsFacilities(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getHotelsDestinations(
      {required bool isLoading, required String search}) async {
    var res = await connectHelper.getHotelsDestinations(
        isLoading: isLoading, search: search);
    return res;
  }

  Future<ResponseModel> getHotelsDetail(
      {required bool isLoading, required int hotelId}) async {
    var res = await connectHelper.getHotelsDetail(
        isLoading: isLoading, hotelId: hotelId);
    return res;
  }

  Future<ResponseModel> hotelsBook({
    required bool isLoading,
    required String hotelId,
    required String roomId,
    required String checkIn,
    required String checkOut,
    required List guests,
    required String paymentMethod,
  }) async {
    var res = await connectHelper.hotelsBook(
      isLoading: isLoading,
      hotelId: hotelId,
      roomId: roomId,
      checkIn: checkIn,
      checkOut: checkOut,
      guests: guests,
      paymentMethod: paymentMethod,
    );
    return res;
  }

  Future<ResponseModel> getHotelsBookings({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getHotelsBookings(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getHotelsBookingsDetail({
    required bool isLoading,
    required int hotelId,
  }) async {
    var res = await connectHelper.getHotelsBookingsDetail(
      isLoading: isLoading,
      hotelId: hotelId,
    );
    return res;
  }

  Future<ResponseModel> cancelHotelsBooking({
    required bool isLoading,
    required int hotelId,
  }) async {
    var res = await connectHelper.cancelHotelsBooking(
      isLoading: isLoading,
      hotelId: hotelId,
    );
    return res;
  }

  Future<ResponseModel> activitiesSearch({
    required bool isLoading,
    required int countryId,
    required int cityId,
  }) async {
    var res = await connectHelper.activitiesSearch(
      isLoading: isLoading,
      countryId: countryId,
      cityId: cityId,
    );
    return res;
  }

  Future<ResponseModel> getActivitiesDetail({
    required bool isLoading,
    required int activitieId,
    int? contractId,
    String? travelDate,
  }) async {
    var res = await connectHelper.getActivitiesDetail(
      isLoading: isLoading,
      activitieId: activitieId,
      contractId: contractId,
      travelDate: travelDate,
    );
    return res;
  }

  Future<ResponseModel> getActivitiesOption({
    required bool isLoading,
    required int tourId,
    required int contractId,
  }) async {
    var res = await connectHelper.getActivitiesOption(
      isLoading: isLoading,
      tourId: tourId,
      contractId: contractId,
    );
    return res;
  }

  Future<ResponseModel> activitiesPrice({
    required bool isLoading,
    required int tourId,
    required int contractId,
    required String optionId,
    required String adults,
    required String children,
    required String date,
  }) async {
    var res = await connectHelper.activitiesPrice(
      isLoading: isLoading,
      tourId: tourId,
      contractId: contractId,
      optionId: optionId,
      adults: adults,
      children: children,
      date: date,
    );
    return res;
  }

  Future<ResponseModel> activitiesTimeSlots({
    required bool isLoading,
    required int activityId,
    required int date,
  }) async {
    var res = await connectHelper.activitiesTimeSlots(
        isLoading: isLoading, activityId: activityId, date: date);
    return res;
  }

  Future<ResponseModel> activitiesBook({
    required bool isLoading,
    required int activityId,
    required int optionId,
    required String date,
    required String timeSlot,
    required String adults,
    required String children,
    required String paymentMethod,
  }) async {
    var res = await connectHelper.activitiesBook(
      isLoading: isLoading,
      activityId: activityId,
      optionId: optionId,
      date: date,
      timeSlot: timeSlot,
      adults: adults,
      children: children,
      paymentMethod: paymentMethod,
    );
    return res;
  }

  Future<ResponseModel> getUserActivitiesBookings({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getUserActivitiesBookings(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getUserActivitiesBookingsDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    var res = await connectHelper.getUserActivitiesBookingsDetail(
      isLoading: isLoading,
      bookingId: bookingId,
    );
    return res;
  }

  Future<ResponseModel> cancelActivitiesBookings({
    required bool isLoading,
    required int bookingId,
  }) async {
    var res = await connectHelper.cancelActivitiesBookings(
      isLoading: isLoading,
      bookingId: bookingId,
    );
    return res;
  }

  Future<ResponseModel> getHolidayCountries({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getHolidayCountries(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getHolidayCities({
    required bool isLoading,
    required String country,
  }) async {
    var res = await connectHelper.getHolidayCities(
        isLoading: isLoading, country: country);
    return res;
  }

  Future<ResponseModel> holidaysSearch(
      {required bool isLoading, required city, required country}) async {
    var res = await connectHelper.holidaysSearch(
        isLoading: isLoading, city: city, country: country);
    return res;
  }

  Future<ResponseModel> getHolidaysDetail({
    required bool isLoading,
    required int holidayId,
  }) async {
    var res = await connectHelper.getHolidaysDetail(
      isLoading: isLoading,
      holidayId: holidayId,
    );
    return res;
  }

  Future<ResponseModel> holidaysBook({
    required bool isLoading,
    required String holidayId,
    required String departureDate,
    required String adults,
    required String children,
    required List passengers,
    required String paymentMethod,
  }) async {
    var res = await connectHelper.holidaysBook(
      isLoading: isLoading,
      holidayId: holidayId,
      departureDate: departureDate,
      adults: adults,
      children: children,
      passengers: passengers,
      paymentMethod: paymentMethod,
    );
    return res;
  }

  Future<ResponseModel> userHolidaysBooking({
    required bool isLoading,
  }) async {
    var res = await connectHelper.userHolidaysBooking(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> userHolidaysBookingDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    var res = await connectHelper.userHolidaysBookingDetail(
      isLoading: isLoading,
      bookingId: bookingId,
    );
    return res;
  }

  Future<ResponseModel> cancelHolidaysBookingDetail({
    required bool isLoading,
    required int bookingId,
  }) async {
    var res = await connectHelper.cancelHolidaysBookingDetail(
      isLoading: isLoading,
      bookingId: bookingId,
    );
    return res;
  }

  Future<ResponseModel> getVisaCountries({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getVisaCountries(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getVisaTypes({
    required bool isLoading,
    required int visaType,
  }) async {
    var res = await connectHelper.getVisaTypes(
      isLoading: isLoading,
      visaType: visaType,
    );
    return res;
  }

  Future<ResponseModel> visaApply({
    required bool isLoading,
    required String countryId,
    required String visaTypeId,
    required String purpose,
    required String entryDate,
    required String exitDate,
    required List applicant,
    required List documents,
  }) async {
    var res = await connectHelper.visaApply(
        isLoading: isLoading,
        countryId: countryId,
        visaTypeId: visaTypeId,
        purpose: purpose,
        entryDate: entryDate,
        exitDate: exitDate,
        applicant: applicant,
        documents: documents);
    return res;
  }

  Future<ResponseModel> getVisaApplications({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getVisaApplications(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getVisaApplicationsDetail({
    required bool isLoading,
    required int applicationId,
  }) async {
    var res = await connectHelper.getVisaApplicationsDetail(
      isLoading: isLoading,
      applicationId: applicationId,
    );
    return res;
  }

  Future<ResponseModel> cancelVisaApplications({
    required bool isLoading,
    required int applicationId,
  }) async {
    var res = await connectHelper.cancelVisaApplications(
      isLoading: isLoading,
      applicationId: applicationId,
    );
    return res;
  }

  Future<ResponseModel> getDashboardOverview({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getDashboardOverview(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getDashboardRecentBooking({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getDashboardRecentBooking(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getDashboardUpcomingTrips({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getDashboardUpcomingTrips(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getNotification({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getNotification(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> updateNotifcation({
    required bool isLoading,
    required int notifcationId,
  }) async {
    var res = await connectHelper.updateNotifcation(
      isLoading: isLoading,
      notifcationId: notifcationId,
    );
    return res;
  }

  Future<ResponseModel> deleteNotifcation({
    required bool isLoading,
    required int notifcationId,
  }) async {
    var res = await connectHelper.deleteNotifcation(
      isLoading: isLoading,
      notifcationId: notifcationId,
    );
    return res;
  }

  Future<ResponseModel> getAllUser({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getAllUser(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getAllBookings({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getAllBookings(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getAllStatistics({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getAllStatistics(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getAgentDashboard({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getAgentDashboard(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getAgentCustomers({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getAgentCustomers(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> getAgentBookings({
    required bool isLoading,
  }) async {
    var res = await connectHelper.getAgentBookings(
      isLoading: isLoading,
    );
    return res;
  }

  Future<ResponseModel> fcmToken({
    required bool isLoading,
    required String token,
  }) async {
    var res = await connectHelper.fcmToken(isLoading: isLoading, token: token);
    return res;
  }
}
