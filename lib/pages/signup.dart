import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zed_stores/authentication/auth_methods.dart';
import 'package:zed_stores/core/constants/constants.dart';
import 'package:zed_stores/core/utils/reusables.dart';
import 'package:zed_stores/core/utils/shared_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final TextEditingController passwordController2 = TextEditingController();
  void signUpUser() async {
    print(emailController.text);
    FireBaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthIcons(
              authIcon: Icons.shopping_cart_outlined,
            ),
            kSizedBox,
            const Text('CREATE ACCOUNT', style: kTextStyleSpacing),
            kSizedBox,
            InputTextWidget(
              hintText: 'Name',
              iconData: Icons.person,
              controller: nameController,
            ),
            kSizedBox,
            InputTextWidget(
              hintText: 'Email Address',
              iconData: Icons.mail_outline,
              textInputType: TextInputType.emailAddress,
              controller: emailController,
            ),
            kSizedBox,
            InputTextWidget(
              hintText: 'Password',
              iconData: Icons.lock_outline,
              textInputType: TextInputType.visiblePassword,
              controller: passwordController,
            ),
            kSizedBox,
            ExpandedButton(
              onPress: signUpUser,
              text: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'REGISTER',
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
                  Navigator.of(context).pop();
                },
                child:
                    const Text('I have an account already', style: kSmallFont)),
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }
}
