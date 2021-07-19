class NotesModel {
  final int id;
  final String unit;
  final String filePath;

  NotesModel({this.id, this.unit, this.filePath});

  factory NotesModel.fromMap(note) {
    return NotesModel(
        id: note['id'],
        filePath: note['attachments'][0]['file_path'],
        unit: note['unit']['name']);
  }
}
