import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/unit_model.dart';

class UnitService extends ChangeNotifier {
  ValueNotifier<bool> isGettingUnits = ValueNotifier(false);

  set _isGettingUnits(bool val) {
    isGettingUnits.value = val;
  }

  List<UnitModel> units = [];
  Future loadUnits() {
    units = [];
    _isGettingUnits = true;
    return api.getUnits().then((response) {
      var payload = response.data;
      _saveUnits(payload);
    }).catchError((error) {
      print('ERROR OCCURED WHILE LOADING UNITS $error');
      _isGettingUnits = false;
    });
  }

  void _saveUnits(payload) {
    payload.forEach((unit) {
      units.add(UnitModel.fromMap(unit));
    });

    _isGettingUnits = false;
  }
}

UnitService unitService = UnitService();
