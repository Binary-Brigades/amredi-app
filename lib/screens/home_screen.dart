import 'package:amredi/components/activity_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
        const Column(
          children: [
            Row(
              children: [
                Expanded(child: Activity()),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Activity()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(child: Activity()),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Activity()),
              ],
            ),
          ],
        )
      ],
    );
  }
}
