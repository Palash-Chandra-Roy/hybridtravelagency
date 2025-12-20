# MyTrip Screen - Architecture Documentation

## 📐 Architecture Overview

The MyTrip feature follows clean architecture principles with a dedicated use case layer that consolidates all booking-related API calls.

---

## 🏗️ Architecture Layers

### **1. Use Cases Layer** (`lib/data/usecases/`)

#### **`my_trip_use_cases.dart`** ✅ NEW
Consolidated use case that directly accesses Repository:
```dart
class MyTripUseCases {
  MyTripUseCases(Repository);

  // Methods:
  - getUserFlightBookings()
  - getUserActivitiesBookings()
  - getHotelsBookings()
  - getUserHolidaysBookings()
}
```

**Purpose**: 
- Single point of access for all MyTrip-related API calls
- Direct access to Repository layer (no intermediate use cases)
- Simplified dependency chain
- Cleaner and more maintainable

---

### **2. Presenter Layer** (`lib/screens/MyTripScreen/`)

#### **`my_trip_presenter.dart`** ✅
```dart
class MyTripPresenter {
  MyTripPresenter(MyTripUseCases);
  
  // Delegates to MyTripUseCases
  - getUserFlightBookings()
  - getUserActivitiesBookings()
  - getHotelsBookings()
  - getUserHolidaysBookings()
}
```

**Purpose**:
- Bridges controller and use cases
- Maintains separation of concerns
- Simple delegation pattern

---

### **3. Controller Layer** (`lib/screens/MyTripScreen/`)

#### **`my_trip_controller.dart`** ✅
```dart
class MyTripController extends GetxController {
  MyTripController(MyTripPresenter);
  
  // State management
  - Loading states (bool for each type)
  - Booking data (List for each type)
  
  // Methods
  - fetchAllBookings()
  - getFlightBookings()
  - getActivityBookings()
  - getHotelBookings()
  - getHolidayBookings()
}
```

**Purpose**:
- State management with GetX
- Handles UI updates
- Error handling
- Auto-fetches data on init

---

### **4. View Layer** (`lib/screens/MyTripScreen/`)

#### **`my_trip_screen.dart`** ✅
Main screen with tabs for trip types

#### **`upcoming_trip_screen.dart`** ✅
Displays booking lists with:
- Loading states (shimmer)
- Empty states (no bookings)
- Dynamic data from APIs
- 4 tabs: Flight, Activity, Hotel, Holidays

---

## 🔗 Dependency Injection

### **`navigation_binding.dart`** ✅
```dart
class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    // MyTrip dependencies - simplified!
    // Using Get.put instead of lazyPut for immediate initialization
    Get.put<MyTripUseCases>(MyTripUseCases(Get.find()));
    Get.put<MyTripPresenter>(MyTripPresenter(Get.find()));
    Get.put<MyTripController>(MyTripController(Get.find()));
  }
}
```

**Much cleaner!** Only 3 dependencies instead of 7!

**Why Get.put instead of lazyPut?**
- MyTripScreen is accessed directly from NavigationScreen
- GetBuilder needs the controller to exist immediately
- Get.put ensures dependencies are ready when needed

---

## 📊 Data Flow

```
User Taps "My Trips"
    ↓
MyTripScreen (View)
    ↓
MyTripController (State Management)
    ↓
MyTripPresenter (Delegation)
    ↓
MyTripUseCases (Business Logic)
    ↓
Repository (Data Access)
    ↓
API (Network)
```

**Simplified Flow** - No intermediate use cases needed!

---

## ✅ Benefits of This Architecture

### **1. Single Responsibility**
- Each layer has one clear purpose
- Easy to maintain and test

### **2. Dependency Inversion**
- High-level modules don't depend on low-level modules
- Both depend on abstractions (use cases)

### **3. Scalability**
- Easy to add new booking types
- Just add method to MyTripUseCases

### **4. Testability**
- Each layer can be tested independently
- Mock dependencies easily

### **5. Reusability**
- Individual use cases can be used elsewhere
- MyTripUseCases provides convenient aggregation

---

## 📁 File Structure

```
lib/
├── data/
│   ├── repositories/
│   │   └── repository.dart              ✅ Direct access point
│   │
│   └── usecases/
│       └── my_trip_use_cases.dart       ✅ NEW - Simplified use case
│
└── screens/
    ├── navigation/
    │   └── navigation_binding.dart      ✅ Updated - Clean deps
    │
    └── MyTripScreen/
        ├── my_trip_screen.dart          ✅ Main screen
        ├── my_trip_controller.dart      ✅ State management
        ├── my_trip_presenter.dart       ✅ Uses MyTripUseCases
        └── upcoming_trip_screen.dart    ✅ Booking lists
```

**Note**: Individual booking use cases (FlightUseCases, etc.) are NOT needed for MyTrip!

---

## 🔄 API Endpoints Used

| Type | Endpoint | Response Model |
|------|----------|----------------|
| Flights | `/api/v1/flights/bookings` | `GetUserFlightBookingsResponse` |
| Activities | `/api/v1/activities/bookings` | `GetUserActivityBookingsResponse` |
| Hotels | `/api/v1/hotels/bookings` | `GetUserHotelBookingsResponse` |
| Holidays | `/api/v1/holidays/bookings` | `GetUserHolidayBookingsResponse` |

---

## 🎯 Key Features Implemented

- ✅ Consolidated use case for all bookings
- ✅ Clean architecture with clear separation
- ✅ Dependency injection via GetX
- ✅ Loading states with shimmer
- ✅ Empty states with friendly messages
- ✅ Error handling
- ✅ Auto-fetch on screen load
- ✅ Tab-based navigation for booking types

---

## 🚀 Usage

```dart
// Access from bottom navigation (already configured)
Get.to(() => MyTripScreen());

// Controller automatically:
1. Fetches all bookings on init
2. Updates UI with loading states
3. Displays data in respective tabs
```

---

## 🔄 Refresh Functionality

### **Auto-refresh on Navigation** ✅
When user taps "My Trips" from bottom navigation:
- Fetches latest bookings before opening screen
- Ensures data is always up-to-date

```dart
// navigation_screen.dart
onTap: () {
  final myTripController = Get.find<MyTripController>();
  myTripController.fetchAllBookings();  // ← Refresh data
  Get.to(() => MyTripScreen());
}
```

### **Manual Refresh** ✅
User can tap the refresh button in MyTripScreen:
- Counter-clockwise arrow icon in AppBar
- Calls `fetchAllBookings()` to reload all data

```dart
// my_trip_screen.dart
actions: [
  InkWell(
    onTap: () {
      myTripController.fetchAllBookings();  // ← Manual refresh
    },
    child: SvgPicture.asset(arrowCounterClockwise),
  ),
]
```

**Features:**
- ✅ Fetches all 4 booking types simultaneously
- ✅ Shows loading indicators per tab
- ✅ Handles errors gracefully
- ✅ Updates UI automatically via GetX

---

**Status**: ✅ Architecture complete and production-ready with refresh functionality!

**Last Updated**: October 24, 2025

