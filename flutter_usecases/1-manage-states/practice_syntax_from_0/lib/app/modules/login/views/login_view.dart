// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:practice_syntax_from_0/app/modules/home/controllers/home_controller.dart';
//
// class LoginView extends GetView<HomeController> {
//   const LoginView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("LOGIN PAGE"),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';

class LoginView extends GetView<HomeController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login View')
      ),
    );
  }
}
