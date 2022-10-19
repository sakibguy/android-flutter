import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app/modules/home/controllers/home_controller.dart';
import 'package:getx_demo/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<HomeController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.red,
      title: Text("LOGIN PAGE"),
    ));
  }
}
