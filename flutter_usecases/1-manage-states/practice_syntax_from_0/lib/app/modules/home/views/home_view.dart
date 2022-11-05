import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text("HomeView"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget> [
            Text("You pushed the button this many times."),
            Text("0"),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => controller.increment(),
          tooltip: 'Increment',
          child: new Icon(Icons.add),
      ),
    );
  }
}
