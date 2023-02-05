import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripdetail/ViewModel/detail_provider.dart';
import 'package:tripdetail/Widgets/page_loader.dart';

import '../Constants/colors.dart';
import '../Model/trip_detail_modal/hotel_list.dart';
import '../Model/trip_detail_modal/trip_detail_modal.dart';
import '../Utility/utility.dart';

class SortingOverlay extends StatelessWidget {
  const SortingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    void close() {
      Navigator.pop(context);
    }

    return FutureBuilder(
        future: Provider.of<HotelProvider>(context, listen: false)
            .getHotelListApi(),
        builder: (context, snapData) {
          if (snapData.connectionState == ConnectionState.waiting) {
            return const PageLoader();
          } else {
            return Consumer<HotelProvider>(builder: (context, value, child) {
              List<HotelList>? hotelList = value.fetchHotelList;
              return (hotelList.isNotEmpty)
                  ? Container(
                      margin: const EdgeInsets.all(10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    hotelList.sort((a, b) => a.totalCharges
                                        .compareTo(b.totalCharges));
                                  },
                                  child: SizedBox(
                                    height: 50,
                                    child: Text("Sort by Price (High to Low)",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: CustomColors.hotelname)),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Text("Sort by Price (Low to High)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: CustomColors.hotelname)),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Text("Sort by Name (A-Z)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: CustomColors.hotelname)),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Text("Sort by Name (Z-A)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: CustomColors.hotelname)),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Text("Sort by Ratings (High to Low)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: CustomColors.hotelname)),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Text("Sort by Ratings (Low to High)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: CustomColors.hotelname)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox();
            });
          }
        });
  }
}
