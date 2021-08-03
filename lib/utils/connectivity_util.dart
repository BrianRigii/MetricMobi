import 'package:connectivity/connectivity.dart';

import 'package:flutter/cupertino.dart';

class ConnectivityService extends ChangeNotifier {
  bool _isConnected = true;
  bool get isConnected => _isConnected;

  set isConnected(bool val) {
    _isConnected = val;
    notifyListeners();
  }

//
  void checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isConnected = true;
    } else {
      isConnected = false;
    }

    print('Checking Network....\n isConnected $isConnected');
  }
}

ConnectivityService connectivityService = ConnectivityService();
