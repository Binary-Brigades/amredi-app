import 'package:amredi/components/post.dart';
import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: 10,
      itemBuilder: ((context, index) => const Post()));
  }
}