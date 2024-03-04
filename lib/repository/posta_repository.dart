import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:block_example/model/postsmodel.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic e) {
          return PostModel(
            postId: e["postId"] as int,
            email: e["email"] as String,
            body: e["body"] as String,
          );
        }).toList();
      }
    } on SocketException {
      throw Exception("error while fetching data");
    } on TimeoutException {
      throw Exception("error while fetching data");
    }
    throw Exception("error while fetching data");
  }
}
