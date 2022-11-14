import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:practice_alice_usecase_from_0/utils/shared_pref.dart';
import 'package:practice_alice_usecase_from_0/utils/routes/routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  // Color color1 = HexColor("b74093");
  Color myAliceTextColor = HexColor("#111827");
  // Color color3 = HexColor("#88b74093"); // If you wish to use ARGB format

  @override
  void initState() {
    whichScreenToNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                // height: 200,
                // width: 200,
                // // padding: EdgeInsets.only(top: 10.0),
                // padding: EdgeInsets.only(right: 20.0),
                // margin: const EdgeInsets.only(left: 10.0),
                child: Expanded(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('assets/launch_icon/myalice_white_trnsprnt.png'),
                  )
                ),
              ),
              Container(
                //margin: EdgeInsets.only(right: 100.0),
                padding: EdgeInsets.only(right: 100.0),
                // margin: const EdgeInsets.only(right: 20),
                child: Expanded(
                    child: Text("myalice",
                        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)
                    ),
                  ),
              ),
            ],
          ),
        ),
    );
  }

  Future<void> whichScreenToNavigate() async {
    final SharedPref _sharedPref = SharedPref();
    token = await _sharedPref.readString("apiToken");

    Timer(Duration(seconds: 100), () {
      // Get.offNamed(LOGIN_PAGE);
      token != null && token!.isNotEmpty ? Get.offNamed(INBOX_PAGE): Get.offNamed(LOGIN_PAGE);
    });
  }
}