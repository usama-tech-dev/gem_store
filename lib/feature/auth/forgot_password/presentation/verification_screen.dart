import 'package:flutter/material.dart';
import 'package:gem_store/core/helpers/navigation_helper.dart';
import 'package:gem_store/feature/auth/forgot_password/presentation/new_password.dart';
import 'package:gem_store/feature/widgets/app_button.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
                'Verification Mode?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                'Please enter the verification code we sent to your email address',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Pinput(
                  defaultPinTheme: PinTheme(
                    width: 70,
                    height: 70,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(30, 60, 87, 1),
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onCompleted: (value) {
                    if (value.isNotEmpty) {}
                  },
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Resend in 00:10",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 50),
              AppButton(
                title: 'Verify code',
                onTap: () {
                  Navigate.to(context, NewPassword());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
