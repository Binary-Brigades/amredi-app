// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final String id;
  final String title;
  final String description;
  final String createdBy;
  final List<String> likes;
  final String imageUrl;
  final DateTime time;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.createdBy,
    required this.likes,
    required this.imageUrl,
    required this.time,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
        id: map['_id'] as String,
        createdBy: map['createdBy'] as String,
        time: DateTime.fromMillisecondsSinceEpoch(map['createdat'] as int),
        title: map['title'] as String,
        likes: map['likes'] as List<String>,
        description: map['description'] as String,
        imageUrl: map['image'] as String);
  }

/*
id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      image: Map.from((map['image'] as Map),
      createdBy: map['createdBy'] as String,
      createdat: DateTime.fromMillisecondsSinceEpoch(map['createdat'] as int),
 */



  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      createdBy: json['createdBy'],
      likes: List<String>.from(json['likes']),
      imageUrl: json['image'],
      time: DateTime.parse(json['time']),
    );
  }
}
