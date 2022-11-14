import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_alice_usecase_from_0/screen/splash_screen.dart';
import 'package:practice_alice_usecase_from_0/utils/routes/routes.dart';
import 'package:practice_alice_usecase_from_0/screen/inbox.dart';
import 'package:practice_alice_usecase_from_0/screen/login_screen.dart';

import 'depinjection/binding/inbox_binding.dart';
import 'depinjection/binding/login_binding.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyAlice App Usecases",
      home: SplashScreen(),
      // initialRoute: INBOX_PAGE,
      getPages: [
        GetPage(
          name: INBOX_PAGE,
          page: () => Inbox(),
          binding: InboxBinding(),
        ),
        GetPage(
            name: LOGIN_PAGE,
            page: () => LoginScreen(),
            binding: LoginBinding(),
        )
      ],
    );
  }
}