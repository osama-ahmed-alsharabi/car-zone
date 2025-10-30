import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/core/helpers/secure_token_storage.dart';
import 'package:car_zone/features/profile/data/repo/profile_repo.dart';
import 'package:car_zone/features/profile/presentation/view_model/user_cars/user_cars_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCarsCubit extends Cubit<UserCarsState> {
  final ProfileRepo profileRepo;
  final ApiHelper api;
  final SecureTokenStorage secureTokenStorage;
  UserCarsCubit(this.profileRepo, this.api, this.secureTokenStorage)
    : super(UserCarsInitial());

  getUserCars() async {
    emit(UserCarsLoading());
    final result = await profileRepo.getUserCars();
    if (result is Success) {
      emit(UserCarsSuccess(carModel: (result as Success).value));
    } else {
      emit(UserCarsFauiler(carModel: (result as Failure).error));
    }
  }

  deleteUserCar({required String id}) async {
    emit(UserCarsLoading());
    final token = await secureTokenStorage.getToken();
    final result = await api.delete(
      token: token,
      endPoint: "products",
      contentType: "",
      accept: "",
      id: id,
    );
    if (result is Success) {
      getUserCars();
      emit(UserCarsDeleted(message: "تم الحذف بنجاح"));
    } else {
      emit(UserCarsFailedToDelete(errorMessage: (result as Failure).error));
    }
  }
}
