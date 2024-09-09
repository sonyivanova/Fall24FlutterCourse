// TODO add dependencies
// TODO add user.g.dart as part
// TODO add user.freezed.dart as part

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  // TODO task 3 to make this class for url http://jsonplaceholder.typicode.com/users/

  const factory User({
    required int id,
    required String name,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

Future<List<User>> fetchUsers() async {
  // TODO task 3.2 to make this function for url http://jsonplaceholder.typicode.com/users/ 
  // Using fabric from class

  final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List<dynamic> userJson = jsonDecode(response.body);
    return userJson.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
