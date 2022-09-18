import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app/modules/home/controllers/home_controller.dart';
import 'package:getx_demo/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              icon: Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You have pushed the button many times."),
            Text("0"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
