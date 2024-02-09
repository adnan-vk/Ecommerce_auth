// ignore_for_file: use_key_in_widget_constructors

import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/view/home_page/home_page.dart';
import 'package:authentication/view/login_page/widgets/login_widgets.dart';
import 'package:authentication/view/signup_page/signup.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/divider.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<ProviderEmail>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .2,
              ),
              Material(
                elevation: 5,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  width: double.infinity,
                  height: size.height * .7,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget().text(data: "WELCOME BACK")),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget().text(
                              data: "Log In",
                              color: appcolor.orange,
                              weight: FontWeight.bold,
                              size: 30.0)),
                      const SizedBox(
                        height: 15,
                      ),
                      textFormField().textformfield(
                          controller: pro.emailController,
                          labeltext: "Enter Your Email"),
                      const SizedBox(
                        height: 20,
                      ),
                      textFormField().textformfield(
                          controller: pro.passwordController,
                          labeltext: "Enter Your Password"),
                      const SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton.extended(
                        label: TextWidget().text(data: "LOGIN"),
                        backgroundColor: appcolor.orange,
                        onPressed: () {
                          // userLogin(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      divider().lineDivider(text: "or"),
                      LoginPageWidget().loginIcons(context),
                      Row(
                        children: [
                          TextWidget().text(data: "Don't Have an Account ? "),
                          TextButton(
                              onPressed: () {
                                pro.signInEmail(pro.emailController.text,
                                    pro.passwordController.text);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SigninScreen(),
                                    ));
                              },
                              child: TextWidget().text(
                                  data: "SIGNUP", color: appcolor.orange)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // userLogin(context) async {
  //   bool isLoginSuccessful = true;

  //   if (isLoginSuccessful) {
  //     final prefs = await SharedPreferences.getInstance();
  //     prefs.setBool('savekey', true);

  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const BottomBar()),
  //     );
  //   }
  // }
}
