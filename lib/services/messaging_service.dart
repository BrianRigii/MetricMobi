import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';

class MessagingService extends ChangeNotifier {
  bool _isGettingMessages = false;
  bool get isGettingMessages => _isGettingMessages;

  set isGettingMessages(bool val) {
    _isGettingMessages = val;
    notifyListeners();
  }

  Future loadMessages(userId) {
    _isGettingMessages = true;
    return api.getMessages(userId).then((response) {});
  }
}

MessagingService messagingService = MessagingService();
