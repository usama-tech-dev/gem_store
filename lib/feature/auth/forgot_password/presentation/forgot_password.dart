import 'package:flutter/material.dart';
import 'package:gem_store/core/helpers/navigation_helper.dart';
import 'package:gem_store/feature/auth/forgot_password/presentation/verification_screen.dart';
import 'package:gem_store/feature/widgets/app_button.dart';
import 'package:gem_store/feature/widgets/text_form_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.5,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.arrow_back_ios_new_sharp),
              ),
              SizedBox(height: 35),
              Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                'Enter email associated with your account and we’ll send and email with intructions to reset your '
                'password',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 80),
              TextFormFieldWidget(
                hintText: 'enter your email here',
                prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
              ),
              SizedBox(height: 80),
              AppButton(
                title: 'Send code',
                onTap: () {
                  Navigate.to(context, VerificationScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
