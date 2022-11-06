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

import 'package:flutter/gestures.dart';
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
                        onTap: () => {} /*Get.dialog(
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
                        )*/,
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
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.bottomSheet(Material(
            borderRadius: BorderRadius.circular(15),
              child: controller.obx((data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 5,
                    width: Get.width/3,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        data![0]['picture']['large']
                    ),
                  ),
                  title: Text("${data[0]['name']['title']}" + " " + "${data[0]['name']['first']}" + " " + "${data[0]['name']['last']}"),
                  subtitle: RichText(
                    text: TextSpan(
                      text: 'email ${data[0]['email']}',
                      style: const TextStyle(
                        color: Colors.black38
                      ),
                      children: const [
                        WidgetSpan(child: Icon(Icons.arrow_drop_down_outlined, size: 20))
                      ],
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        }
                    ),
                  ),
                ),

                Divider(color: Colors.black38),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text("My tasks", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),)
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text("Demo lists", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),)
                ),
                Divider(color: Colors.black38),

                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Create new list"),
                ),
                ListTile(
                  leading: Icon(Icons.feedback_rounded),
                  title: Text("Send feedback"),
                ),
                Divider(color: Colors.black38),
              ]
            )
          ))),
          tooltip: 'Increment',
          child: Icon(Icons.add),
      ),
    );
  }
}