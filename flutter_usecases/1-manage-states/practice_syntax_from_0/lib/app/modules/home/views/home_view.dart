// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../routes/app_pages.dart';
// import '../controllers/home_controller.dart';
//
// class HomeView extends GetView<HomeController> {
// // class HomeView extends GetWidget<HomeController> {
//   const HomeView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("HomeView"),
//         actions: [
//           IconButton(
//               onPressed: () => Get.toNamed(Routes.LOGIN),
//               icon: Icon(Icons.arrow_forward_ios_rounded),
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget> [
//             Text("You pushed the button this many times."),
//             Text("0"),
//           ],
//         ),
//       ),
//       floatingActionButton: new FloatingActionButton(
//           onPressed: () => controller.increment(),
//           tooltip: 'Increment',
//           child: new Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_syntax_from_0/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeView"),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              icon: Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),

      // body: Center(
      //   child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget> [
      //       Obx(() => Text(controller.count.value.toString())),
      //
      //       // GetX<HomeController>(
      //       //     builder: (controller) =>
      //       //         Text(controller.count.value.toString())
      //       // ),
      //     ],
      //   ),
      // ),

      body: controller.obx((data) {
        return ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (_, index) {
            return Card(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // children: <Widget> [
                    //   Text(controller.value.toString()),
                    // ],

                    children: <Widget> [
                      ListTile(
                        onTap: () => Get.dialog(
                          AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                            ),
                            title: SizedBox(
                              width: 250,
                              child: Row(
                                children: [
                                  Icon(Icons.add),
                                  Text("This is a custom dialog"),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(onPressed: () => Get.back(), child: Text("Cancel")),
                              TextButton(onPressed: () => Get.back(), child: Text("Wel Done!"))
                            ],
                          )
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            data![index]['picture']['large']
                          ),
                        ),
                        title: Text("${data[index]['name']['title']}" + " " + "${data[index]['name']['first']}" + " " + "${data[index]['name']['last']}"),
                        subtitle: Text("${data[index]['location']['city']}"),
                        trailing: Text("Age: ${data[index]['dob']['age']}"),
                      )
                    ],
                  ),
                )
            );
          },
        );
      }, onError: (err) => Text("Err!")),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => controller.increment(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
      ),
    );
  }
}