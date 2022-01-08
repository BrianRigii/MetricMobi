class MessageModel {
  final int id;
  final int senderId;
  final int recieverId;
  final String message;
  final bool received;
  final bool read;
  final DateTime readAT;
  final DateTime createdAt;

  MessageModel(
      {this.id,
      this.senderId,
      this.recieverId,
      this.message,
      this.read,
      this.received,
      this.readAT,
      this.createdAt});

  factory MessageModel.fromMap(msg) {
    return MessageModel(
        id: msg['id'],
        senderId: msg['sender_id'],
        recieverId: msg['receiver_id'],
        message: msg['message'],
        read: msg['read'] == 1 ? true : false,
        received: msg['received'] == 1 ? true : false,
        createdAt:
            msg['received'] != null ? DateTime.parse(msg['received']) : null,
        readAT: msg['received_at'] != null
            ? DateTime.parse(msg['received_at'])
            : null);
  }
}

///last commit from levono
///
