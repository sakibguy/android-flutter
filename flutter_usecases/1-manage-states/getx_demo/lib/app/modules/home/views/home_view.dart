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
      body: controller.obx((data) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (_, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(data![index]['picture']['large']),
                    ),
                    title: Text(data![index]['name']['title'] +
                        " " +
                        data![index]['name']['first'] +
                        " " +
                        data![index]['name']['last']),
                    subtitle: Text(data![index]['email']),
                    trailing: Text("Age: ${data![index]['dob']['age']}"),
                  )
                ],
              ),
            );
          },
        );
      }, onError: (err) => Center(child: Text(err!))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_demo/app/modules/home/controllers/home_controller.dart';
// import 'package:getx_demo/app/routes/app_pages.dart';
//
// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Get.put(HomeController());
//
//     return GetX<HomeController>(
//       builder: (controller) => Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//                 onPressed: () => Get.toNamed(Routes.LOGIN),
//                 icon: Icon(Icons.arrow_forward_ios_rounded))
//           ],
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text("You have pushed the button many times."),
//               Text(controller.count.value.toString()),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => controller.increment(),
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_demo/app/modules/home/controllers/home_controller.dart';
// import 'package:getx_demo/app/routes/app_pages.dart';
//
// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Get.put(HomeController());
//
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//               onPressed: () => Get.toNamed(Routes.LOGIN),
//               icon: Icon(Icons.arrow_forward_ios_rounded))
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text("You have pushed the button many times."),
//             Obx(() => Text(controller.count.value.toString()))
//
//             // GetX<HomeController>(
//             //     builder: (controller) =>
//             //         Text(controller.count.value.toString())),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // onPressed: () => controller.increment(),
//
//         onPressed: () => Get.bottomSheet(Material(
//           borderRadius: BorderRadius.circular(15),
//           child: Column(
//             children: [],
//           ),
//         )),
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// SUMMARY
// small bin size + best perf + best ux

// minimized rebuild
// less widgets rebuild
// change state only where needed, dont rebuild whole widget tree
// Stateful Widget rebuild whole widget tree even if single changes, drawbac k
// GetX only rebuild defined wrapped widget
// GetX Increase Perf (How: Allocate less res, less app size by defining routes, pages, binding, auto instantiate, dispose, dependency injections, state management...etc
// GetX, influence MCV arch pattern
// Minded: Flutter sys arch practice & best practice & alice app practices (business + code)
