class UnitModel {
  final int id;
  final int cumulativeFactor;
  final String name;
  final int lessonsCount;

  UnitModel({this.id, this.cumulativeFactor, this.name, this.lessonsCount});

  factory UnitModel.fromMap(unit) {
    return UnitModel(
        id: unit['id'],
        cumulativeFactor: unit['cumulative_factor'],
        name: unit['name'],
        lessonsCount: unit['lessons_count']);
  }
}

//startime end time lecturer status
