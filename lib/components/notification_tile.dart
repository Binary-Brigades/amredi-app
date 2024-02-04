import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.pinkAccent.shade100,
            borderRadius: BorderRadius.circular(20)),
      ),
      title: const Text('Notification'),
      trailing: const Icon(Icons.close),
      subtitle: const Text(
        '1 day ago',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
      ),
    );
  }
}
