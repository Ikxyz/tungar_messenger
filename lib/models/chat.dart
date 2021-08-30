import 'package:super_todo/models/message.dart';

class Chat {
  final String? id;
  final String? lastMsg;
  final List<Message>? messages;

  final bool? isBlock;
  final bool? isVerified;

  final String? createdAt;
  final String? updatedAt;
  final num? lastModified;
  final num? timestamp;

  Chat({
    this.id,
    this.lastMsg,
    this.messages,
    this.isBlock,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.lastModified,
    this.timestamp,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    final messages = ((json['messages'] ?? []) as List<Map<String, dynamic>>)
        .map((msgJson) => Message.fromJson(msgJson))
        .toList();

    return Chat(
      id: json['id'], 
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

  copyWith(Chat chat) {
    return Chat(
        id: chat.id ?? this.id,
        lastMsg: chat.lastMsg ?? this.lastMsg,
        messages: chat.messages ?? this.messages,
        isBlock: chat.isBlock ?? this.isBlock,
        isVerified: chat.isVerified ?? this.isVerified,
        createdAt: chat.createdAt ?? this.createdAt,
        updatedAt: chat.updatedAt ?? this.updatedAt,
        lastModified: chat.lastModified ?? this.lastModified,
        timestamp: chat.timestamp ?? this.timestamp);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,   
      "lastMsg": this.lastMsg,
      "messages": (messages??[]).map((e) => e.toMap()).toList(),
      "isBlock": this.isBlock,
      "isVerified": this.isVerified,
      "createdAt": this.createdAt,
      "updatedAt": this.updatedAt,
      "lastModified": this.lastModified,
      "timestamp": this.timestamp
    };
  }

  String toString() {
    return """
     id: ${this.id},
      lastMsg: ${this.lastMsg},
      messages: ${(this.messages??[]).map((e) => e.toString())},
      isBlock: ${this.isBlock},
      isVerified: ${this.isVerified},
      createdAt: ${this.createdAt},
      updatedAt: ${this.updatedAt},
      lastModified: ${this.lastModified},
      timestamp: ${this.timestamp}
    """;
  }
}
