import 'dart:developer';

import 'package:ecommerceproject/const/appConst.dart';
import 'package:ecommerceproject/cubit/auth/authapp_cubit.dart';
import 'package:ecommerceproject/services/FirebaseConnect.dart';
import 'package:ecommerceproject/views/widgets/appComponant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: BlocConsumer<AuthappCubit, AuthappState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/shop.png"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleText(
                          context: context,
                          text: 'LOGIN',
                        ),
                      ],
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            defaultTextField(
                              controller: userController,
                              hintText: "Enter your Email...",
                              keyboardType: TextInputType.emailAddress,
                              labelText: "Email",
                              obscureText: false,
                              prefixIcon: Icons.email_outlined,
                              validateText: "Please Enter Correct Email",
                              context: context,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            defaultTextField(
                              controller: passwordController,
                              hintText: "Enter your Password",
                              keyboardType: TextInputType.text,
                              labelText: "Password",
                              obscureText: true,
                              prefixIcon: Icons.lock_outline,
                              suffixIconAvailable: true,
                              suffixIcon: Icons.remove_red_eye_outlined,
                              validateText:
                                  "Password must be more then 6 character",
                              context: context,
                            ),
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        textButtonWidget(
                            textButtonColor: assistColor,
                            textButtontxt: "Forget Password",
                            buttonFunc: () {}),
                      ],
                    ),
                    defaultButtonWidget(
                      buttonText: "Login",
                      buttonFunc: () async {
                        if (formKey.currentState.validate()) {
                          log('Form State : ${formKey.currentState.validate()}');

                          try {
                            await AuthappCubit().get(context).loginMethod(
                                emailText: userController.text,
                                passwordText: passwordController.text);
                          } catch (error) {
                            print(error);
                            Fluttertoast.showToast(
                                msg: "$error",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          // print(object);
                          Navigator.of(context)
                              .pushReplacementNamed('/homeScreen');
                        }
                      },
                    ),
                    textButtonWidget(
                        textButtonColor: mainColor,
                        textButtontxt: "Don't have account , Create New One.",
                        buttonFunc: () {}),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: assistColor,
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In With Social Networks",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: assistColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        imageButtonWidget(
                            buttonImage: "assets/images/social/google.png",
                            buttonColor: facebookColor,
                            buttonFunc: () {}),
                        imageButtonWidget(
                            buttonImage: "assets/images/social/facebook.png",
                            buttonColor: googleColor,
                            buttonFunc: () {}),
                        imageButtonWidget(
                            buttonImage: "assets/images/social/apple.png",
                            buttonColor: facebookColor,
                            buttonFunc: () {}),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
