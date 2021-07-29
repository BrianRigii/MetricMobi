class NotesModel {
  final int id;
  final String unit;
  final List<AttachmentModel> attachments;
  final DateTime createdAt;

  NotesModel({
    this.id,
    this.unit,
    this.attachments,
    this.createdAt,
  });

  factory NotesModel.fromMap(note) {
    return NotesModel(
        id: note['id'],
        attachments: List<AttachmentModel>.from(
            note["attachments"].map((x) => AttachmentModel.fromMap(x))),
        unit: note['unit']['name'],
        createdAt: note['created_at'] != null
            ? DateTime.parse(note['created_at'])
            : null);
  }
}

class AttachmentModel {
  final int id;
  final String name;
  final String path;
  final String filetype;
  AttachmentModel({
    this.id,
    this.name,
    this.path,
    this.filetype,
  });

  //TODO: Attachment Created At;

  factory AttachmentModel.fromMap(attachment) {
    return AttachmentModel(
      id: attachment['id'],
      name: attachment['name'],
      path: attachment['file_path'],
      filetype: attachment['file_type'],
    );
  }
}
