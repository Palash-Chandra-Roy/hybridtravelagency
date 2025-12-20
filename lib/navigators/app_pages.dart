import 'package:get/get.dart';
import 'package:hybridtravelagency/screens/activities/activities_binding.dart';
import 'package:hybridtravelagency/screens/activities/activities_screen.dart';
import 'package:hybridtravelagency/screens/activities/activity_details/activity_details_binding.dart';
import 'package:hybridtravelagency/screens/activities/activity_details/activity_details_screen.dart';
import 'package:hybridtravelagency/screens/auth/login_screen/login_binding.dart';
import 'package:hybridtravelagency/screens/auth/login_screen/login_screen.dart';
import 'package:hybridtravelagency/screens/auth/register_screen/register_binding.dart';
import 'package:hybridtravelagency/screens/auth/register_screen/register_screen.dart';
import 'package:hybridtravelagency/screens/MyAccountScreen/edit_profile_binding.dart';
import 'package:hybridtravelagency/screens/MyAccountScreen/edit_profile_screen.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_packages_binding.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_packages_screen.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_details/holiday_details_binding.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_details/holiday_details_screen.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/hotels_binding.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/hotels_screen.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/hotel_and_homestay_binding.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/hotel_and_homestay_screen.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/search_city/search_city_binding.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/search_city/search_city_screen.dart';
import 'package:hybridtravelagency/screens/home/drawer/setting/setting_binding.dart';
import 'package:hybridtravelagency/screens/home/drawer/setting/setting_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_binding.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_binding.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_binding.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_screen.dart';
import 'package:hybridtravelagency/screens/my_activity/my_activity_binding.dart';
import 'package:hybridtravelagency/screens/my_activity/my_activity_screen.dart';
import 'package:hybridtravelagency/screens/my_flight/my_flight_binding.dart';
import 'package:hybridtravelagency/screens/my_flight/my_flight_screen.dart';
import 'package:hybridtravelagency/screens/my_flight_details/my_flight_details_binding.dart';
import 'package:hybridtravelagency/screens/my_flight_details/my_flight_details_screen.dart';
import 'package:hybridtravelagency/screens/my_holidays/my_holidays_binding.dart';
import 'package:hybridtravelagency/screens/my_holidays/my_holidays_screen.dart';
import 'package:hybridtravelagency/screens/my_hotel/my_hotel_binding.dart';
import 'package:hybridtravelagency/screens/my_hotel/my_hotel_screen.dart';
import 'package:hybridtravelagency/screens/my_visa/my_visa_binding.dart';
import 'package:hybridtravelagency/screens/my_visa/my_visa_screen.dart';
import 'package:hybridtravelagency/screens/navigation/navigation_binding.dart';
import 'package:hybridtravelagency/screens/navigation/navigation_screen.dart';

import '../Screens/splash/splash_screen.dart';
import '../screens/splash/splash_binding.dart';

part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);

  static const initial = Routes.splashScreen;

  static final pages = [
    GetPage<SplashScreen>(
      name: _Paths.splashScreen,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<LogInScreen>(
      name: _Paths.loginScreen,
      transitionDuration: transitionDuration,
      page: LogInScreen.new,
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<RegisterScreen>(
      name: _Paths.registerScreen,
      transitionDuration: transitionDuration,
      page: RegisterScreen.new,
      binding: RegisterBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<NavigationScreen>(
      name: _Paths.navigationScreen,
      transitionDuration: transitionDuration,
      page: NavigationScreen.new,
      binding: NavigationBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<SettingScreen>(
      name: _Paths.settingScreen,
      transitionDuration: transitionDuration,
      page: SettingScreen.new,
      binding: SettingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<FlightSearchScreen>(
      name: _Paths.flightSearchScreen,
      transitionDuration: transitionDuration,
      page: FlightSearchScreen.new,
      binding: FlightSearchBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<FlightBookScreen>(
      name: _Paths.flightBookScreen,
      transitionDuration: transitionDuration,
      page: FlightBookScreen.new,
      binding: FlightBookBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<FlightDetailScreen>(
      name: _Paths.flightDetailScreen,
      transitionDuration: transitionDuration,
      page: FlightDetailScreen.new,
      binding: FlightDetailBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<SearchCityScreen>(
      name: _Paths.searchCityScreen,
      transitionDuration: transitionDuration,
      page: SearchCityScreen.new,
      binding: SearchCityBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<HotelAndHomeStayScreen>(
      name: _Paths.hotelAndHomeStayScreen,
      transitionDuration: transitionDuration,
      page: HotelAndHomeStayScreen.new,
      binding: HotelAndHomeStayBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<HotelsScreen>(
      name: _Paths.hotelsScreen,
      transitionDuration: transitionDuration,
      page: HotelsScreen.new,
      binding: HotelsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<HolidayPackagesScreen>(
      name: _Paths.holidayPackagesScreen,
      transitionDuration: transitionDuration,
      page: HolidayPackagesScreen.new,
      binding: HolidayPackagesBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<HolidayDetailsScreen>(
      name: _Paths.holidayDetailsScreen,
      transitionDuration: transitionDuration,
      page: HolidayDetailsScreen.new,
      binding: HolidayDetailsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<ActivitiesScreen>(
      name: _Paths.activitiesScreen,
      transitionDuration: transitionDuration,
      page: ActivitiesScreen.new,
      binding: ActivitiesBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<ActivityDetailsScreen>(
      name: _Paths.activityDetailsScreen,
      transitionDuration: transitionDuration,
      page: ActivityDetailsScreen.new,
      binding: ActivityDetailsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<MyFlightScreen>(
      name: _Paths.myFlightScreen,
      transitionDuration: transitionDuration,
      page: MyFlightScreen.new,
      binding: MyFlightBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<MyHolidaysScreen>(
      name: _Paths.myHolidaysScreen,
      transitionDuration: transitionDuration,
      page: MyHolidaysScreen.new,
      binding: MyHolidaysBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<MyHotelScreen>(
      name: _Paths.myHotelScreen,
      transitionDuration: transitionDuration,
      page: MyHotelScreen.new,
      binding: MyHotelBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<MyActivityScreen>(
      name: _Paths.myActivitiesScreen,
      transitionDuration: transitionDuration,
      page: MyActivityScreen.new,
      binding: MyActivityBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<MyVisaScreen>(
      name: _Paths.myVisaScreen,
      transitionDuration: transitionDuration,
      page: MyVisaScreen.new,
      binding: MyVisaBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<MyFlightDetailsScreen>(
      name: _Paths.myFlightDetailsScreen,
      transitionDuration: transitionDuration,
      page: MyFlightDetailsScreen.new,
      binding: MyFlightDetailsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<EditProfileScreen>(
      name: _Paths.editProfileScreen,
      transitionDuration: transitionDuration,
      page: EditProfileScreen.new,
      binding: EditProfileBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
