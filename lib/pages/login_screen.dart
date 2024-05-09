import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:zed_stores/authentication/auth_methods.dart';
import 'package:zed_stores/core/constants/constants.dart';
import 'package:zed_stores/core/utils/reusables.dart';
import 'package:zed_stores/core/utils/shared_textfield.dart';
import 'package:zed_stores/pages/app_screen.dart';
import 'package:zed_stores/pages/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void loginUser() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });

      FireBaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthIcons(authIcon: Icons.shopping_cart_outlined),
                    kSizedBox,
                    Text('WELCOME BACK',
                        style: Theme.of(context).textTheme.bodyLarge),
                    kSizedBox,
                    InputTextWidget(
                      hintText: 'Email Address',
                      iconData: Icons.mail_outline,
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                      myValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email address';
                        }
                        return null;
                      },
                    ),
                    kSizedBox,
                    InputTextWidget(
                      hintText: 'Password',
                      iconData: Icons.lock_outline,
                      textInputType: TextInputType.visiblePassword,
                      controller: passwordController,
                      myValidator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text('Forgot Password',
                              style: kForgetPaswwordStyle),
                        ),
                      ),
                    ),
                    kSizedBox,
                    ExpandedButton(
                      onPress: loginUser,
                      text: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'LOGIN',
                          style: kTextStyleSpacing,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text('I have no account', style: kSmallFont),
                    ),
                    SocialAccountButtons(
                      onPress: () {
                        FireBaseAuthMethods(FirebaseAuth.instance)
                            .signInWithGoogle(context);
                      },
                      text: Text(
                        'Continue With Google',
                        style: kWTextStyleSpacing.copyWith(color: Colors.white),
                      ),
                      socialIcon: FontAwesomeIcons.google,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SocialAccountButtons(
                      onPress: () {},
                      text: Text(
                        'Continue With Phone',
                        style: kWTextStyleSpacing.copyWith(color: Colors.white),
                      ),
                      socialIcon: FontAwesomeIcons.phone,
                    )
                  ],
                ),
                // Loader with blurred background
                if (isLoading)
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      child: Container(
                        color: Colors.transparent,
                        child: const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
