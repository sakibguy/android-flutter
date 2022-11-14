import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_alice_usecase_from_0/utils/colors.dart';
import 'package:practice_alice_usecase_from_0/utils/constant_strings.dart';

import '../utils/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool passwordVisible = false;
  final _formGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(LOGIN_SCREEN_TITLE,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight:FontWeight.w800,
                fontFamily: "inter",
              ),
            ),
            SizedBox(
              height: 25
            ),
            Form(
                key: _formGlobalKey,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          autovalidateMode: AutovalidateMode.disabled,
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: "Email Address"
                          ),
                          validator: (value) {
                            final trimmed = value!.trim();

                            return GetUtils.isEmail(trimmed) ? null : "Please enter valid Email.\n";
                          },
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: null,
                          autovalidateMode: AutovalidateMode.disabled,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible == true
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ), onPressed: () {
                                if (mounted) {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                }
                              },
                            )
                          ),
                          obscureText: passwordVisible,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                    )
                  ],
                )
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AliceColors.ALICE_GREEN,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0)
                      )
                    ),
                  ),
                  onPressed: () {
                    // if(_formGlobalKey.currentState!.validate()) {
                    //   _formGlobalKey.currentState!.save();
                    //
                    //   String email = _emailController.text.trim();
                    //
                    //   Get.put(LoginApiController())
                    //     .login(_emailController.text.trim(), _passwordController.text.trim())
                    //     .then((value) {
                    //
                    //       Get.offNamed(INBOX_PAGE);
                    //   });
                    // }
                  },
                  child: Text('Sign In',
                    style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}