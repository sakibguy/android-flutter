import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:practice_alice_usecase_from_0/utils/constant_strings.dart';
import 'package:practice_alice_usecase_from_0/utils/shared_pref.dart';
import 'package:practice_alice_usecase_from_0/utils/routes/routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  Color myAliceTextColor = HexColor("#111827");

  @override
  void initState() {
    whichScreenToNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Image(
                    image: AssetImage('assets/launch_icon/myalice_black_trnsprnt.png')
                ),
              ),
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(ALICE_LABS,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
                    child: Image(
                        image: AssetImage('assets/other_imgs/line.png')
                    ),
                  )
              )
            ],
          )
        )
      );
  }

  Future<void> whichScreenToNavigate() async {
    final SharedPref _sharedPref = SharedPref();
    token = await _sharedPref.readString("apiToken");

    Timer(Duration(seconds: 5), () {
      // Get.offNamed(LOGIN_PAGE);
      // token != null && token!.isNotEmpty ? Get.offNamed(LOGIN_PAGE) : Get.offNamed(INBOX_PAGE);
      token != null && token!.isNotEmpty ? Get.offNamed(INBOX_PAGE) : Get.offNamed(LOGIN_PAGE);
    });
  }
}