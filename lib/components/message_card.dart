import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.myText, required this.text});
  final bool myText;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: myText ? Alignment.centerRight : Alignment.centerLeft,
      child: LimitedBox(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: myText ? Colors.pinkAccent.shade100 : Colors.pink.shade200,
            borderRadius: myText
                ? const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
