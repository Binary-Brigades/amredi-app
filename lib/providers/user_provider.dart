import 'package:amredi/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvide = Provider<ApiService>((ref) {
  return ApiService();
});

final registerProvider = Provider<ApiService>((ref) {
  return ApiService();
});
