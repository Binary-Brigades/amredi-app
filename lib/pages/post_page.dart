import 'package:amredi/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostPage extends ConsumerWidget {
  PostPage({super.key});

  final _postController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var createPost = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(actions: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: MaterialButton(
            color: Colors.pink,
            onPressed: () async {
              if (_postController.text.isNotEmpty) {
                var res = await createPost.createPost(_postController.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    res["message"],
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green[300],
                ));
                Navigator.of(context).pop();
              }
            },
            child: const Text('Post'),
          ),
        ),
        const SizedBox(
          width: 12,
        )
      ]),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
            controller: _postController,
            autofocus: true,
            maxLines: 5,
            decoration: InputDecoration(
                hintText: "Post Something...", border: InputBorder.none)),
      ),
    );
  }
}
