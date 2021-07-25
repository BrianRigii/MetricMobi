import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/date_class_model.dart';

List<DateClassModel> dateClasses = [];

ValueNotifier<bool> isGettingDateClasses = ValueNotifier(false);

set _isGettingDateClasses(bool val) {
  isGettingDateClasses.value = val;
}

class TimeTableService extends ChangeNotifier {
  Future loadTodaysClasses(start, end) {
    dateClasses = [];
    _isGettingDateClasses = true;
    return api.getDateClasses(start, end).then((response) {
      var payload = response.data;

      _saveDateClasses(payload);
    }).catchError((error) {
      print('error occured while loading date classes');
      _isGettingDateClasses = false;
    });
  }
}

void _saveDateClasses(payload) {
  payload.forEach((tclass) {
    dateClasses.add(DateClassModel.fromMap(tclass));
  });
  _isGettingDateClasses = false;
}

TimeTableService timeTableService = TimeTableService();
