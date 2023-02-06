// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:tripdetail/Model/trip_detail_modal/hotel_list.dart';
import 'package:tripdetail/Model/trip_detail_modal/trip_detail_modal.dart';
import 'package:tripdetail/apicall.dart';

import '../Constants/url.dart';

class HotelProvider with ChangeNotifier {
  late TripDetailModal tripdetailModel = TripDetailModal();
  List<HotelList> hotelList = [];

  List<HotelList> get fetchHotelList {
    return [...hotelList];
  }

  void sortListData(SortingType type, SortingOrder oreder) {
    if (type == SortingType.sortByName) {
      if (oreder == SortingOrder.ascending) {
        hotelList.sort(
            (a, b) => a.hotelName.toString().compareTo(b.hotelName.toString()));
      } else {
        hotelList.sort(
            (a, b) => b.hotelName.toString().compareTo(a.hotelName.toString()));
      }
    } else if (type == SortingType.sortByPrice) {
      if (oreder == SortingOrder.ascending) {
        hotelList.sort((a, b) =>
            a.totalCharges.toDouble().compareTo(b.totalCharges.toDouble()));
      } else {
        hotelList.sort((a, b) =>
            b.totalCharges.toDouble().compareTo(a.totalCharges.toDouble()));
      }
    } else if (type == SortingType.sortByName) {
      if (oreder == SortingOrder.ascending) {
        hotelList.sort(
            (a, b) => a.hotelName.toString().compareTo(b.hotelName.toString()));
      } else {
        hotelList.sort(
            (a, b) => b.hotelName.toString().compareTo(a.hotelName.toString()));
      }
    } else if (type == SortingType.sortByRating) {
      if (oreder == SortingOrder.ascending) {
        hotelList.sort((a, b) =>
            a.propertyRating.toString().compareTo(b.totalCharges.toString()));
      } else {
        hotelList.sort((a, b) =>
            b.propertyRating.toString().compareTo(a.totalCharges.toString()));
      }
    }
    notifyListeners();
  }

  Future<void> getHotelListApi() async {
    hotelList.clear();
    Map<String, dynamic> params = {
      "device_type": "ios",
      "app_version": "2.0",
      "gzip": "yes",
      "op_staff": "no",
      "language": "en",
      "registration_id":
          "fSgGNLORX0XWgqWUJga_rk:APA91bGrcP6HY8QFuEse3u7_kN4TGEc_XrV6dMuxKcjj5Aj9KezoByYbePhEYlZdP4tcrr-tDp5ttfeTwAkceb0Pb35RFMKZKmIV2TMl94sm1otnJWmKMTK_MTKWdg0uKcB07FJzpcSb",
      "device_id": "CFE09516-AE51-482F-9059-6A03E1E8BFD2",
      "availableonly": "1",
      "checkin_date": "27/02/2023",
      "is_b2c": "yes",
      "sel_country": "138",
      "sel_currency": "USD",
      "chk_ratings": "1.0,2.0,3.0,4.0,5.0,SC",
      "additional_markup": "",
      "checkout_date": "28/02/2023",
      "user_id": "84",
      "roomDetails":
          '[{"numberOfChild": "0", "numberOfAdults": "2", "ChildAge": "0"}]',
      "sel_country_res": "106",
      "unique_id": "8404202207041835CFE09516-AE51-482F-9059-6A03E1E8BFD2",
      "sel_nationality": "106",
      "action": "hotel_search",
      "startIndex": "0",
      "username": "",
      "sel_city": "71649",
      "password": "",
    };
    final response = await ApiCall().getMethod(Url.baseURL, params);
    if (response.toString().isNotEmpty) {
      final responseData = json.decode(response.toString());
      tripdetailModel = TripDetailModal.fromJson(responseData);
      hotelList = tripdetailModel.hotelList!;
    }
    notifyListeners();
  }
}

enum SortingType {
  sortByPrice,
  sortByName,
  sortByRating,
}

enum SortingOrder { ascending, descending }
