class NotesModel {
  final int id;
  final String unit;
  final String fileName;
  final String filePath;
  final DateTime createdAt;

  NotesModel(
      {this.id, this.unit, this.filePath, this.fileName, this.createdAt});

  factory NotesModel.fromMap(note) {
    return NotesModel(
        id: note['id'],
        fileName: note['attachments'][0]['name'],
        filePath: note['attachments'][0]['file_path'],
        unit: note['unit']['name'],
        createdAt: note['created_at'] != null
            ? DateTime.parse(note['created_at'])
            : null);
  }
}
