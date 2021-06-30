import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/unit_model.dart';

class UnitService extends ChangeNotifier {
  ValueNotifier<bool> _isGettingUnits = ValueNotifier(false);

  set isGettingUnits(bool val) {
    _isGettingUnits.value = val;
  }

  List<UnitModel> units = [];
  Future loadUnits() {
    units = [];
    isGettingUnits = true;
    return api.getUnits().then((response) {
      var payload = response.data;
      _saveUnits(payload);
    }).catchError((error) {
      print('ERROR OCCURED WHILE LOADING UNITS $error');
      isGettingUnits = false;
    });
  }

  void _saveUnits(payload) {
    payload.forEach((unit) {
      units.add(UnitModel.fromMap(unit));
    });
  }
}

UnitService unitService = UnitService();
