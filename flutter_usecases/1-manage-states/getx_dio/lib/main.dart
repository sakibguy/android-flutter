import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'posts/post_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(PostController());

    return GetMaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("GetX Dio Controller Model View"),
          ),
          body: Container(
              child: GetBuilder<PostController>(
                builder: (controller) {
                  return Center(
                    child: Text(
                        controller.postList.length.toString(),
                        style: TextStyle(fontSize: 20)
                    ),
                  );
                },
              )
          ),
        )
    );
  }
}