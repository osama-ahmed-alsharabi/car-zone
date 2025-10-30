import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/profile/data/repo/profile_repo.dart';
import 'package:car_zone/features/profile/presentation/view_model/get_user_cars/get_user_cars_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserCarsCubit extends Cubit<GetUserCarsState> {
  final ProfileRepo profileRepo;
  GetUserCarsCubit(this.profileRepo) : super(GetUserCarsInitial());

  getUserCars() async {
    emit(GetUserCarsLoading());
    final result = await profileRepo.getUserCars();
    if (result is Success) {
      emit(GetUserCarsSuccess(carModel: (result as Success).value));
    } else {
      emit(GetUserCarsFauiler(carModel: (result as Failure).error));
    }
  }
}
