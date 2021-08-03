import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:metric/utils/app_enums.dart';
import 'package:metric/utils/connectivity_util.dart';
import 'package:metric/widgets/display_units/toast.dart';

class ErrorService extends ChangeNotifier {
  bool _noNetworkHandled = false;
  bool get noNetworkHandled => _noNetworkHandled;
  var subscription;

  set noNetworkHandled(bool val) {
    _noNetworkHandled = val;
    notifyListeners();
  }

  void errorHandler({
    @required error,
    @required BuildContext context,
    String message,
    HandleMethod handleMethod,
  }) {
    if (error is DioError) {
      print('Error is $error  and type is ${error.type}');
      if (error.type == DioErrorType.other) {
        _noInternetHandler();
      } else if (error.type == DioErrorType.response) {
        _responseErrorHandler();
      }
    }
  }

  void _noInternetHandler() {
    connectivityService.checkConnectivity();
    if (!connectivityService.isConnected) {
      subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult connectivityResult) {
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          showToast('Back Online');
          cancelNetWorkSubscription();
        } else {
          print('Still offline');
        }
      });
    }
  }

  void _responseErrorHandler() {}

  void cancelNetWorkSubscription() {
    print('canceling network subscription');
    subscription.cancel();
  }
}

// void _handler() {}

ErrorService errorService = ErrorService();
