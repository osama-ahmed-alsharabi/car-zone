import 'package:car_zone/features/home/presentation/view_model/home_ui/home_ui_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUiCubit extends Cubit<HomeUiState> {
  HomeUiCubit() : super(HomeUiInitial());

  changeHomeUi({required int pageNumber}) {
    if (pageNumber == 1) {
      emit(HomeUiHome());
    } else if (pageNumber == 2) {
      emit(HomeUiFavorite());
    } else {
      emit(HomeUiPerson());
    }
  }
}
