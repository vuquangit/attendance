import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetProvider extends ChangeNotifier {
  bool _hasInternet = false;
  bool get hasInternet => _hasInternet;

  bool _isConnectMobile = false;
  bool get isConnectMobile => _isConnectMobile;

  bool _isConnectWifi = false;
  bool get isConnectWifi => _isConnectWifi;

  InternetProvider() {
    checkInternetConnection();
  }

  Future checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _hasInternet = connectivityResult != ConnectivityResult.none;
    _isConnectMobile = connectivityResult == ConnectivityResult.mobile;
    _isConnectWifi = connectivityResult == ConnectivityResult.wifi;

    notifyListeners();
  }
}
