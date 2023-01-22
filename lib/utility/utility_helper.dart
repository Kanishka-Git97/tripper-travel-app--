import 'dart:convert';
import 'dart:typed_data';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Utility {
  static Future<bool> connectionChecker() async {
    ConnectivityResult connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> notification(
      String msg, BuildContext ctx, bool success) {
    return ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: (success ? Colors.greenAccent : Colors.redAccent),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
      ),
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static bool synchronize() {
    // todo: need to implement synchronization method
    return false;
  }

  static String convertorHelper(String base64) {
    String _stringImg = base64;
    int mod = _stringImg.length % 4;
    if (mod != 0) {
      int padding = 4 - mod;
      String paddingString = "".padRight(padding, '=');
      _stringImg += paddingString;
      return _stringImg;
    }
    return _stringImg;
  }
}
