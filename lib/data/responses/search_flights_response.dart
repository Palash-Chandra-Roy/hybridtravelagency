import 'dart:convert';

SearchFlightsResponse searchFlightsResponseFromJson(String str) =>
    SearchFlightsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String searchFlightsResponseToJson(SearchFlightsResponse data) =>
    json.encode(data.toJson());


class SearchFlightsResponse {
  bool? success;
  String? message;
  Data? data;
  int? percentage;
  int? fixed;
  String? flightType;

  SearchFlightsResponse({this.success, this.message, this.data});

  SearchFlightsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  Data1? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data = json['data'] != null ? Data1.fromJson(json['data']) : null;
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data1 {
  FlightData? data;

  Data1({this.data});

  Data1.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? FlightData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FlightData {
  List<AvailableAirlineCredits>? availableAirlineCredits;
  List<Offers>? offers;
  String? cabinClass;
  bool? liveMode;
  String? createdAt;
  List<Slices>? slices;
  List<Passengers1>? passengers;
  String? clientKey;
  String? id;

  FlightData(
      {this.availableAirlineCredits,
        this.offers,
        this.cabinClass,
        this.liveMode,
        this.createdAt,
        this.slices,
        this.passengers,
        this.clientKey,
        this.id});

  FlightData.fromJson(Map<String, dynamic> json) {
    if (json['available_airline_credits'] != null) {
      availableAirlineCredits = <AvailableAirlineCredits>[];
      json['available_airline_credits'].forEach((v) {
        availableAirlineCredits!.add(AvailableAirlineCredits.fromJson(v));
      });
    }
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
    cabinClass = json['cabin_class'];
    liveMode = json['live_mode'];
    createdAt = json['created_at'];
    if (json['slices'] != null) {
      slices = <Slices>[];
      json['slices'].forEach((v) {
        slices!.add(Slices.fromJson(v));
      });
    }
    if (json['passengers'] != null) {
      passengers = <Passengers1>[];
      json['passengers'].forEach((v) {
        passengers!.add(Passengers1.fromJson(v));
      });
    }
    clientKey = json['client_key'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (availableAirlineCredits != null) {
      data['available_airline_credits'] =
          availableAirlineCredits!.map((v) => v.toJson()).toList();
    }
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    data['cabin_class'] = cabinClass;
    data['live_mode'] = liveMode;
    data['created_at'] = createdAt;
    if (slices != null) {
      data['slices'] = slices!.map((v) => v.toJson()).toList();
    }
    if (passengers != null) {
      data['passengers'] = passengers!.map((v) => v.toJson()).toList();
    }
    data['client_key'] = clientKey;
    data['id'] = id;
    return data;
  }
}

class AvailableAirlineCredits{

  AvailableAirlineCredits();

  AvailableAirlineCredits.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Offers {
  String? totalEmissionsKg;
  String? intendedTotalAmount;
  String? intendedServices;
  String? intendedBaseAmount;
  PaymentRequirements? paymentRequirements;
  String? availableServices;
  List<String>? supportedPassengerIdentityDocumentTypes;
  bool? passengerIdentityDocumentsRequired;
  String? taxCurrency;
  String? baseCurrency;
  String? baseAmount;
  List<String>? supportedLoyaltyProgrammes;
  List<PrivateFares>? privateFares;
  String? taxAmount;
  String? totalCurrency;
  String? totalAmount;
  bool? liveMode;
  String? createdAt;
  List<Slices>? slices;
  List<Passengers>? passengers;
  Conditions? conditions;
  String? updatedAt;
  String? expiresAt;
  bool? partial;
  OperatingCarrier? owner;
  String? id;

  Offers(
      {this.totalEmissionsKg,
        this.intendedTotalAmount,
        this.intendedServices,
        this.intendedBaseAmount,
        this.paymentRequirements,
        this.availableServices,
        this.supportedPassengerIdentityDocumentTypes,
        this.passengerIdentityDocumentsRequired,
        this.taxCurrency,
        this.baseCurrency,
        this.baseAmount,
        this.supportedLoyaltyProgrammes,
        this.privateFares,
        this.taxAmount,
        this.totalCurrency,
        this.totalAmount,
        this.liveMode,
        this.createdAt,
        this.slices,
        this.passengers,
        this.conditions,
        this.updatedAt,
        this.expiresAt,
        this.partial,
        this.owner,
        this.id});

  Offers.fromJson(Map<String, dynamic> json) {
    totalEmissionsKg = json['total_emissions_kg'];
    intendedTotalAmount = json['intended_total_amount'];
    intendedServices = json['intended_services'];
    intendedBaseAmount = json['intended_base_amount'];
    paymentRequirements = json['payment_requirements'] != null
        ? PaymentRequirements.fromJson(json['payment_requirements'])
        : null;
    availableServices = json['available_services'];
    supportedPassengerIdentityDocumentTypes =
        json['supported_passenger_identity_document_types'].cast<String>();
    passengerIdentityDocumentsRequired =
    json['passenger_identity_documents_required'];
    taxCurrency = json['tax_currency'];
    baseCurrency = json['base_currency'];
    baseAmount = json['base_amount'];
    supportedLoyaltyProgrammes =
        json['supported_loyalty_programmes'].cast<String>();
    if (json['private_fares'] != null) {
      privateFares = <PrivateFares>[];
      json['private_fares'].forEach((v) {
        privateFares!.add(PrivateFares.fromJson(v));
      });
    }
    taxAmount = json['tax_amount'];
    totalCurrency = json['total_currency'];
    totalAmount = json['total_amount'];
    liveMode = json['live_mode'];
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
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
    partial = json['partial'];
    owner = json['owner'] != null
        ? OperatingCarrier.fromJson(json['owner'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_emissions_kg'] = totalEmissionsKg;
    data['intended_total_amount'] = intendedTotalAmount;
    data['intended_services'] = intendedServices;
    data['intended_base_amount'] = intendedBaseAmount;
    if (paymentRequirements != null) {
      data['payment_requirements'] = paymentRequirements!.toJson();
    }
    data['available_services'] = availableServices;
    data['supported_passenger_identity_document_types'] =
        supportedPassengerIdentityDocumentTypes;
    data['passenger_identity_documents_required'] =
        passengerIdentityDocumentsRequired;
    data['tax_currency'] = taxCurrency;
    data['base_currency'] = baseCurrency;
    data['base_amount'] = baseAmount;

    data['supported_loyalty_programmes'] =
          supportedLoyaltyProgrammes;
    if (privateFares != null) {
      data['private_fares'] =
          privateFares!.map((v) => v.toJson()).toList();
    }
    data['tax_amount'] = taxAmount;
    data['total_currency'] = totalCurrency;
    data['total_amount'] = totalAmount;
    data['live_mode'] = liveMode;
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
    data['updated_at'] = updatedAt;
    data['expires_at'] = expiresAt;
    data['partial'] = partial;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['id'] = id;
    return data;
  }
}

class SupportedLoyaltyProgrammes{

  SupportedLoyaltyProgrammes();

  SupportedLoyaltyProgrammes.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class PrivateFares{

  PrivateFares();

  PrivateFares.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class PaymentRequirements {
  bool? requiresInstantPayment;
  String? priceGuaranteeExpiresAt;
  String? paymentRequiredBy;

  PaymentRequirements(
      {this.requiresInstantPayment,
        this.priceGuaranteeExpiresAt,
        this.paymentRequiredBy});

  PaymentRequirements.fromJson(Map<String, dynamic> json) {
    requiresInstantPayment = json['requires_instant_payment'];
    priceGuaranteeExpiresAt = json['price_guarantee_expires_at'];
    paymentRequiredBy = json['payment_required_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requires_instant_payment'] = requiresInstantPayment;
    data['price_guarantee_expires_at'] = priceGuaranteeExpiresAt;
    data['payment_required_by'] = paymentRequiredBy;
    return data;
  }
}

class Slices {
  String? comparisonKey;
  int? ngsShelf;
  String? destinationType;
  String? originType;
  String? fareBrandName;
  List<Segments>? segments;
  Conditions? conditions;
  String? duration;
  Destination? destination;
  Destination? origin;
  String? id;

  Slices(
      {this.comparisonKey,
        this.ngsShelf,
        this.destinationType,
        this.originType,
        this.fareBrandName,
        this.segments,
        this.conditions,
        this.duration,
        this.destination,
        this.origin,
        this.id});

  Slices.fromJson(Map<String, dynamic> json) {
    comparisonKey = json['comparison_key'];
    ngsShelf = json['ngs_shelf'];
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
    origin = json['origin'] != null
        ? Destination.fromJson(json['origin'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comparison_key'] = comparisonKey;
    data['ngs_shelf'] = ngsShelf;
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
  OperatingCarrier? operatingCarrier;
  OperatingCarrier? marketingCarrier;
  List<Stops>? stops;
  String? operatingCarrierFlightNumber;
  String? marketingCarrierFlightNumber;
  String? distance;
  List<Passengers>? passengers;
  List<Media>? media;
  String? duration;
  Destination? destination;
  Destination? origin;
  String? id;

  Segments(
      {this.originTerminal,
        this.destinationTerminal,
        this.aircraft,
        this.departingAt,
        this.arrivingAt,
        this.operatingCarrier,
        this.marketingCarrier,
        this.stops,
        this.operatingCarrierFlightNumber,
        this.marketingCarrierFlightNumber,
        this.distance,
        this.passengers,
        this.media,
        this.duration,
        this.destination,
        this.origin,
        this.id});

  Segments.fromJson(Map<String, dynamic> json) {
    originTerminal = json['origin_terminal'];
    destinationTerminal = json['destination_terminal'];
    aircraft = json['aircraft'] != null
        ? Aircraft.fromJson(json['aircraft'])
        : null;
    departingAt = json['departing_at'];
    arrivingAt = json['arriving_at'];
    operatingCarrier = json['operating_carrier'] != null
        ? OperatingCarrier.fromJson(json['operating_carrier'])
        : null;
    marketingCarrier = json['marketing_carrier'] != null
        ? OperatingCarrier.fromJson(json['marketing_carrier'])
        : null;
    if (json['stops'] != null) {
      stops = <Stops>[];
      json['stops'].forEach((v) {
        stops!.add(Stops.fromJson(v));
      });
    }
    operatingCarrierFlightNumber = json['operating_carrier_flight_number'];
    marketingCarrierFlightNumber = json['marketing_carrier_flight_number'];
    distance = json['distance'];
    if (json['passengers'] != null) {
      passengers = <Passengers>[];
      json['passengers'].forEach((v) {
        passengers!.add(Passengers.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    duration = json['duration'];
    destination = json['destination'] != null
        ? Destination.fromJson(json['destination'])
        : null;
    origin = json['origin'] != null
        ? Destination.fromJson(json['origin'])
        : null;
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
    if (stops != null) {
      data['stops'] = stops!.map((v) => v.toJson()).toList();
    }
    data['operating_carrier_flight_number'] = operatingCarrierFlightNumber;
    data['marketing_carrier_flight_number'] = marketingCarrierFlightNumber;
    data['distance'] = distance;
    if (passengers != null) {
      data['passengers'] = passengers!.map((v) => v.toJson()).toList();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
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

class Stops {
  String? name;
  String? id;

  Stops({this.name, this.id});

  Stops.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Media {
  String? name;
  String? id;

  Media({this.name, this.id});

  Media.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class OperatingCarrier {
  String? logoSymbolUrl;
  String? logoLockupUrl;
  String? conditionsOfCarriageUrl;
  String? iataCode;
  String? name;
  String? id;

  OperatingCarrier(
      {this.logoSymbolUrl,
        this.logoLockupUrl,
        this.conditionsOfCarriageUrl,
        this.iataCode,
        this.name,
        this.id});

  OperatingCarrier.fromJson(Map<String, dynamic> json) {
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

class Passengers {
  Cabin? cabin;
  List<Baggages>? baggages;
  String? cabinClassMarketingName;
  String? passengerId;
  String? fareBasisCode;
  String? cabinClass;

  Passengers(
      {this.cabin,
        this.baggages,
        this.cabinClassMarketingName,
        this.passengerId,
        this.fareBasisCode,
        this.cabinClass});

  Passengers.fromJson(Map<String, dynamic> json) {
    cabin = json['cabin'] != null ? Cabin.fromJson(json['cabin']) : null;
    if (json['baggages'] != null) {
      baggages = <Baggages>[];
      json['baggages'].forEach((v) {
        baggages!.add(Baggages.fromJson(v));
      });
    }
    cabinClassMarketingName = json['cabin_class_marketing_name'];
    passengerId = json['passenger_id'];
    fareBasisCode = json['fare_basis_code'];
    cabinClass = json['cabin_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cabin != null) {
      data['cabin'] = cabin!.toJson();
    }
    if (baggages != null) {
      data['baggages'] = baggages!.map((v) => v.toJson()).toList();
    }
    data['cabin_class_marketing_name'] = cabinClassMarketingName;
    data['passenger_id'] = passengerId;
    data['fare_basis_code'] = fareBasisCode;
    data['cabin_class'] = cabinClass;
    return data;
  }
}

class Cabin {
  Amenities? amenities;
  String? marketingName;
  String? name;

  Cabin({this.amenities, this.marketingName, this.name});

  Cabin.fromJson(Map<String, dynamic> json) {
    amenities = json['amenities'] != null
        ? Amenities.fromJson(json['amenities'])
        : null;
    marketingName = json['marketing_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (amenities != null) {
      data['amenities'] = amenities!.toJson();
    }
    data['marketing_name'] = marketingName;
    data['name'] = name;
    return data;
  }
}

class Amenities {
  Wifi? wifi;
  Seat? seat;
  Power? power;

  Amenities({this.wifi, this.seat, this.power});

  Amenities.fromJson(Map<String, dynamic> json) {
    wifi = json['wifi'] != null ? Wifi.fromJson(json['wifi']) : null;
    seat = json['seat'] != null ? Seat.fromJson(json['seat']) : null;
    power = json['power'] != null ? Power.fromJson(json['power']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wifi != null) {
      data['wifi'] = wifi!.toJson();
    }
    if (seat != null) {
      data['seat'] = seat!.toJson();
    }
    if (power != null) {
      data['power'] = power!.toJson();
    }
    return data;
  }
}

class Wifi {
  String? cost;
  bool? available;

  Wifi({this.cost, this.available});

  Wifi.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost'] = cost;
    data['available'] = available;
    return data;
  }
}

class Seat {
  String? pitch;
  String? legroom;
  String? type;

  Seat({this.pitch, this.legroom, this.type});

  Seat.fromJson(Map<String, dynamic> json) {
    pitch = json['pitch'];
    legroom = json['legroom'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pitch'] = pitch;
    data['legroom'] = legroom;
    data['type'] = type;
    return data;
  }
}

class Power {
  bool? available;

  Power({this.available});

  Power.fromJson(Map<String, dynamic> json) {
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
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

class Destination {
  String? iataCityCode;
  String? iataCountryCode;
  String? icaoCode;
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
      {this.iataCityCode,
        this.iataCountryCode,
        this.icaoCode,
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
    iataCityCode = json['iata_city_code'];
    iataCountryCode = json['iata_country_code'];
    icaoCode = json['icao_code'];
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
    data['iata_city_code'] = iataCityCode;
    data['iata_country_code'] = iataCountryCode;
    data['icao_code'] = icaoCode;
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
  String? iataCityCode;
  String? iataCountryCode;
  String? icaoCode;
  String? cityName;
  String? iataCode;
  String? latitude;
  String? longitude;
  String? timeZone;
  String? type;
  String? name;
  String? id;

  City(
      {this.iataCityCode,
        this.iataCountryCode,
        this.icaoCode,
        this.cityName,
        this.iataCode,
        this.latitude,
        this.longitude,
        this.timeZone,
        this.type,
        this.name,
        this.id});

  City.fromJson(Map<String, dynamic> json) {
    iataCityCode = json['iata_city_code'];
    iataCountryCode = json['iata_country_code'];
    icaoCode = json['icao_code'];
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
    data['iata_city_code'] = iataCityCode;
    data['iata_country_code'] = iataCountryCode;
    data['icao_code'] = icaoCode;
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

class Conditions {
  RefundBeforeDeparture? refundBeforeDeparture;
  String? priorityCheckIn;
  String? priorityBoarding;
  String? advanceSeatSelection;
  ChangeBeforeDeparture? changeBeforeDeparture;

  Conditions(
      {this.priorityCheckIn,
        this.priorityBoarding,
        this.advanceSeatSelection,
        this.changeBeforeDeparture,
      this.refundBeforeDeparture});

  Conditions.fromJson(Map<String, dynamic> json) {
    priorityCheckIn = json['priority_check_in'];
    priorityBoarding = json['priority_boarding'];
    advanceSeatSelection = json['advance_seat_selection'];
    refundBeforeDeparture = json['refund_before_departure'] != null
        ? RefundBeforeDeparture.fromJson(json['refund_before_departure'])
        : null;
    changeBeforeDeparture = json['change_before_departure'] != null
        ? ChangeBeforeDeparture.fromJson(json['change_before_departure'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priority_check_in'] = priorityCheckIn;
    data['priority_boarding'] = priorityBoarding;
    data['advance_seat_selection'] = advanceSeatSelection;
    if (changeBeforeDeparture != null) {
      data['change_before_departure'] = changeBeforeDeparture!.toJson();
    }
    if (refundBeforeDeparture != null) {
      data['refund_before_departure'] = refundBeforeDeparture!.toJson();
    }
    return data;
  }
}

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

class Passengers1 {
  String? fareType;
  List<LoyaltyProgrammeAccounts>? loyaltyProgrammeAccounts;
  String? familyName;
  String? givenName;
  String? age;
  String? type;
  String? id;

  Passengers1(
      {this.fareType,
        this.loyaltyProgrammeAccounts,
        this.familyName,
        this.givenName,
        this.age,
        this.type,
        this.id});

  Passengers1.fromJson(Map<String, dynamic> json) {
    fareType = json['fare_type'];
    if (json['loyalty_programme_accounts'] != null) {
      loyaltyProgrammeAccounts = <LoyaltyProgrammeAccounts>[];
      json['loyalty_programme_accounts'].forEach((v) {
        loyaltyProgrammeAccounts!.add(LoyaltyProgrammeAccounts.fromJson(v));
      });
    }
    familyName = json['family_name'];
    givenName = json['given_name'];
    age = json['age'];
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fare_type'] = fareType;
    if (loyaltyProgrammeAccounts != null) {
      data['loyalty_programme_accounts'] =
          loyaltyProgrammeAccounts!.map((v) => v.toJson()).toList();
    }
    data['family_name'] = familyName;
    data['given_name'] = givenName;
    data['age'] = age;
    data['type'] = type;
    data['id'] = id;
    return data;
  }
}

class LoyaltyProgrammeAccounts{

  LoyaltyProgrammeAccounts();

  LoyaltyProgrammeAccounts.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

// class Conditions {
//   ChangeBeforeDeparture? refundBeforeDeparture;
//   ChangeBeforeDeparture? changeBeforeDeparture;
//
//   Conditions({this.refundBeforeDeparture, this.changeBeforeDeparture});
//
//   Conditions.fromJson(Map<String, dynamic> json) {
//     refundBeforeDeparture = json['refund_before_departure'] != null
//         ? new ChangeBeforeDeparture.fromJson(json['refund_before_departure'])
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
//
// class Slices {
//   String? destinationType;
//   String? originType;
//   String? departureDate;
//   Destination? destination;
//   Destination? origin;
//
//   Slices(
//       {this.destinationType,
//         this.originType,
//         this.departureDate,
//         this.destination,
//         this.origin});
//
//   Slices.fromJson(Map<String, dynamic> json) {
//     destinationType = json['destination_type'];
//     originType = json['origin_type'];
//     departureDate = json['departure_date'];
//     destination = json['destination'] != null
//         ? new Destination.fromJson(json['destination'])
//         : null;
//     origin = json['origin'] != null
//         ? new Destination.fromJson(json['origin'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['destination_type'] = this.destinationType;
//     data['origin_type'] = this.originType;
//     data['departure_date'] = this.departureDate;
//     if (this.destination != null) {
//       data['destination'] = this.destination!.toJson();
//     }
//     if (this.origin != null) {
//       data['origin'] = this.origin!.toJson();
//     }
//     return data;
//   }
// }
//
// class Destination {
//   String? iataCityCode;
//   String? iataCountryCode;
//   String? icaoCode;
//   String? cityName;
//   String? iataCode;
//   double? latitude;
//   double? longitude;
//   String? city;
//   String? timeZone;
//   String? type;
//   String? name;
//   String? id;
//   List<Airports>? airports;
//
//   Destination(
//       {this.iataCityCode,
//         this.iataCountryCode,
//         this.icaoCode,
//         this.cityName,
//         this.iataCode,
//         this.latitude,
//         this.longitude,
//         this.city,
//         this.timeZone,
//         this.type,
//         this.name,
//         this.id,
//         this.airports});
//
//   Destination.fromJson(Map<String, dynamic> json) {
//     iataCityCode = json['iata_city_code'];
//     iataCountryCode = json['iata_country_code'];
//     icaoCode = json['icao_code'];
//     cityName = json['city_name'];
//     iataCode = json['iata_code'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     city = json['city'];
//     timeZone = json['time_zone'];
//     type = json['type'];
//     name = json['name'];
//     id = json['id'];
//     if (json['airports'] != null) {
//       airports = <Airports>[];
//       json['airports'].forEach((v) {
//         airports!.add(new Airports.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['iata_city_code'] = this.iataCityCode;
//     data['iata_country_code'] = this.iataCountryCode;
//     data['icao_code'] = this.icaoCode;
//     data['city_name'] = this.cityName;
//     data['iata_code'] = this.iataCode;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['city'] = this.city;
//     data['time_zone'] = this.timeZone;
//     data['type'] = this.type;
//     data['name'] = this.name;
//     data['id'] = this.id;
//     if (this.airports != null) {
//       data['airports'] = this.airports!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Airports {
  String? iataCityCode;
  String? iataCountryCode;
  String? icaoCode;
  String? cityName;
  String? iataCode;
  double? latitude;
  double? longitude;
  String? timeZone;
  String? type;
  String? name;
  String? id;

  Airports(
      {this.iataCityCode,
        this.iataCountryCode,
        this.icaoCode,
        this.cityName,
        this.iataCode,
        this.latitude,
        this.longitude,
        this.timeZone,
        this.type,
        this.name,
        this.id});

  Airports.fromJson(Map<String, dynamic> json) {
    iataCityCode = json['iata_city_code'];
    iataCountryCode = json['iata_country_code'];
    icaoCode = json['icao_code'];
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
    data['iata_city_code'] = iataCityCode;
    data['iata_country_code'] = iataCountryCode;
    data['icao_code'] = icaoCode;
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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
