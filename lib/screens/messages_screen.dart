import 'package:amredi/components/message_tile.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 46,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text('Messages'),
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()),
                      child: const Text('Groups'),
                    )),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) => const MessageTile(),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Colors.pink),
            ),
          )
        ],
      ),
    );
  }
}
