import 'dart:developer';
import 'dart:ui';

import 'package:ecommerceproject/const/appConst.dart';
import 'package:ecommerceproject/cubit/auth/authapp_cubit.dart';
import 'package:ecommerceproject/views/widgets/appComponant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode myFocusNode = FocusNode();
  bool _obscureBool = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: BlocConsumer<AuthappCubit, AuthappState>(
              listener: (context, state) {},
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
                              focusNode: myFocusNode,
                              controller: emailController,
                              hintText: "Enter your Email...",
                              keyboardType: TextInputType.emailAddress,
                              labelText: "Email",
                              obscureBool: false,
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
                              obscureBool: _obscureBool,
                              prefixIcon: Icons.lock_outline,
                              suffixIconAvailable: true,
                              suffixIcon: (_obscureBool)
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.eyeSlash,
                                          color: mainColor,
                                          size: 20,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.eye,
                                          color: mainColor,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                              changeSuffixIconFunc: obscureChange,
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
                        childWidget: (state is AuthappLoading)
                            ? appCircularProgress()
                            : null,
                        buttonText: (state is! AuthappLoading) ? 'LogIn' : '',
                        buttonFunc: buttonTapFunc),
                    textButtonWidget(
                        textButtonColor: mainColor,
                        textButtontxt: "Don't have account , Create New One.",
                        buttonFunc: () {
                          print("object");
                          Navigator.pushReplacementNamed(
                              context, "/registerScreen");
                        }),
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

  bool obscureChange() {
    setState(() {
      _obscureBool = !_obscureBool;
    });
  }

  void buttonTapFunc() async {
    if (formKey.currentState.validate()) {
      log('Form State : ${formKey.currentState.validate()}');

      try {
        await AuthappCubit()
            .get(context)
            .loginMethod(
                emailText: emailController.text,
                passwordText: passwordController.text)
            .then((value) {
          Navigator.of(context).pushReplacementNamed('/homeScreen');
        });
      } catch (error) {
        toastMessage(context: context, errorMessage: error);
        formKey.currentState.reset();
        myFocusNode.requestFocus();
      }
    }
  }
}
