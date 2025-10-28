import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/home/data/repo/home_repo.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetDataCubit extends Cubit<GetDataState> {
  final HomeRepo homeRepo;
  GetDataCubit(this.homeRepo) : super(GetDataInitial());

  bool _hasLoaded = false;

  Future<void> getGetData({bool forceRefresh = false}) async {
    if (_hasLoaded && !forceRefresh) return;
    emit(GetDataLoading());
    final brands = await homeRepo.getBarnd();
    final cars = await homeRepo.getCars();
    if (brands is Success && cars is Success) {
      _hasLoaded = true;
      emit(
        GetDataSuccess(
          cars: (cars as Success).value,
          brands: (brands as Success).value,
        ),
      );
    } else if (brands is Failure) {
      emit(GetDataFauiler(cars: (cars as Failure).error));
    }
  }
}
