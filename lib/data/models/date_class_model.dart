class DateClassModel {
  final int id;
  final String unitName;
  final DateTime starttime;
  final DateTime endTime;
  final String unitPeriodId;
  final String frequency;
  final String venue;

  DateClassModel(
      {this.id,
      this.unitName,
      this.starttime,
      this.endTime,
      this.unitPeriodId,
      this.frequency,
      this.venue});

  factory DateClassModel.fromMap(tclass) {
    return DateClassModel(
      id: tclass['id'],
      frequency:
          tclass['timetable'] != null ? tclass['timetable']['frequency'] : null,
      starttime: tclass['start_time'] != null
          ? DateTime.parse(tclass['start_time'])
          : null,
      endTime: tclass['end_time'] != null
          ? DateTime.parse(tclass['end_time'])
          : null,
      unitName: tclass['timetable'] != null
          ? tclass['timetable']['unit']['name']
          : null,
      unitPeriodId: tclass['timetable'] != null
          ? tclass['timetable']['unit_period_id']
          : null,
      venue: tclass['timetable'] != null ? tclass['venue']['name'] : null,
    );
  }
}
