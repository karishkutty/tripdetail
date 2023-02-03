import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tripdetail/Constants/colors.dart';
import 'package:tripdetail/Model/trip_detail_modal/hotel_list.dart';

class DetailsCard extends StatelessWidget {
  final HotelList hotelList;
  const DetailsCard(this.hotelList, {super.key});

  @override
  Widget build(BuildContext context) {
    double? rating = double.tryParse(hotelList.propertyRating);
    return Card(
      child: Row(children: [
        // Image widget
        Column(
          children: [
            RatingBar.builder(
              initialRating: rating ?? 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: CustomColors.hotelname,
              ),
              onRatingUpdate: (rating) {
                // print(rating);
              },
            ),
            Text(
              hotelList.hotelName,
              style: TextStyle(fontSize: 18, color: CustomColors.hotelname),
            ),
            Text(
              hotelList.location,
              style: TextStyle(fontSize: 18, color: CustomColors.hotelname),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "From",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                Text(
                  hotelList.rateCurrencyCode,
                  style: TextStyle(fontSize: 18, color: CustomColors.hotelname),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        disabledBackgroundColor: Colors.green),
                    onPressed: null,
                    child: const Text(
                      "Available",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ))
              ],
            )
          ],
        )
      ]),
    );
  }
}
