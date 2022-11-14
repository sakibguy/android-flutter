import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_alice_usecase_from_0/utils/colors.dart';
import 'package:practice_alice_usecase_from_0/utils/constant_strings.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool passwordVisible = false;
  final _formGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.green;
    }

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Image(
                width: 150,
                image: AssetImage('assets/launch_icon/myalice_black_trnsprnt.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(LOGIN_SCREEN_TITLE,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:FontWeight.w800,
                  fontFamily: "inter",
                ),
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
                          validator: (value) {
                            // final: https://api.flutter.dev/flutter/dart-core/String/trim.html
                            final trimmed = value!.trim();
                            print("[---ok---] ui trimmed=$trimmed"); // Debug

                            return GetUtils.isEmail(trimmed)
                                ? null
                                : "Please enter valid Email\n";
                          },
                          decoration: InputDecoration(
                              hintText: "Email Address",
                              errorStyle: TextStyle(fontSize: 12, height: 0.5),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  )),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0,
                                horizontal: 20.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AliceColors.ALICE_GREEN,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                          ),
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: _passwordController,
                          autovalidateMode: AutovalidateMode.disabled,
                          textAlign: TextAlign.start,
                          autofocus: false,
                          onChanged: (value) {},
                          validator: (value) {
                            return value!.isNotEmpty ? null : "Required field";
                          },
                          decoration: InputDecoration(
                            hintText: "Your Password",
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
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                )),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AliceColors.ALICE_GREEN,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: 20.0,
                            ),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: FractionalOffset.centerLeft,
                  child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Expanded (
                              child: Text('Remember Me')
                          ),
                        )
                      ],
                  ),
                ),
                Align(
                  alignment: FractionalOffset.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.0),
                        child: Expanded(
                          child: Text("Forgot your password?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}