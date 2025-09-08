import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_store/core/constants/assets.dart';
import 'package:gem_store/feature/auth/onboarding/onboarding.dart';
import 'package:gem_store/feature/splash_screen/cubit/splash_cubit.dart';
import 'package:gem_store/feature/widgets/onboarding_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startTimer(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state.status == SplashStatus.success) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Onboarding(),
                ),
              );
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Image.asset(
                  Assets.splash,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              Positioned(
                left: 50,
                right: 50,
                bottom: 150,
                child: Column(
                  children: [
                    Text(
                      "Welcome to GemStore!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      "The home for a fashionista",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 60),
                    GlassButton(
                      title: 'Get Started',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
