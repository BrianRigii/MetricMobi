import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';

class UnitService extends ChangeNotifier {
  ValueNotifier<bool> _isGettingUnits = ValueNotifier(false);

  set isGettingUnits(bool val) {
    _isGettingUnits.value = val;
  }

  Future loadUnits() {
    isGettingUnits = true;
    return api.getUnits().then((response) {
      var payload = response.data;
      _saveUnits(payload);
    }).catchError((error) {
      print('ERROR OCCURED WHILE LOADING UNITS');
      isGettingUnits = false;
    });
  }

  void _saveUnits(payload) {}
}
