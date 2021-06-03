import 'package:connectivity/connectivity.dart';

class NetworkUtil {
  init() {}

  get networkOkay async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}

NetworkUtil networkUtil = NetworkUtil();
