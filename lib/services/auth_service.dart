import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/database.dart';
import 'package:metric/data/models/auth_model.dart';

class AuthService extends ChangeNotifier {
  bool get isLoggedIn => db.authBox.values.first.accessToken != null;

  ValueNotifier<bool> _isLoggingin = ValueNotifier(false);
  bool get isLoggingin => _isLoggingin.value;

  set isLoggingin(bool val) {
    _isLoggingin.value = val;
  }

  Future login(String reference, String password) {
    return api.login(reference, password).then((response) {
      var payload = response.data;
      _saveAuthData(payload);
    }).catchError((error) {
      print('Error occured while logging in  $error');
    });
  }

  void _saveAuthData(payload) {
    db.authBox.add(AuthModel.fromMap(payload));
  }
}

AuthService authService = AuthService();
