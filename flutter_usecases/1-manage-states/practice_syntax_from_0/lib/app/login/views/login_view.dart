import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:practice_syntax_from_0/app/home/controllers/home_controller.dart';

class LoginView extends GetView<HomeController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN PAGE"),
      ),
      body: controller.obx((data) {
        return ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (_, index) {
            return Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          data![index]['picture']['large']
                        ),
                      ),
                      title: Text(data[index]['name']['title'] + " " + data[index]['name']['first'] + " " + data[index]['name']['last']),
                      subtitle: Text(data[index]['location']['city']),
                      trailing: Text(data[index]['dob']['age'].toString()),
                      onTap: () => {

                        Get.bottomSheet(Material(
                          borderRadius: BorderRadius.circular(15),

                          child: controller.obx((d) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(d![0]['name']['first']),

                              // ISSUED::: if not wrapped inside Expanded widget
                              // ListView.builder(
                              //     itemCount: d == null ? 0 : d.length,
                              //     itemBuilder: (BuildContext ctxt, int index) {
                              //       return Text(d[index]['name']['first']);
                              //     }
                              // )

                              // SOLVED::: if wrapped by Expended widget
                              Expanded(
                                  child: ListView.builder(
                                      itemCount: d == null ? 0 : d.length,
                                      itemBuilder: (BuildContext ctxt, int index) {
                                        return Text(d[index]['name']['first']);
                                      }
                              )),
                            ],
                          )),

                          // child: controller.obx((resValue) => Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     ListTile(
                          //       leading: CircleAvatar(
                          //         backgroundImage: NetworkImage(
                          //           resValue![0]['picture']['large']
                          //         ),
                          //       ),
                          //       title: Text(resValue[0]['name']['first']),
                          //       subtitle: Text(resValue[0]['name']['last']),
                          //       trailing: Text(resValue[0]['dob']['age'].toString())
                          //     ),
                          //     Divider(color: Colors.black26),
                          //
                          //     ListTile(
                          //       leading: Icon(Icons.add),
                          //       title: Text("Create new list"),
                          //     ),
                          //
                          //     ListTile(
                          //       leading: Icon(Icons.feedback_rounded),
                          //       title: Text("Send feedback")
                          //     ),
                          //     Divider(color: Colors.black26),
                          //   ],
                          // )),
                        ))
                      }
                    )
                  ],
                ),
              ),
            );
          },
      );
      }),
    );
  }
}
