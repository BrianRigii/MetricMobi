class UnitModel {
  final int id;
  final int cumulativeFactor;
  final String name;
  final int lessonsCount;
  final String lecturer;

  UnitModel(
      {this.id,
      this.cumulativeFactor,
      this.name,
      this.lessonsCount,
      this.lecturer});

  factory UnitModel.fromMap(unit) {
    return UnitModel(
        id: unit['id'],
        cumulativeFactor: unit['cumulative_factor'],
        name: unit['name'],
        lessonsCount: unit['lessons_count'],
        lecturer: unit['lecturer_name']);
  }
}

//startime end time lecturer status
