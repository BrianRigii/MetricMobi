class StudentModel {
  final String name;
  final String referenceId;
  final int id;
  final String email;

  StudentModel({this.name, this.referenceId, this.id, this.email});

  factory StudentModel.fromMap(data) {
    return StudentModel(
        id: data['id'],
        email: data['email'],
        name: data['name'],
        referenceId: data['reference_id']);
  }
}
