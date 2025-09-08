import 'package:bloc/bloc.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }
}
