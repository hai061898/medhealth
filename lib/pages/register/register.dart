import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medhealth/api/url_api.dart';
import 'package:medhealth/pages/login/login_screen.dart';
import 'package:medhealth/utils/constants.dart';
import 'package:medhealth/widgets/button_primary.dart';
import 'package:medhealth/widgets/logo_space.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  registerSubmit() async {
    var registerUrl = Uri.parse(BASEURL.apiRegister);
    final response = await http.post(registerUrl, body: {
      "fullname": fullNameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "address": addressController.text,
      "password": passwordController.text,
    });
    final data = jsonDecode(response.body);

    int value = data['value'];
    String message = data['message'];

    if (value == 1) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Information"),
                content: Text(message),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const LoginScreen()),
                            (route) => false);
                      },
                      child: const Text("Ok"))
                ],
              ));
      setState(() {});
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Information"),
                content: Text(message),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"))
                ],
              ));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const LogoSpace(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "REGISTER",
                style: regulerTextStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Register new your account",
                style: regulerTextStyle.copyWith(
                    fontSize: 15, color: greyLightColor),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: whiteColor),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Full Name',
                      hintStyle: lightTextStyle.copyWith(
                          fontSize: 15, color: greyLightColor)),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: whiteColor),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email Address',
                      hintStyle: lightTextStyle.copyWith(
                          fontSize: 15, color: greyLightColor)),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: whiteColor),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone',
                      hintStyle: lightTextStyle.copyWith(
                          fontSize: 15, color: greyLightColor)),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: whiteColor),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Home Address',
                      hintStyle: lightTextStyle.copyWith(
                          fontSize: 15, color: greyLightColor)),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x40000000),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                    color: whiteColor),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: passwordController,
                  obscureText: _secureText,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: _secureText
                            ? const Icon(
                                Icons.visibility_off,
                                size: 20,
                              )
                            : const Icon(
                                Icons.visibility,
                                size: 20,
                              ),
                      ),
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: lightTextStyle.copyWith(
                          fontSize: 15, color: greyLightColor)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonPrimary(
                text: "REGISTER",
                onPressed: () {
                  if (fullNameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      addressController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text("Warning !!"),
                              content: const Text("Please, enter the fields"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ok"))
                              ],
                            ));
                  } else {
                    registerSubmit();
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: lightTextStyle.copyWith(
                        color: greyLightColor, fontSize: 15),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) =>const LoginScreen()),
                          (route) => false);
                    },
                    child: Text(
                      "Login now",
                      style: boldTextStyle.copyWith(
                          color: greenColor, fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
