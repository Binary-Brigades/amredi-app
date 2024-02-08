import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions : [
          ClipRRect(
            borderRadius:BorderRadius.circular(12),
            child: MaterialButton(
              color: Colors.pink,
              onPressed: (){},
              child: const Text('Post'),
            ),
          ),
          const SizedBox(width: 12,)
        ]
      ),
      body: const Padding(
        padding:  EdgeInsets.all(8.0),
        child: TextField(
          autofocus: true,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "Post Something...",
            border: InputBorder.none
          )
        ),
      ),
    );
  }
}