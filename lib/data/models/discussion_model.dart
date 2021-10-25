class DiscusionModel {
  final int id;
  final int userId;
  final int periodId;
  final String title;
  final DateTime createdAt;
  final int commentCount;
  final String user;

  DiscusionModel(
      {this.id,
      this.userId,
      this.periodId,
      this.title,
      this.createdAt,
      this.commentCount,
      this.user});

  factory DiscusionModel.fromMAp(json) {
    return DiscusionModel(
        id: json['id'],
        userId: json['user_id'],
        periodId: json['unit_period_id'],
        title: json['title'],
        user: json['user']['name'],
        commentCount: json['comments_count'],
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'])
            : null);
  }
}
