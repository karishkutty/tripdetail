import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripdetail/Utility/utility.dart';

import '../Constants/colors.dart';
import '../ViewModel/detail_provider.dart';

class SortingOverlay extends StatelessWidget {
  const SortingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HotelProvider>(context, listen: false);

    void close() {
      Navigator.pop(context);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utility.verticalSpace(20),
          GestureDetector(
            onTap: () {
              provider.sortListData(
                  SortingType.sortByPrice, SortingOrder.descending);
              close();
            },
            child: Text("Sort by Price (High to Low)",
                style: TextStyle(fontSize: 14, color: CustomColors.hotelname)),
          ),
          Utility.verticalSpace(20),
          GestureDetector(
            onTap: () {
              provider.sortListData(
                  SortingType.sortByPrice, SortingOrder.ascending);
              close();
            },
            child: Text("Sort by Price (Low to High)",
                style: TextStyle(fontSize: 14, color: CustomColors.hotelname)),
          ),
          Utility.verticalSpace(20),
          GestureDetector(
            onTap: () {
              provider.sortListData(
                  SortingType.sortByName, SortingOrder.ascending);
              close();
            },
            child: Text("Sort by Name (A-Z)",
                style: TextStyle(fontSize: 14, color: CustomColors.hotelname)),
          ),
          Utility.verticalSpace(20),
          GestureDetector(
            onTap: () {
              provider.sortListData(
                  SortingType.sortByName, SortingOrder.descending);
              close();
            },
            child: Text("Sort by Name (Z-A)",
                style: TextStyle(fontSize: 14, color: CustomColors.hotelname)),
          ),
          Utility.verticalSpace(20),
          GestureDetector(
            onTap: () {
              provider.sortListData(
                  SortingType.sortByRating, SortingOrder.descending);
              close();
            },
            child: Text("Sort by Ratings (High to Low)",
                style: TextStyle(fontSize: 14, color: CustomColors.hotelname)),
          ),
          Utility.verticalSpace(20),
          GestureDetector(
            onTap: () {
              provider.sortListData(
                  SortingType.sortByRating, SortingOrder.ascending);
              close();
            },
            child: Text("Sort by Ratings (Low to High)",
                style: TextStyle(fontSize: 14, color: CustomColors.hotelname)),
          ),
        ],
      ),
    );
  }
}
