import 'package:super_todo/models/message.dart';

class Chat {
  final String id;
  final String uid;
  final String lastMsg;
  final List<Message> messages;

  final bool isBlock;
  final bool isVerified;

  final String createdAt;
  final String updatedAt;
  final num lastModified;
  final num timestamp;

  Chat({
    required this.id,
    required this.uid,
    this.lastMsg = "",
    this.messages = const [],
    this.isBlock = false,
    this.isVerified = false,
    this.createdAt = "",
    this.updatedAt = "",
    this.lastModified = 0,
    this.timestamp = 0,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    final messages = ((json['messages'] ?? []) as List<Map<String, dynamic>>).map((msgJson) => Message.fromJson(msgJson))
    .toList();

    return Chat(
      id: json['id'],
      uid: json['uid'],
      lastMsg: json['lastMsg'] ?? "",
      messages: messages,
      isBlock: json['isBlock'] ?? false,
      isVerified: json['isVerified'] ?? false,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      lastModified: json['lastModified'],
      timestamp: json['timestamp'],
    );
  }
}
