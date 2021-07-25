class DateClassModel {
  final int id;
  final String name;
  final DateTime starttime;
  final DateTime endTime;
  final String unitPeriodId;

  DateClassModel(
      {this.name, this.starttime, this.endTime, this.unitPeriodId, this.id});

  factory DateClassModel.fromMap(tclass) {
    return DateClassModel(
      id: tclass['id'],
      starttime: tclass['start_time'] != null
          ? DateTime.parse(tclass['start_time'])
          : null,
      endTime: tclass['end_time'] != null
          ? DateTime.parse(tclass['end_time'])
          : null,
      unitPeriodId: tclass['unit_period_id'],
      name: tclass['unit_period']['unit']['name'],
    );
  }
}
