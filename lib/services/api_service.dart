import 'dart:convert';
import 'package:amredi/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:hive_flutter/hive_flutter.dart';

final mybox = Hive.box('myBox');
String token = mybox.get('TOKEN');

class ApiService {
  static const String baseUrl = "https://amredi-backend.vercel.app/api/v1";
  // static const String baseUrl = "http://192.168.0.103:3000/api/v1";
  static const String createpost = "$baseUrl/post/create";
  static const String posts = "$baseUrl/post/getall";
  static const String loginUrl = "$baseUrl/auth/login";
  static const String registerUrl = "$baseUrl/auth/register";
  static const String verifyUrl = "$baseUrl/auth/verify-account";
  static const String profile = "$baseUrl/user/profile";
  static const String editProfile = "$baseUrl/user/edit-profile";
  static const String connect = "$baseUrl/user/connect";
  static const String getpost = "$baseUrl/post/:postid/getPost";
  static const String likePost = "$baseUrl/post/:postid/like";
  static const String createGroup = "$baseUrl/group/create";
  static const String getGroups = "$baseUrl/group/getall";
  static const String groupAdd = "$baseUrl/group/:groupId/add";
  static const String createProject = "$baseUrl/project/group/:groupId/create";




  Future<List<Post>> getPosts() async {
    Response res = await http
        .get(Uri.parse(posts), headers: {"Authorization": "Bearer $token"});
    if (res.statusCode == 200) {
      final List<dynamic> posts = json.decode(res.body);
      print(posts);
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
      // throw Exception("Failed !!");
      return {'status': res.statusCode};
    }
  }

  Future<Map<dynamic, dynamic>> register(
      String email,
      String password,
      String firstName,
      String lastName,
      String phoneNumber,
      List<double?> location, // Change the type of location to List<dynamic>
      String confirmPassword) async {
    // Construct the request body
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
      "phone_number": phoneNumber,
      "first_name": firstName,
      "last_name": lastName,
      "location": '{"type":"Point","coordinates":$location}'
    };

    print("request $requestBody");

    // Send the POST request
    Response res = await http.post(Uri.parse(registerUrl), body: requestBody);
    print(res.body);
    if (res.statusCode == 201) {
      final Map<dynamic, dynamic> user = json.decode(res.body);
      return user;
    } else {
      return {"error": "error occured"};
    }
  }

  Future<Map<dynamic, dynamic>> createPost(String? desc) async {
    Response res = await http.post(Uri.parse(createpost),
        body: {"description": desc, "title": "title"},
        headers: {"Authorization": "Bearer $token"});
    print(res.body);
    if (res.statusCode == 201) {
      return json.decode(res.body);
    } else {
      throw Exception("error occured");
    }
  }

  Future<Map<dynamic, dynamic>> verify(String code) async {
    Response res = await http.post(Uri.parse(verifyUrl), body: code);
    if (res.statusCode == 202) {
      return {"status": "success"};
    } else {
      return {"status": "error"};
    }
  }
}
