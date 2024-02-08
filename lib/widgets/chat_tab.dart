import 'package:amredi/components/message_tile.dart';
import 'package:flutter/material.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) => const MessageTile(),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Colors.pink),
            );
  }
}