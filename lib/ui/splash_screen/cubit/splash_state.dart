part of 'splash_cubit.dart';

enum SplashStatus { initial, success, loading }

class SplashState {
  final SplashStatus status;

  const SplashState({required this.status});

  SplashState copyWith({SplashStatus? status}) {
    return SplashState(status: status ?? this.status);
  }
}
