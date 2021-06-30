import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/unit_topic_model.dart';

class TopicService extends ChangeNotifier {
  ValueNotifier<bool> isGettingTopics = ValueNotifier(false);

  set _isGettingTopics(bool val) {
    isGettingTopics.value = val;
  }

  Future loadTopics(unitId) {
    _isGettingTopics = true;
    return api.getTopics(unitId).then((response) {
      var payload = response.data;
      _saveTopics(payload);
    }).catchError((error) {
      _isGettingTopics = false;
      print('error occured while');
    });
  }

  List<UnitTopicModel> unitTopic = [];
  void _saveTopics(payload) {
    unitTopic = [];
    payload.forEach((unittopic) {
      unitTopic.add(UnitTopicModel.fromMap(unittopic));
    });
    _isGettingTopics = false;
  }
}

TopicService topicService = TopicService();
