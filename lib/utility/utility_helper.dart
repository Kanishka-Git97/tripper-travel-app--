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
}
