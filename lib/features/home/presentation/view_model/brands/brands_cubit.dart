import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/home/data/repo/home_repo.dart';
import 'package:car_zone/features/home/presentation/view_model/brands/brands_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final HomeRepo homeRepo;
  BrandsCubit(this.homeRepo) : super(BrandsInitial());

  bool _hasLoaded = false; 

  Future<void> getBrands({bool forceRefresh = false}) async {
    if (_hasLoaded && !forceRefresh) return;
    emit(BrandsLoading());
    final result = await homeRepo.getBarnd();
    if (result is Success) {
      _hasLoaded = true;
      emit(BrandsSuccess(brands: (result as Success).value));
    } else if (result is Failure) {
      emit(BrandsFauiler(errorMessage: (result as Failure).error));
    }
  }
}
