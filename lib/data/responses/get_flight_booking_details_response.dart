import 'dart:convert';

GetFlightBookingDetailsResponse getFlightBookingDetailsResponseFromJson(
        String str) =>
    GetFlightBookingDetailsResponse.fromJson(
        json.decode(str) as Map<String, dynamic>);

String getFlightBookingDetailsResponseToJson(
        GetFlightBookingDetailsResponse data) =>
    json.encode(data.toJson());

class GetFlightBookingDetailsResponse {
  bool? status;
  Data? data;
  User? user;
  Flight? flight;
  ServiceData? serviceData;

  GetFlightBookingDetailsResponse(
      {this.status, this.data, this.user, this.flight, this.serviceData});

  GetFlightBookingDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    flight = json['flight'] != null ? Flight.fromJson(json['flight']) : null;
    serviceData = json['service_data'] != null
        ? ServiceData.fromJson(json['service_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (flight != null) {
      data['flight'] = flight!.toJson();
    }
    if (serviceData != null) {
      data['service_data'] = serviceData!.toJson();
    }
    return data;
  }
}

class Data {
  FlightData? data;
  Paid? paid;

  Data({this.data, this.paid});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? FlightData.fromJson(json['data']) : null;
    paid = json['paid'] != null ? Paid.fromJson(json['paid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (paid != null) {
      data['paid'] = paid!.toJson();
    }
    return data;
  }
}

class FlightData {
  // Null? voidWindowEndsAt;
  List<Documents>? documents;
  String? syncedAt;
  List<String>? availableActions;
  // Null? cancellation;
  // List<Null>? airlineInitiatedChanges;
  String? taxCurrency;
  String? baseCurrency;
  String? baseAmount;
  double? taxAmount;
  String? totalCurrency;
  String? offerId;
  String? bookingReference;
  List<BookingReferences>? bookingReferences;
  PaymentStatus? paymentStatus;
  bool? liveMode;
  String? totalAmount;
  String? createdAt;
  List<Slices>? slices;
  List<Passengers>? passengers;
  Conditions? conditions;
  // Null? cancelledAt;
  List<Null>? changes;
  String? content;
  List<Services>? services;
  List<Null>? users;
  // Null? metadata;
  String? type;
  Carrier? owner;
  String? id;

  FlightData(
      {
      // this.voidWindowEndsAt,
      this.documents,
      this.syncedAt,
      this.availableActions,
      // this.cancellation,
      // this.airlineInitiatedChanges,
      this.taxCurrency,
      this.baseCurrency,
      this.baseAmount,
      this.taxAmount,
      this.totalCurrency,
      this.offerId,
      this.bookingReference,
      this.bookingReferences,
      this.paymentStatus,
      this.liveMode,
      this.totalAmount,
      this.createdAt,
      this.slices,
      this.passengers,
      this.conditions,
      // this.cancelledAt,
      this.changes,
      this.content,
      this.services,
      this.users,
      // this.metadata,
      this.type,
      this.owner,
      this.id});

