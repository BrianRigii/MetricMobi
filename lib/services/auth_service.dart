import 'package:flutter/cupertino.dart';

import 'package:metric/api/api.dart';
import 'package:metric/data/database.dart';
import 'package:metric/data/models/auth_model.dart';
import 'package:metric/services/notifications_service.dart';

class AuthService extends ChangeNotifier {
  bool get isLoggedIn => db.authBox.values.isNotEmpty;
  AuthModel get authUser => db.authBox.values.first;
  String deviceToken;

  ValueNotifier<bool> isLoggingin = ValueNotifier(false);

  set _isLoggingin(bool val) {
    isLoggingin.value = val;
  }

  Future login(String reference, String password) async {
    _isLoggingin = true;
    await setDeviceToken();
    return api.login(reference, password, deviceToken).then((response) {
      print('response is $response');
      var payload = response.data;
      _saveAuthData(payload);
      _isLoggingin = false;
      return payload;
    }).catchError((error) {
      print('Error occured while logging in  $error');
      _isLoggingin = false;
      throw error;
    });
  }

  void _saveAuthData(payload) {
    if (payload != null) {
      db.authBox.add(AuthModel.fromMap(payload));
    }
  }

  setDeviceToken() async {
    await notificationService.generateDeviceToken();
    deviceToken = notificationService.deviceToken;
    return deviceToken;
  }

  Future logOut() async {
    await db.authBox.clear();
  }
}

AuthService authService = AuthService();
