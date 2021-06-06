import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/database.dart';
import 'package:metric/data/models/auth_model.dart';

class AuthService extends ChangeNotifier {
  bool get isLoggedIn => db.authBox.values.isNotEmpty;
  AuthModel get authUser => db.authBox.values.first;

  ValueNotifier<bool> isLoggingin = ValueNotifier(false);
  // bool get isLoggingin => _isLoggingin.value;

  set _isLoggingin(bool val) {
    isLoggingin.value = val;
  }

  Future login(String reference, String password) {
    _isLoggingin = true;
    return api.login(reference, password).then((response) {
      print('response is $response');
      var payload = response.data;
      _saveAuthData(payload);
      _isLoggingin = false;
      return payload;
    }).catchError((error) {
      print('Error occured while logging in  $error');
      _isLoggingin = false;
    });
  }

  void _saveAuthData(payload) {
    if (payload != null) {
      db.authBox.add(AuthModel.fromMap(payload));
    }
  }
}

AuthService authService = AuthService();
