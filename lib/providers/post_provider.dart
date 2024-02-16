import 'package:amredi/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post_model.dart';

final postProvider = Provider<ApiService>((ref) {
  return ApiService();
});


final postsProvider = FutureProvider<List<Post>>((ref) async {
    return await ref.watch(postProvider).getPosts();
});
