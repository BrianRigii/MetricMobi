class AssignedUser {
  final String name;
  final String referenceId;
  final int id;
  final String email;

  AssignedUser({this.name, this.referenceId, this.id, this.email});

  factory AssignedUser.fromMap(data) {
    return AssignedUser(
        id: data['id'],
        email: data['email'],
        name: data['name'],
        referenceId: data['reference_id']);
  }
}
