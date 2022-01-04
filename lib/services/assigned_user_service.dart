import 'package:flutter/material.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/student_model.dart';

class AssignedUsersService extends ChangeNotifier {
  List<AssignedUser> users = [];

  Future loadUnitStudents({unitId}) {
    return api.getUnitStudents(unitId).then((response) {
      var payload = response.data;

      _saveStudents(payload);
    }).catchError((error) {
      return throw error;
    });
  }

  void _saveStudents(payload) {
    payload.forEach((data) {
      users.add(AssignedUser.fromMap(data));
    });
  }
}

AssignedUsersService assignedUserService = AssignedUsersService();
