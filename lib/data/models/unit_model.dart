class UnitModel {
  final int id;
  final int cumulativeFactor;
  final String name;

  UnitModel({this.id, this.cumulativeFactor, this.name});

  factory UnitModel.fromMap(unit) {
    return UnitModel(
        id: unit['id'],
        cumulativeFactor: unit['cumulative_factor'],
        name: unit['name']);
  }
}

//startime end time lecturer status
