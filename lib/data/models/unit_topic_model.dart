class UnitTopicModel {
  final String name;
  final int id;
  final int unitId;

  UnitTopicModel({this.name, this.id, this.unitId});

  factory UnitTopicModel.fromMap(unittopic){
    return UnitTopicModel(
      id: unittopic['id'],
      name: unittopic['name'],
      unitId: unittopic['unit_id'],
    );
  }

}


