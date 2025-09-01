import 'package:bloc/bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(status: SplashStatus.initial));

  void startTimer() async {
    await Future.delayed(Duration(seconds: 2));
    emit(state.copyWith(status: SplashStatus.success));
  }
}
