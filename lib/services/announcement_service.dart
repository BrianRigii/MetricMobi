import 'package:flutter/cupertino.dart';
import 'package:metric/api/api.dart';
import 'package:metric/data/models/announcement_model.dart';

class AnnouncementService extends ChangeNotifier {
  ValueNotifier<bool> isGettingAnnouncements = ValueNotifier(false);

  set _isGettingAnnouncements(bool val) {
    isGettingAnnouncements.value = val;
  }

  List<AnnouncementModel> announcements = [];
  Future loadAnnouncements() {
    _isGettingAnnouncements = true;
    announcements.clear();
    return api.getAnnouncements().then((response) {
      var payload = response.data;
      _saveAnnouncements(payload);
    }).catchError((error) {
      print('Error occured while loading $announcements');
      _isGettingAnnouncements = false;
    });
  }

  void _saveAnnouncements(payload) {
    payload.forEach((announcement) {
      announcements.add(AnnouncementModel.fromMap(announcement));
    });
    _isGettingAnnouncements = false;
  }
}

AnnouncementService announcementService = AnnouncementService();
