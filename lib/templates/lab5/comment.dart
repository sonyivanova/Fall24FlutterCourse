// TODO add dependencies
// TODO add comment.g.dart as part

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  // TODO task 2 to make this class for url http://jsonplaceholder.typicode.com/comments

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId, 
    required this.id, 
    required this.name, 
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

 
  // Do not forget to run 'dart run build_runner build' to generate comment.g.dart
}

Future<List<Comment>> fetchComments() async {
  // TODO task 2.2 to make this function for url http://jsonplaceholder.typicode.com/comments
  // // Using fabric from class

  final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/comments'));

  if (response.statusCode == 200) {
    List<dynamic> commentJson = jsonDecode(response.body);
    return commentJson.map((json) => Comment.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load comments');
  }
}
