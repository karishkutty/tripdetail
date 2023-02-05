import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripdetail/Model/trip_detail_modal/hotel_list.dart';
import 'package:tripdetail/Utility/utility.dart';
import 'package:tripdetail/View/sortingoverlay.dart';
import 'package:tripdetail/Widgets/hotel_detail_card.dart';

import '../ViewModel/detail_provider.dart';
import '../Widgets/page_loader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.grey,
        ),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SortingOverlay();
                  },
                );
              },
              icon: Icon(Icons.tune_outlined)),
          IconButton(onPressed: null, icon: Icon(Icons.filter_alt_outlined))
        ],
      ),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: FutureBuilder(
            future: Provider.of<HotelProvider>(context, listen: false)
                .getHotelListApi(),
            builder: (context, snapData) {
              if (snapData.connectionState == ConnectionState.waiting) {
                return const PageLoader();
              } else if (snapData.hasError) {
                Utility.toastMessage("gettimg error");
                return Container();
              } else {
                return Consumer<HotelProvider>(
                    builder: (context, value, child) {
                  List<HotelList>? hotelList = value.fetchHotelList;
                  return (hotelList.isNotEmpty)
                      ? Container(
                          margin: const EdgeInsets.all(10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: hotelList.length,
                            itemBuilder: (context, index) {
                              return DetailsCard(hotelList[index]);
                            },
                          ),
                        )
                      : const SizedBox();
                });
              }
            }),
      ),
    );
  }
}
