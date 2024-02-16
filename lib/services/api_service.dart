import 'dart:convert';
import 'package:amredi/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hive_flutter/hive_flutter.dart';

final mybox = Hive.box('myBox'); 
String token = mybox.get('TOKEN');
class ApiService {
  static const String baseUrl = "https://amredi-backend.vercel.app/api/v1";
  static const String createpost = "$baseUrl/post/create";
  static const String posts = "$baseUrl/post/getall";
  static const String loginUrl = "$baseUrl/auth/login";

  Future<List<Post>> getPosts() async {
    Response res = await http.get(Uri.parse(posts),headers: {
    "Authorization": "Bearer $token"
  });
    if (res.statusCode == 200) {
      final List<dynamic> posts = json.decode(res.body);
      return posts.map((post) {
        return Post.fromJson(post);
      }).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }

  Future<Map<dynamic, dynamic>> login(String email, String password) async {
    Response res = await http.post(Uri.parse(loginUrl),
        body: {"email": email, "password": password});
    if (res.statusCode == 200) {
      final Map user = json.decode(res.body);
      return user;
    } else {
      throw Exception("Failed !!");
    }
  }
  Future<Map<dynamic, dynamic>> register(String email, 
            String password,
            String firstName,
            String lastName,
            String phoneNumber,
            location,
            String confirmPassword
            ) async {
    Response res = await http.post(Uri.parse(loginUrl),
        body: {
          "email": email, 
          "password": password,
          "confirm_password": confirmPassword,
          "phone_number": phoneNumber,
          "first_name":firstName,
          "last_name":lastName,
          "location": location
        
        });
    if (res.statusCode == 200) {
      final Map user = json.decode(res.body);
      return user;
    } else {
      throw Exception("Failed !!");
    }
  }
}


