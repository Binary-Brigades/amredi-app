import 'package:amredi/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatNotifier extends ChangeNotifier {
  late List<Message> chatMessages;
}

class Message {
  String message;
  String sentByMe;
  Message({required this.message, required this.sentByMe});
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(message: json["message"], sentByMe: json["sentByMe"]);
  }
}
