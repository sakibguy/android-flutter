import 'package:get/get.dart';
import 'package:getx_dio/posts/posts_provider.dart';
import '../models/post.dart';

class PostController extends GetxController {
  RxList postList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    PostsProvider()
        .getPostList(
        beforeSend: () {
          print('before send');
        },
        onSuccess: (posts) {
          print('success');
          print(posts.length);
          postList.addAll(posts);
        },
        onError: (error) {
          print('error');
        });
    super.onInit();
  }
}