import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  const GroupTile({super.key});

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
      title: const Text(
        'Group Name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '1:30 PM',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,),
          ),
          Container(
            alignment: Alignment.center,
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pinkAccent.shade100
            ),
            child: const Text(
              '2',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
      subtitle: const Text(
        'Hello to you',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      ),
    );
  }
}
