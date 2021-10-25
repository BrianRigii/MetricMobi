import 'package:flutter/material.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/discussion_model.dart';
import 'package:metric/services/error_service.dart';

class DiscusionService extends ChangeNotifier {
  ValueNotifier<bool> isGettingDiscussions = ValueNotifier(false);

  set _isGettingDiscussions(bool val) {
    isGettingDiscussions.value = val;
  }

  List<DiscusionModel> discussions = [];

  Future loadDiscussions(periodId) {
    discussions.clear();
    _isGettingDiscussions = true;
    return api.getDiscussions(periodId).then((response) {
      var payload = response.data;
      _saveDisscussions(payload);
    }).catchError((error) {
      return throw error;
    });
  }

  void _saveDisscussions(payload) {
    payload.forEach((json) {
      discussions.add(DiscusionModel.fromMAp(json));
    });

    _isGettingDiscussions = false;
  }
}

DiscusionService discusionService = DiscusionService();
