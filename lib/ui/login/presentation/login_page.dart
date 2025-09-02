import 'package:flutter/material.dart';
import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/core/extension/extension.dart';
import 'package:gem_store/core/helpers/navigation_helper.dart';
import 'package:gem_store/ui/forgot_password/presentation/forgot_password.dart';
import 'package:gem_store/ui/login/widget/login_methods.dart';
import 'package:gem_store/ui/signup/presentation/signup.dart';
import 'package:gem_store/ui/widgets/app_button.dart';
import 'package:gem_store/ui/widgets/text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 58),
              Text(
                "Log into\nto your account",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              SizedBox(height: 53),
              TextFormFieldWidget(hintText: 'Email Address'),
              SizedBox(height: 40),
              TextFormFieldWidget(hintText: 'Password'),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigate.to(context, ForgotPasswordPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  AppButton(title: 'Login'),
                  SizedBox(height: 22),
                  Text(
                    'or log in with',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginMethodsWidget(
                        svg: Assets.apple_svg,
                      ),
                      SizedBox(width: 20),
                      LoginMethodsWidget(
                        svg: Assets.google_svg,
                      ),
                      SizedBox(width: 20),
                      LoginMethodsWidget(
                        svg: Assets.facebook_svg,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: context.bottomBarHeight + 30.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigate.to(context, SignupPage());
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
