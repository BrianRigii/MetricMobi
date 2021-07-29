class AnnouncementModel {
  final int id;
  final int unitId;
  final String message;
  final DateTime createdAt;

  AnnouncementModel({this.id, this.unitId, this.message, this.createdAt});

  factory AnnouncementModel.fromMap(announcement) {
    return AnnouncementModel(
        id: announcement['id'],
        unitId: announcement['unit_period_id'],
        message: announcement['message'],
        createdAt: announcement['created_at'] != null
            ? DateTime.parse(announcement['created_at'])
            : null);
  }
}

//Created By and type status
