import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.pink[50],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 8,
            right: 8,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              // margin: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.pink[300],
              ),
              child: const Text('Explore Resources'),
            ),
          )
        ],
      ),
    );
  }
}
