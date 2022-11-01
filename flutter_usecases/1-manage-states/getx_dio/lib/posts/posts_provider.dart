import 'package:getx_dio/library/api_request.dart';
import 'package:getx_dio/models/post.dart';

class PostsProvider {
  void getPostList({
    Function()? beforeSend,
    Function(List<Post> posts)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(url: 'https://jsonplaceholder.typicode.com/posts', data: null).get(
      beforeSend: () => {if(beforeSend != null) beforeSend},
      onSuccess: (data) {
        onSuccess!((data as List).map((postJson) => Post.fromJson(postJson)).toList());
      },
      onError: (error) => {if(onError != null) onError(error)},
    );
  }
}