// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amredi/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:amredi/components/message_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  List<Chat> message = [];
  late IO.Socket socket;
  ChatNotifier chatController = ChatNotifier();
  @override
  void initState() {
    //'https://21bdbn4c-8000.uks1.devtunnels.ms/' 'http://localhost:8000',
    socket = IO.io(
        'https://21bdbn4c-8000.uks1.devtunnels.ms',
        // 'http://localhost:8000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
    setUpSocketListener();
    super.initState();
  }

  void setUpSocketListener() {
    socket.on("message-received", (data) {
      print(data);
      var chat = Chat.fromJson(data);
      setState(() {
        message.add(chat);
      });
    });
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      var chat = {"message": _messageController.text, "sendBy": socket.id};
      socket.emit('message', chat);
      setState(() {
        message.add(Chat(text: _messageController.text, sendBy: socket.id));
      });

      _messageController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: <Widget>[],
        ),
        title: const Text('Title'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: message.length,
              itemBuilder: (context, index) => message.isNotEmpty
                  ? MessageCard(
                      myText: message[index].sendBy == socket.id,
                      text: message[index].text,
                    )
                  : Center(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _messageController,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Chat {
  String text;
  String? sendBy;
  Chat({
    required this.text,
    required this.sendBy,
  });
  factory Chat.fromJson(json) {
    return Chat(text: json["message"], sendBy: json["sendBy"]);
  }
}
