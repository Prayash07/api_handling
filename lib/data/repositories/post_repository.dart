import 'package:api_handling/data/api/api.dart';
import 'package:api_handling/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PostRepository {
  Api api = Api();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get('/posts');
      List<dynamic> posts = response.data;
      return posts.map((post) => PostModel.fromJson(post)).toList();
    } catch (exception) {
      rethrow;
    }
  }
}
