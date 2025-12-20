abstract class DataConstants {
  static String baseUrl = "https://5aecb64767c8.ngrok-free.app";
  static String login = "/api/v1/login";
  static String register = "/api/v1/register";
  static String updateProfile = "/api/v1/profile";
  static String currentUser = "/api/v1/user";
  static String logout = "/api/v1/logout";

  /// Common Data
  static String countries = "/api/v1/countries";
  static String cities = "/api/v1/cities";
  static String airports = "/api/v1/airports";
  static String currencies = "/api/v1/currencies";

  /// Flight
  static String flightSearch = "/api/v1/flights/search";
  static String flightOffer = "/api/v1/flights/offers";
  static String flightBook = "/api/v1/flights/book";
  static String userFlightBookings = "/api/v1/flights/bookings";

  /// Hotel
  static String hotelsSearch = "/api/v1/hotels/search";
  static String hotelsDetail = "/api/v1/hotels";
  static String hotelsBook = "/api/v1/hotels/book";
  static String hotelsBookings = "/api/v1/hotels/bookings";
  static String hotelsTypes = "/api/v1/hotels/types";
  static String hotelsFacilities = "/api/v1/hotels/facilities";

  static String hotelsDestinations = "/hotels/hotel-location-hotels";

  /// Activities
  static String activitiesSearch = "/api/v1/activities/search";
  static String activitiesOption = "/api/v1/activities";
  static String activitiesPrice = "/api/v1/activities";
  static String activitiesTimeSlots = "/api/v1/activities/timeslots";
  static String activitiesBook = "/api/v1/activities/book";
  static String userActivitiesBookings = "/api/v1/activities/bookings";

  /// Holidays
  static String holidaysCountries = "/api/v1/holidays/countries";
  static String holidaysCities = "/api/v1/holidays/cities";
  static String holidaysSearch = "/api/v1/holidays/search";
  static String holidaysBookings = "/api/v1/holidays/bookings";
  static String holidaysBook = "/api/v1/holidays/book";
  static String userHolidaysBooking = "/api/v1/holidays/bookings";

  /// Visa
  static String visaCountries = "/api/v1/visa/countries";
  static String visaTypes = "/api/v1/visa/types";
  static String visaApply = "/api/v1/visa/apply";
  static String visaApplications = "/api/v1/visa/applications";

  /// User Dashboard
  static String dashboardOverview = "/api/v1/dashboard/overview";
  static String dashboardRecentBooking = "/api/v1/dashboard/recent-bookings";
  static String dashboardUpcomingTrips = "/api/v1/dashboard/upcoming-trips";

  /// Notification
  static String notifications = "/api/v1/notifications";

  /// Admin Route
  static String adminUser = "/api/v1/admin/users";
  static String adminBookings = "/api/v1/admin/bookings";
  static String adminStatistics = "/api/v1/admin/statistics";

  /// Agent Dashboard
  static String agentDashboard = "/api/v1/agent/dashboard";
  static String agentCustomers = "/api/v1/agent/customers";
  static String agentBookings = "/api/v1/agent/bookings";

  /// FCM Token
  static String fcmToken = "/api/v1/agent/fcm-token";
}
