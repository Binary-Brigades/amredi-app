import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      appBar: AppBar(actions: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: MaterialButton(
            color: Colors.pink,
            onPressed: () {},
            child: const Text('Post'),
          ),
        ),
        const SizedBox(
          width: 12,
        )
      ]),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
            autofocus: true,
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Post Something...", border: InputBorder.none)),
      ),
    );
  }
}
