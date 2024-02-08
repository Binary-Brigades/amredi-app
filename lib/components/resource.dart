import 'package:amredi/pages/project_detail.dart';
import 'package:flutter/material.dart';

class Resource extends StatelessWidget {
  const Resource({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ProjectDetail()));
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 8),
        height: 200,
        decoration: BoxDecoration(
            color: Colors.pink.shade100,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
