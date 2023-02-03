import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripdetail/View/hotel_list_screen.dart';
import 'package:tripdetail/ViewModel/detail_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HotelProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      )));
}