  FlightData.fromJson(Map<String, dynamic> json) {
    // voidWindowEndsAt = json['void_window_ends_at'];
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
    syncedAt = json['synced_at'];
    availableActions = json['available_actions'].cast<String>();
    // cancellation = json['cancellation'];
    // if (json['airline_initiated_changes'] != null) {
    //   airlineInitiatedChanges = <Null>[];
    //   json['airline_initiated_changes'].forEach((v) {
    //     airlineInitiatedChanges!.add(new Null.fromJson(v));
    //   });
    // }
    taxCurrency = json['tax_currency'];
    baseCurrency = json['base_currency'];
    baseAmount = json['base_amount'];
    taxAmount = json['tax_amount'];
    totalCurrency = json['total_currency'];
    offerId = json['offer_id'];
    bookingReference = json['booking_reference'];
    if (json['booking_references'] != null) {
      bookingReferences = <BookingReferences>[];
      json['booking_references'].forEach((v) {
        bookingReferences!.add(BookingReferences.fromJson(v));
      });
    }
    paymentStatus = json['payment_status'] != null
        ? PaymentStatus.fromJson(json['payment_status'])
        : null;
    liveMode = json['live_mode'];
    totalAmount = json['total_amount'];
    createdAt = json['created_at'];
    if (json['slices'] != null) {
      slices = <Slices>[];
      json['slices'].forEach((v) {
        slices!.add(Slices.fromJson(v));
      });
    }
    if (json['passengers'] != null) {
      passengers = <Passengers>[];
      json['passengers'].forEach((v) {
        passengers!.add(Passengers.fromJson(v));
      });
    }
    conditions = json['conditions'] != null
        ? Conditions.fromJson(json['conditions'])
        : null;
    // cancelledAt = json['cancelled_at'];
    // if (json['changes'] != null) {
    //   changes = <Null>[];
    //   json['changes'].forEach((v) {
    //     changes!.add(new Null.fromJson(v));
    //   });
    // }
    content = json['content'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    // if (json['users'] != null) {
    //   users = <Null>[];
    //   json['users'].forEach((v) {
    //     users!.add(new Null.fromJson(v));
    //   });
    // }
    // metadata = json['metadata'];
    type = json['type'];
    owner = json['owner'] != null ? Carrier.fromJson(json['owner']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['void_window_ends_at'] = this.voidWindowEndsAt;
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['synced_at'] = syncedAt;
    data['available_actions'] = availableActions;
    // data['cancellation'] = this.cancellation;
    // if (this.airlineInitiatedChanges != null) {
    //   data['airline_initiated_changes'] =
    //       this.airlineInitiatedChanges!.map((v) => v.toJson()).toList();
    // }
    data['tax_currency'] = taxCurrency;
    data['base_currency'] = baseCurrency;
    data['base_amount'] = baseAmount;
    data['tax_amount'] = taxAmount;
    data['total_currency'] = totalCurrency;
    data['offer_id'] = offerId;
    data['booking_reference'] = bookingReference;
    if (bookingReferences != null) {
      data['booking_references'] =
          bookingReferences!.map((v) => v.toJson()).toList();
    }
    if (paymentStatus != null) {
      data['payment_status'] = paymentStatus!.toJson();
    }
    data['live_mode'] = liveMode;
    data['total_amount'] = totalAmount;
    data['created_at'] = createdAt;
    if (slices != null) {
      data['slices'] = slices!.map((v) => v.toJson()).toList();
    }
    if (passengers != null) {
      data['passengers'] = passengers!.map((v) => v.toJson()).toList();
    }
    if (conditions != null) {
      data['conditions'] = conditions!.toJson();
    }
    // data['cancelled_at'] = this.cancelledAt;
    // if (this.changes != null) {
    //   data['changes'] = this.changes!.map((v) => v.toJson()).toList();
    // }
    data['content'] = content;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    // if (this.users != null) {
    //   data['users'] = this.users!.map((v) => v.toJson()).toList();
    // }
    // data['metadata'] = this.metadata;
    data['type'] = type;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Documents {
  List<String>? passengerIds;
  String? uniqueIdentifier;
  String? type;

  Documents({this.passengerIds, this.uniqueIdentifier, this.type});

  Documents.fromJson(Map<String, dynamic> json) {
    passengerIds = json['passenger_ids'].cast<String>();
    uniqueIdentifier = json['unique_identifier'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['passenger_ids'] = passengerIds;
    data['unique_identifier'] = uniqueIdentifier;
    data['type'] = type;
    return data;
  }
}

class BookingReferences {
  String? bookingReference;
  Carrier? carrier;

  BookingReferences({this.bookingReference, this.carrier});

  BookingReferences.fromJson(Map<String, dynamic> json) {
    bookingReference = json['booking_reference'];
    carrier =
        json['carrier'] != null ? Carrier.fromJson(json['carrier']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booking_reference'] = bookingReference;
    if (carrier != null) {
      data['carrier'] = carrier!.toJson();
    }
    return data;
  }
}

class Carrier {
  String? logoSymbolUrl;
  Null logoLockupUrl;
  String? conditionsOfCarriageUrl;
  String? iataCode;
  String? name;
  String? id;

  Carrier(
      {this.logoSymbolUrl,
      this.logoLockupUrl,
      this.conditionsOfCarriageUrl,
      this.iataCode,
      this.name,
      this.id});

  Carrier.fromJson(Map<String, dynamic> json) {
    logoSymbolUrl = json['logo_symbol_url'];
    logoLockupUrl = json['logo_lockup_url'];
    conditionsOfCarriageUrl = json['conditions_of_carriage_url'];
    iataCode = json['iata_code'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logo_symbol_url'] = logoSymbolUrl;
    data['logo_lockup_url'] = logoLockupUrl;
    data['conditions_of_carriage_url'] = conditionsOfCarriageUrl;
    data['iata_code'] = iataCode;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class PaymentStatus {
  String? paidAt;
  Null priceGuaranteeExpiresAt;
  Null paymentRequiredBy;
  bool? awaitingPayment;

  PaymentStatus(
      {this.paidAt,
      this.priceGuaranteeExpiresAt,
      this.paymentRequiredBy,
      this.awaitingPayment});

  PaymentStatus.fromJson(Map<String, dynamic> json) {
    paidAt = json['paid_at'];
    priceGuaranteeExpiresAt = json['price_guarantee_expires_at'];
    paymentRequiredBy = json['payment_required_by'];
    awaitingPayment = json['awaiting_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paid_at'] = paidAt;
    data['price_guarantee_expires_at'] = priceGuaranteeExpiresAt;
    data['payment_required_by'] = paymentRequiredBy;
    data['awaiting_payment'] = awaitingPayment;
    return data;
  }
}

class Slices {
  String? destinationType;
  String? originType;
  String? fareBrandName;
  List<Segments>? segments;
  Conditions? conditions;
  String? duration;
  Destination? destination;
  Origin? origin;
  String? id;

  Slices(
      {this.destinationType,
      this.originType,
      this.fareBrandName,
      this.segments,
      this.conditions,
      this.duration,
      this.destination,
      this.origin,
      this.id});

  Slices.fromJson(Map<String, dynamic> json) {
    destinationType = json['destination_type'];
    originType = json['origin_type'];
    fareBrandName = json['fare_brand_name'];
    if (json['segments'] != null) {
      segments = <Segments>[];
      json['segments'].forEach((v) {
        segments!.add(Segments.fromJson(v));
      });
    }
    conditions = json['conditions'] != null
        ? Conditions.fromJson(json['conditions'])
        : null;
    duration = json['duration'];
    destination = json['destination'] != null
        ? Destination.fromJson(json['destination'])
        : null;
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_type'] = destinationType;
    data['origin_type'] = originType;
    data['fare_brand_name'] = fareBrandName;
    if (segments != null) {
      data['segments'] = segments!.map((v) => v.toJson()).toList();
    }
    if (conditions != null) {
      data['conditions'] = conditions!.toJson();
    }
    data['duration'] = duration;
    if (destination != null) {
      data['destination'] = destination!.toJson();
    }
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Segments {
  String? originTerminal;
  String? destinationTerminal;
  Aircraft? aircraft;
  String? departingAt;
  String? arrivingAt;
  Carrier? operatingCarrier;
  Carrier? marketingCarrier;
  String? operatingCarrierFlightNumber;
  // List<Null>? stops;
  String? marketingCarrierFlightNumber;
  String? distance;
  List<Passengers>? passengers;
  String? duration;
  Destination? destination;
  Origin? origin;
  String? id;

  Segments(
      {this.originTerminal,
      this.destinationTerminal,
      this.aircraft,
      this.departingAt,
      this.arrivingAt,
      this.operatingCarrier,
      this.marketingCarrier,
      this.operatingCarrierFlightNumber,
      // this.stops,
      this.marketingCarrierFlightNumber,
      this.distance,
      this.passengers,
      this.duration,
      this.destination,
      this.origin,
      this.id});

  Segments.fromJson(Map<String, dynamic> json) {
    originTerminal = json['origin_terminal'];
    destinationTerminal = json['destination_terminal'];
    aircraft =
        json['aircraft'] != null ? Aircraft.fromJson(json['aircraft']) : null;
    departingAt = json['departing_at'];
    arrivingAt = json['arriving_at'];
    operatingCarrier = json['operating_carrier'] != null
        ? Carrier.fromJson(json['operating_carrier'])
        : null;
    marketingCarrier = json['marketing_carrier'] != null
        ? Carrier.fromJson(json['marketing_carrier'])
        : null;
    operatingCarrierFlightNumber = json['operating_carrier_flight_number'];
    // if (json['stops'] != null) {
    //   stops = <Null>[];
    //   json['stops'].forEach((v) {
    //     stops!.add(new Null.fromJson(v));
    //   });
    // }
    marketingCarrierFlightNumber = json['marketing_carrier_flight_number'];
    distance = json['distance'];
    if (json['passengers'] != null) {
      passengers = <Passengers>[];
      json['passengers'].forEach((v) {
        passengers!.add(Passengers.fromJson(v));
      });
    }
    duration = json['duration'];
    destination = json['destination'] != null
        ? Destination.fromJson(json['destination'])
        : null;
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['origin_terminal'] = originTerminal;
    data['destination_terminal'] = destinationTerminal;
    if (aircraft != null) {
      data['aircraft'] = aircraft!.toJson();
    }
    data['departing_at'] = departingAt;
    data['arriving_at'] = arrivingAt;
    if (operatingCarrier != null) {
      data['operating_carrier'] = operatingCarrier!.toJson();
    }
    if (marketingCarrier != null) {
      data['marketing_carrier'] = marketingCarrier!.toJson();
    }
    data['operating_carrier_flight_number'] = operatingCarrierFlightNumber;
    // if (this.stops != null) {
    //   data['stops'] = this.stops!.map((v) => v.toJson()).toList();
    // }
    data['marketing_carrier_flight_number'] = marketingCarrierFlightNumber;
    data['distance'] = distance;
    if (passengers != null) {
      data['passengers'] = passengers!.map((v) => v.toJson()).toList();
    }
    data['duration'] = duration;
    if (destination != null) {
      data['destination'] = destination!.toJson();
    }
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class Aircraft {
  String? iataCode;
  String? name;
  String? id;

  Aircraft({this.iataCode, this.name, this.id});

  Aircraft.fromJson(Map<String, dynamic> json) {
    iataCode = json['iata_code'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iata_code'] = iataCode;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Passengers {
  List<Baggages>? baggages;
  String? cabinClassMarketingName;
  String? passengerId;
  Seat? seat;
  String? cabinClass;

  Passengers(
      {this.baggages,
      this.cabinClassMarketingName,
      this.passengerId,
      this.seat,
      this.cabinClass});

  Passengers.fromJson(Map<String, dynamic> json) {
    if (json['baggages'] != null) {
      baggages = <Baggages>[];
      json['baggages'].forEach((v) {
        baggages!.add(Baggages.fromJson(v));
      });
    }
    cabinClassMarketingName = json['cabin_class_marketing_name'];
    passengerId = json['passenger_id'];
    seat = json['seat'] != null ? Seat.fromJson(json['seat']) : null;
    cabinClass = json['cabin_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (baggages != null) {
      data['baggages'] = baggages!.map((v) => v.toJson()).toList();
    }
    data['cabin_class_marketing_name'] = cabinClassMarketingName;
    data['passenger_id'] = passengerId;
    if (seat != null) {
      data['seat'] = seat!.toJson();
    }
    data['cabin_class'] = cabinClass;
    return data;
  }
}

class Baggages {
  int? quantity;
  String? type;

  Baggages({this.quantity, this.type});

  Baggages.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['type'] = type;
    return data;
  }
}

class Seat {
  // List<Null>? disclosures;
  String? designator;
  String? name;

  Seat(
      {
      // this.disclosures,
      this.designator,
      this.name});

  Seat.fromJson(Map<String, dynamic> json) {
    // if (json['disclosures'] != null) {
    //   disclosures = <Null>[];
    //   json['disclosures'].forEach((v) {
    //     disclosures!.add(new Null.fromJson(v));
    //   });
    // }
    designator = json['designator'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (this.disclosures != null) {
    //   data['disclosures'] = this.disclosures!.map((v) => v.toJson()).toList();
    // }
    data['designator'] = designator;
    data['name'] = name;
    return data;
  }
}

class Destination {
  String? icaoCode;
  String? iataCountryCode;
  String? iataCityCode;
  String? cityName;
  String? iataCode;
  double? latitude;
  double? longitude;
  City? city;
  String? timeZone;
  String? type;
  String? name;
  String? id;

  Destination(
      {this.icaoCode,
      this.iataCountryCode,
      this.iataCityCode,
      this.cityName,
      this.iataCode,
      this.latitude,
      this.longitude,
      this.city,
      this.timeZone,
      this.type,
      this.name,
      this.id});

  Destination.fromJson(Map<String, dynamic> json) {
    icaoCode = json['icao_code'];
    iataCountryCode = json['iata_country_code'];
    iataCityCode = json['iata_city_code'];
    cityName = json['city_name'];
    iataCode = json['iata_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    timeZone = json['time_zone'];
    type = json['type'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icao_code'] = icaoCode;
    data['iata_country_code'] = iataCountryCode;
    data['iata_city_code'] = iataCityCode;
    data['city_name'] = cityName;
    data['iata_code'] = iataCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['time_zone'] = timeZone;
    data['type'] = type;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class City {
  String? icaoCode;
  String? iataCountryCode;
  String? iataCityCode;
  String? cityName;
  String? iataCode;
  String? latitude;
  String? longitude;
  String? timeZone;
  String? type;
  String? name;
  String? id;

  City(
      {this.icaoCode,
      this.iataCountryCode,
      this.iataCityCode,
      this.cityName,
      this.iataCode,
      this.latitude,
      this.longitude,
      this.timeZone,
      this.type,
      this.name,
      this.id});

  City.fromJson(Map<String, dynamic> json) {
    icaoCode = json['icao_code'];
    iataCountryCode = json['iata_country_code'];
    iataCityCode = json['iata_city_code'];
    cityName = json['city_name'];
    iataCode = json['iata_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    timeZone = json['time_zone'];
    type = json['type'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icao_code'] = icaoCode;
    data['iata_country_code'] = iataCountryCode;
    data['iata_city_code'] = iataCityCode;
    data['city_name'] = cityName;
    data['iata_code'] = iataCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['time_zone'] = timeZone;
    data['type'] = type;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Origin {
  String? icaoCode;
  String? iataCountryCode;
  String? iataCityCode;
  String? cityName;
  String? iataCode;
  double? latitude;
  double? longitude;
  City? city;
  String? timeZone;
  String? type;
  String? name;
  String? id;

  Origin(
      {this.icaoCode,
      this.iataCountryCode,
      this.iataCityCode,
      this.cityName,
      this.iataCode,
      this.latitude,
      this.longitude,
      this.city,
      this.timeZone,
      this.type,
      this.name,
      this.id});

  Origin.fromJson(Map<String, dynamic> json) {
    icaoCode = json['icao_code'];
    iataCountryCode = json['iata_country_code'];
    iataCityCode = json['iata_city_code'];
    cityName = json['city_name'];
    iataCode = json['iata_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    timeZone = json['time_zone'];
    type = json['type'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icao_code'] = icaoCode;
    data['iata_country_code'] = iataCountryCode;
    data['iata_city_code'] = iataCityCode;
    data['city_name'] = cityName;
    data['iata_code'] = iataCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['time_zone'] = timeZone;
    data['type'] = type;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Conditions {
  ChangeBeforeDeparture? changeBeforeDeparture;

  Conditions({this.changeBeforeDeparture});

  Conditions.fromJson(Map<String, dynamic> json) {
    changeBeforeDeparture = json['change_before_departure'] != null
        ? ChangeBeforeDeparture.fromJson(json['change_before_departure'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (changeBeforeDeparture != null) {
      data['change_before_departure'] = changeBeforeDeparture!.toJson();
    }
    return data;
  }
}

class ChangeBeforeDeparture {
  String? penaltyCurrency;
  String? penaltyAmount;
  bool? allowed;

  ChangeBeforeDeparture(
      {this.penaltyCurrency, this.penaltyAmount, this.allowed});

  ChangeBeforeDeparture.fromJson(Map<String, dynamic> json) {
    penaltyCurrency = json['penalty_currency'];
    penaltyAmount = json['penalty_amount'];
    allowed = json['allowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['penalty_currency'] = penaltyCurrency;
    data['penalty_amount'] = penaltyAmount;
    data['allowed'] = allowed;
    return data;
  }
}

// class Passengers {
//   String? bornOn;
//   List<Null>? loyaltyProgrammeAccounts;
//   String? familyName;
//   String? givenName;
//   String? gender;
//   Null? infantPassengerId;
//   String? phoneNumber;
//   Null? userId;
//   String? email;
//   String? title;
//   String? type;
//   String? id;
//
//   Passengers(
//       {this.bornOn,
//         this.loyaltyProgrammeAccounts,
//         this.familyName,
//         this.givenName,
//         this.gender,
//         this.infantPassengerId,
//         this.phoneNumber,
//         this.userId,
//         this.email,
//         this.title,
//         this.type,
//         this.id});
//
//   Passengers.fromJson(Map<String, dynamic> json) {
//     bornOn = json['born_on'];
//     if (json['loyalty_programme_accounts'] != null) {
//       loyaltyProgrammeAccounts = <Null>[];
//       json['loyalty_programme_accounts'].forEach((v) {
//         loyaltyProgrammeAccounts!.add(new Null.fromJson(v));
//       });
//     }
//     familyName = json['family_name'];
//     givenName = json['given_name'];
//     gender = json['gender'];
//     infantPassengerId = json['infant_passenger_id'];
//     phoneNumber = json['phone_number'];
//     userId = json['user_id'];
//     email = json['email'];
//     title = json['title'];
//     type = json['type'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['born_on'] = this.bornOn;
//     if (this.loyaltyProgrammeAccounts != null) {
//       data['loyalty_programme_accounts'] =
//           this.loyaltyProgrammeAccounts!.map((v) => v.toJson()).toList();
//     }
//     data['family_name'] = this.familyName;
//     data['given_name'] = this.givenName;
//     data['gender'] = this.gender;
//     data['infant_passenger_id'] = this.infantPassengerId;
//     data['phone_number'] = this.phoneNumber;
//     data['user_id'] = this.userId;
//     data['email'] = this.email;
//     data['title'] = this.title;
//     data['type'] = this.type;
//     data['id'] = this.id;
//     return data;
//   }
// }
//
// class Conditions {
//   RefundBeforeDeparture? refundBeforeDeparture;
//   ChangeBeforeDeparture? changeBeforeDeparture;
//
//   Conditions({this.refundBeforeDeparture, this.changeBeforeDeparture});
//
//   Conditions.fromJson(Map<String, dynamic> json) {
//     refundBeforeDeparture = json['refund_before_departure'] != null
//         ? new RefundBeforeDeparture.fromJson(json['refund_before_departure'])
//         : null;
//     changeBeforeDeparture = json['change_before_departure'] != null
//         ? new ChangeBeforeDeparture.fromJson(json['change_before_departure'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.refundBeforeDeparture != null) {
//       data['refund_before_departure'] = this.refundBeforeDeparture!.toJson();
//     }
//     if (this.changeBeforeDeparture != null) {
//       data['change_before_departure'] = this.changeBeforeDeparture!.toJson();
//     }
//     return data;
//   }
// }

class RefundBeforeDeparture {
  String? penaltyCurrency;
  String? penaltyAmount;
  bool? allowed;

  RefundBeforeDeparture(
      {this.penaltyCurrency, this.penaltyAmount, this.allowed});

  RefundBeforeDeparture.fromJson(Map<String, dynamic> json) {
    penaltyCurrency = json['penalty_currency'];
    penaltyAmount = json['penalty_amount'];
    allowed = json['allowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['penalty_currency'] = penaltyCurrency;
    data['penalty_amount'] = penaltyAmount;
    data['allowed'] = allowed;
    return data;
  }
}

class Services {
  List<String>? segmentIds;
  List<String>? passengerIds;
  String? totalCurrency;
  String? totalAmount;
  int? quantity;
  Metadata? metadata;
  String? type;
  String? id;

  Services(
      {this.segmentIds,
      this.passengerIds,
      this.totalCurrency,
      this.totalAmount,
      this.quantity,
      this.metadata,
      this.type,
      this.id});

  Services.fromJson(Map<String, dynamic> json) {
    segmentIds = json['segment_ids'].cast<String>();
    passengerIds = json['passenger_ids'].cast<String>();
    totalCurrency = json['total_currency'];
    totalAmount = json['total_amount'];
    quantity = json['quantity'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['segment_ids'] = segmentIds;
    data['passenger_ids'] = passengerIds;
    data['total_currency'] = totalCurrency;
    data['total_amount'] = totalAmount;
    data['quantity'] = quantity;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['type'] = type;
    data['id'] = id;
    return data;
  }
}

class Metadata {
  Null maximumLengthCm;
  Null maximumHeightCm;
  Null maximumDepthCm;
  int? maximumWeightKg;
  String? type;
  // List<Null>? disclosures;
  String? designator;
  Null name;

  Metadata(
      {this.maximumLengthCm,
      this.maximumHeightCm,
      this.maximumDepthCm,
      this.maximumWeightKg,
      this.type,
      // this.disclosures,
      this.designator,
      this.name});

  Metadata.fromJson(Map<String, dynamic> json) {
    maximumLengthCm = json['maximum_length_cm'];
    maximumHeightCm = json['maximum_height_cm'];
    maximumDepthCm = json['maximum_depth_cm'];
    maximumWeightKg = json['maximum_weight_kg'];
    type = json['type'];
    // if (json['disclosures'] != null) {
    //   disclosures = <Null>[];
    //   json['disclosures'].forEach((v) {
    //     disclosures!.add(new Null.fromJson(v));
    //   });
    // }
    designator = json['designator'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum_length_cm'] = maximumLengthCm;
    data['maximum_height_cm'] = maximumHeightCm;
    data['maximum_depth_cm'] = maximumDepthCm;
    data['maximum_weight_kg'] = maximumWeightKg;
    data['type'] = type;
    // if (this.disclosures != null) {
    //   data['disclosures'] = this.disclosures!.map((v) => v.toJson()).toList();
    // }
    data['designator'] = designator;
    data['name'] = name;
    return data;
  }
}

class Paid {
  double? amount;
  String? currency;

  Paid({this.amount, this.currency});

  Paid.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}

class User {
  int? id;
  Null referredBy;
  int? isReferralRewarded;
  String? name;
  String? email;
  String? salutation;
  String? age;
  Null userId;
  String? company;
  String? panNumber;
  String? panName;
  String? address;
  String? country;
  String? state;
  String? city;
  String? pinCode;
  String? mobile;
  String? phone;
  String? companyLogo;
  String? bankAccountName;
  String? bankAccountNumber;
  String? bankIfscCode;
  Null emailVerificationToken;
  String? emailVerificationStatus;
  Null emailVerifiedAt;
  String? passwordReset;
  int? passwordStatus;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? adminapprovel;
  String? avatar;
  int? isGoogleAccount;
  Null agentId;
  Null agentPercentage;
  String? currency;
  String? referralCode;
  String? fcmToken;

  User(
      {this.id,
      this.referredBy,
      this.isReferralRewarded,
      this.name,
      this.email,
      this.salutation,
      this.age,
      this.userId,
      this.company,
      this.panNumber,
      this.panName,
      this.address,
      this.country,
      this.state,
      this.city,
      this.pinCode,
      this.mobile,
      this.phone,
      this.companyLogo,
      this.bankAccountName,
      this.bankAccountNumber,
      this.bankIfscCode,
      this.emailVerificationToken,
      this.emailVerificationStatus,
      this.emailVerifiedAt,
      this.passwordReset,
      this.passwordStatus,
      this.createdAt,
      this.updatedAt,
      this.role,
      this.adminapprovel,
      this.avatar,
      this.isGoogleAccount,
      this.agentId,
      this.agentPercentage,
      this.currency,
      this.referralCode,
      this.fcmToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referredBy = json['referred_by'];
    isReferralRewarded = json['is_referral_rewarded'];
    name = json['name'];
    email = json['email'];
    salutation = json['salutation'];
    age = json['age'];
    userId = json['user_id'];
    company = json['company'];
    panNumber = json['pan_number'];
    panName = json['pan_name'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    pinCode = json['pin_code'];
    mobile = json['mobile'];
    phone = json['phone'];
    companyLogo = json['company_logo'];
    bankAccountName = json['bank_account_name'];
    bankAccountNumber = json['bank_account_number'];
    bankIfscCode = json['bank_ifsc_code'];
    emailVerificationToken = json['email_verification_token'];
    emailVerificationStatus = json['email_verification_status'];
    emailVerifiedAt = json['email_verified_at'];
    passwordReset = json['password_reset'];
    passwordStatus = json['password_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    adminapprovel = json['adminapprovel'];
    avatar = json['avatar'];
    isGoogleAccount = json['is_google_account'];
    agentId = json['agent_id'];
    agentPercentage = json['agent_percentage'];
    currency = json['currency'];
    referralCode = json['referral_code'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['referred_by'] = referredBy;
    data['is_referral_rewarded'] = isReferralRewarded;
    data['name'] = name;
    data['email'] = email;
    data['salutation'] = salutation;
    data['age'] = age;
    data['user_id'] = userId;
    data['company'] = company;
    data['pan_number'] = panNumber;
    data['pan_name'] = panName;
    data['address'] = address;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['pin_code'] = pinCode;
    data['mobile'] = mobile;
    data['phone'] = phone;
    data['company_logo'] = companyLogo;
    data['bank_account_name'] = bankAccountName;
    data['bank_account_number'] = bankAccountNumber;
    data['bank_ifsc_code'] = bankIfscCode;
    data['email_verification_token'] = emailVerificationToken;
    data['email_verification_status'] = emailVerificationStatus;
    data['email_verified_at'] = emailVerifiedAt;
    data['password_reset'] = passwordReset;
    data['password_status'] = passwordStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role'] = role;
    data['adminapprovel'] = adminapprovel;
    data['avatar'] = avatar;
    data['is_google_account'] = isGoogleAccount;
    data['agent_id'] = agentId;
    data['agent_percentage'] = agentPercentage;
    data['currency'] = currency;
    data['referral_code'] = referralCode;
    data['fcm_token'] = fcmToken;
    return data;
  }
}

class Flight {
  int? id;
  int? userId;
  String? tripeId;
  Null airlinePnr;
  int? noOfAdults;
  int? noOfChilds;
  int? noOfInfants;
  String? classType;
  String? currency;
  String? tripType;
  String? origin;
  String? destination;
  Null sellRequestId;
  String? destinationDate;
  String? arrivalDate;
  int? isPaid;
  int? status;
  int? paymentStatus;
  String? transactionNo;
  Null description;
  String? createdAt;
  String? updatedAt;

  Flight(
      {this.id,
      this.userId,
      this.tripeId,
      this.airlinePnr,
      this.noOfAdults,
      this.noOfChilds,
      this.noOfInfants,
      this.classType,
      this.currency,
      this.tripType,
      this.origin,
      this.destination,
      this.sellRequestId,
      this.destinationDate,
      this.arrivalDate,
      this.isPaid,
      this.status,
      this.paymentStatus,
      this.transactionNo,
      this.description,
      this.createdAt,
      this.updatedAt});

  Flight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tripeId = json['tripe_id'];
    airlinePnr = json['airline_pnr'];
    noOfAdults = json['NoOfAdults'];
    noOfChilds = json['NoOfChilds'];
    noOfInfants = json['NoOfInfants'];
    classType = json['ClassType'];
    currency = json['Currency'];
    tripType = json['TripType'];
    origin = json['Origin'];
    destination = json['Destination'];
    sellRequestId = json['sellRequestId'];
    destinationDate = json['DestinationDate'];
    arrivalDate = json['arrivalDate'];
    isPaid = json['is_paid'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    transactionNo = json['transaction_no'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['tripe_id'] = tripeId;
    data['airline_pnr'] = airlinePnr;
    data['NoOfAdults'] = noOfAdults;
    data['NoOfChilds'] = noOfChilds;
    data['NoOfInfants'] = noOfInfants;
    data['ClassType'] = classType;
    data['Currency'] = currency;
    data['TripType'] = tripType;
    data['Origin'] = origin;
    data['Destination'] = destination;
    data['sellRequestId'] = sellRequestId;
    data['DestinationDate'] = destinationDate;
    data['arrivalDate'] = arrivalDate;
    data['is_paid'] = isPaid;
    data['status'] = status;
    data['payment_status'] = paymentStatus;
    data['transaction_no'] = transactionNo;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ServiceData {
  Null meta;
  // List<Null>? data;

  ServiceData({
    this.meta,
    // this.data
  });

  ServiceData.fromJson(Map<String, dynamic> json) {
    meta = json['meta'];
    // if (json['data'] != null) {
    //   data = <Null>[];
    //   json['data'].forEach((v) {
    //     data!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meta'] = meta;
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
