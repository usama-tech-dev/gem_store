import 'package:flutter/material.dart';
import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/core/extension/extension.dart';
import 'package:gem_store/core/helpers/navigation_helper.dart';
import 'package:gem_store/ui/login/presentation/login_page.dart';
import 'package:gem_store/ui/login/widget/login_methods.dart';
import 'package:gem_store/ui/widgets/app_button.dart';
import 'package:gem_store/ui/widgets/text_form_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                "Create\n your account",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              SizedBox(height: 43),
              TextFormFieldWidget(hintText: 'Email Address'),
              SizedBox(height: 40),
              TextFormFieldWidget(hintText: 'Password'),
              SizedBox(height: 40),
              TextFormFieldWidget(hintText: 'Password'),
              SizedBox(height: 40),
              TextFormFieldWidget(hintText: 'Confirm Password'),
              SizedBox(height: 50),
              Column(
                children: [
                  AppButton(title: 'Signup'),
                  SizedBox(height: 22),
                  Text(
                    'or sign up with',
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
                      Text("Already have account? "),
                      GestureDetector(
                        onTap: () {
                          Navigate.to(context, LoginPage());
                        },
                        child: Text(
                          "Login",
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
