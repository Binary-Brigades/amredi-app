import 'package:amredi/components/post.dart';
import 'package:amredi/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Posts extends ConsumerWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postsProvider);
    print(data);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: data.when(data: (data) {
          if (data.length > 0) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: data.length,
              itemBuilder: ((context, index) => Post(
                  likes: data[index].likes.length,
                  description: data[index].description,
                  url: data[index].imageUrl,
                  user: data[index].createdBy,
                  time: data[index].time)),
            );
          } else {
            return Center(
              child: Text("No posts found"),
            );
          }
        }, error: (Object error, StackTrace stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
