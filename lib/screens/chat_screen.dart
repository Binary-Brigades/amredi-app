// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:amredi/components/message_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final List<Chat> chat = [
    Chat(
        text:
            "hello?",
        myText: false)
  ];
  late IO.Socket socket;
  @override
  void initState() {
    socket = IO.io(
        'http://localhost:5000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
    super.initState();
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      print(_messageController.text);
      setState(() {
        chat.add(Chat(text: _messageController.text, myText: true));
      });

      _messageController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: <Widget>[],
        ),
        title: const Text('Title'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: chat.length,
              itemBuilder: (context, index) => MessageCard(
                myText: chat[index].myText,
                text: chat[index].text,
              ),
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
  bool myText;
  Chat({
    required this.text,
    required this.myText,
  });
}
