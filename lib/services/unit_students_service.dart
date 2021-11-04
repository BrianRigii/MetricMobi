import 'package:flutter/material.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/student_model.dart';

class UnitStudentsService extends ChangeNotifier {
  List<StudentModel> students = [];

  Future loadUnitStudents(unitId) {
    return api.getUnitStudents(unitId).then((response) {
      var payload = response.data;

      _saveStudents(payload);
    }).catchError((error) {
      return throw error;
    });
  }

  void _saveStudents(payload) {
    payload.forEach((data) {
      students.add(StudentModel.fromMap(data));
    });
  }
}

UnitStudentsService unitStudentsService = UnitStudentsService();
