import 'package:flutter/cupertino.dart';

class Message {

  final String id;

  final String msg;

  final String type;

  final String sender;

  final String recipient;

  final bool isDelivered;

  final bool isSeen;

  final String sentAt;

  final num timestamp;

  Message({
    required this.id,
    required this.msg,
    required this.sender,
    required this.recipient,
    required this.sentAt,
    required this.timestamp,
    this.type = "text",
    this.isDelivered = false,
    this.isSeen = false,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json["id"],
        msg: json["msg"],
        sender: json["sender"],
        recipient: json["recipient"],
        sentAt: json["sentAt"],
        timestamp: json["timestamp"],
        isDelivered: json["isDelivered"],
        isSeen: json["isSeen"],
        type: json["type"]);
  }

 Map<String,dynamic> toMap(){
    return {
      "id": this.id,
      "msg": this.msg,
      "sender": this.sender,
      "recipient": this.recipient,
      "sentAt": this.sentAt,
      "timestamp": this.timestamp,
      "isDelivered": this.isDelivered,
      "isSeen": this.isSeen,
      "type": this.type,
    };
  }

  


}
