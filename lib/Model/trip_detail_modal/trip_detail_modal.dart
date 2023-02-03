import 'hotel_list.dart';

class TripDetailModal {
  TripDetailModal({
    this.totalCount,
    this.mealBasisOptions,
    this.webServiceVersion,
    this.message,
    this.hotelList,
    this.searchUniqueId,
    this.status,
    this.startTime,
    this.endTime,
  });

  TripDetailModal.fromJson(dynamic json) {
    totalCount = json['TotalCount'];
    mealBasisOptions = json['MealBasisOptions'] != null
        ? json['MealBasisOptions'].cast<String>()
        : [];
    webServiceVersion = json['WebServiceVersion'];
    message = json['Message'];
    if (json['HotelList'] != null) {
      hotelList = [];
      json['HotelList'].forEach((v) {
        hotelList?.add(HotelList.fromJson(v));
      });
    }
    searchUniqueId = json['SearchUniqueId'];
    status = json['Status'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
  }
  int? totalCount;
  List<String>? mealBasisOptions;
  String? webServiceVersion;
  String? message;
  List<HotelList>? hotelList;
  String? searchUniqueId;
  String? status;
  String? startTime;
  String? endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TotalCount'] = totalCount;
    map['MealBasisOptions'] = mealBasisOptions;
    map['WebServiceVersion'] = webServiceVersion;
    map['Message'] = message;
    if (hotelList != null) {
      map['HotelList'] = hotelList?.map((v) => v.toJson()).toList();
    }
    map['SearchUniqueId'] = searchUniqueId;
    map['Status'] = status;
    map['StartTime'] = startTime;
    map['EndTime'] = endTime;
    return map;
  }
}
