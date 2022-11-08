import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              icon: Icon(Icons.arrow_forward_ios_rounded)
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pressed times"),
              GetX<HomeController>(
                  builder: (controller) =>
                      Text(controller.count.value.toString())
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: "Increase",
      ),
    );
  }
}