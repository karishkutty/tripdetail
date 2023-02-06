import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:tripdetail/Constants/colors.dart';
import 'package:tripdetail/Model/trip_detail_modal/hotel_list.dart';
import 'package:tripdetail/Utility/utility.dart';

class DetailsCard extends StatelessWidget {
  final HotelList hotelList;
  const DetailsCard(this.hotelList, {super.key});

  @override
  Widget build(BuildContext context) {
    double? rating = double.tryParse(hotelList.propertyRating);
    final maxWidth = MediaQuery.of(context).size.width * 0.4;
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            flex: 2000,
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  hotelList.thumbNailUrl,
                  width: 130,
                  // height: 150,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 80,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: LikeButton(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  size: 30,
                  circleColor: const CircleColor(
                      start: Color(0xff00ddff), end: Colors.red),
                  // ignore: prefer_const_constructors
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.yellow,
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 30,
                    );
                  },
                ),
              ),
            ]),
          ),
          // Image widget
          Expanded(
            flex: 7500,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      itemSize: 30,
                      onRatingUpdate: (rating) {
                        // print(rating);
                      },
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Text(
                        hotelList.hotelName,
                        maxLines: 5,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 14, color: CustomColors.hotelname),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Text(
                        hotelList.address,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "From ",
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                        Text(
                          "${hotelList.rateCurrencyCode}  ${hotelList.totalCharges}",
                          style: TextStyle(
                              fontSize: 18, color: CustomColors.hotelname),
                        ),
                        Utility.horizontalSpace(10),
                        SizedBox(
                          height: 20,
                          width: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  disabledBackgroundColor: Colors.green),
                              onPressed: null,
                              child: const Text(
                                "Available",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
