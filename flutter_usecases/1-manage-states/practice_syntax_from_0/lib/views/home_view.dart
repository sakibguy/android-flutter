/*
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text("HV"),
      ),
      body: controller.obx((data) {
        return ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (_, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Text(data![index]['name']['title']),
                    title: Text(data[index]['name']['first']),
                    subtitle: Text(data[index]['name']['last']),
                    trailing: Text((data[index]['dob']['age']).toString()),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
*/

