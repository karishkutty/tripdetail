class HotelList {
  HotelList({
    required this.hotelId,
    required this.preferedHotel,
    required this.hotelCode,
    required this.hotelName,
    required this.localHotelId,
    required this.isFavourite,
    required this.propertyRating,
    required this.available,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.shortDescription,
    required this.thumbNailUrl,
    required this.rateCurrencyCode,
    required this.totalCharges,
    required this.mealBasis,
  });

  HotelList.fromJson(dynamic json) {
    hotelId = json['HotelId'];
    preferedHotel = json['PreferedHotel'];
    hotelCode = json['hotelCode'];
    hotelName = json['HotelName'];
    localHotelId = json['LocalHotelId'];
    isFavourite = json['IsFavourite'];
    propertyRating = json['PropertyRating'];
    available = json['Available'];
    location = json['Location'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    address = json['Address'];
    shortDescription = json['ShortDescription'];
    thumbNailUrl = json['ThumbNailUrl'];
    rateCurrencyCode = json['RateCurrencyCode'];
    totalCharges = json['TotalCharges'];
    mealBasis =
        json['MealBasis'] != null ? json['MealBasis'].cast<String>() : [];
  }
  late String hotelId;
  late String preferedHotel;
  late String hotelCode;
  late String hotelName;
  late String localHotelId;
  late bool isFavourite;
  late String propertyRating;
  late String available;
  late String location;
  late String latitude;
  late String longitude;
  late String address;
  late String shortDescription;
  late String thumbNailUrl;
  late String rateCurrencyCode;
  late dynamic totalCharges;
  late List<String> mealBasis;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['HotelId'] = hotelId;
    map['PreferedHotel'] = preferedHotel;
    map['hotelCode'] = hotelCode;
    map['HotelName'] = hotelName;
    map['LocalHotelId'] = localHotelId;
    map['IsFavourite'] = isFavourite;
    map['PropertyRating'] = propertyRating;
    map['Available'] = available;
    map['Location'] = location;
    map['Latitude'] = latitude;
    map['Longitude'] = longitude;
    map['Address'] = address;
    map['ShortDescription'] = shortDescription;
    map['ThumbNailUrl'] = thumbNailUrl;
    map['RateCurrencyCode'] = rateCurrencyCode;
    map['TotalCharges'] = totalCharges;
    map['MealBasis'] = mealBasis;
    return map;
  }
}
