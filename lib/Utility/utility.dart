import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utility {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(
      width: width,
    );
  }

  static Widget verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Divider greyDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
      height: 1,
    );
  }

  static Divider customDivider(color, thickness) {
    thickness = thickness.toDouble();
    return Divider(
      color: color,
      thickness: thickness,
      height: thickness,
    );
  }

  static Future<bool> checkinternet() async {
    bool isConnected;
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }
}
