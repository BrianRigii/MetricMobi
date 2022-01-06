import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/message_model.dart';

class MessagingService extends ChangeNotifier {
  bool _isGettingMessages = false;
  bool get isGettingMessages => _isGettingMessages;

  set isGettingMessages(bool val) {
    _isGettingMessages = val;
    notifyListeners();
  }

  List<MessageModel> messages = [];

  Future loadMessages(userId) {
    print('user id is $userId');
    messages.clear();
    isGettingMessages = true;
    return api.getMessages(userId).then((response) {
      var payload = response.data;
      _saveMessages(payload);
    }).catchError((error) {
      print('error occured while loading messages $error');
      isGettingMessages = false;
      return throw error;
    });
  }

  void _saveMessages(payload) {
    payload.forEach((msg) {
      messages.add(MessageModel.fromMap(msg));
    });
    isGettingMessages = false;
  }
}

MessagingService messagingService = MessagingService();
