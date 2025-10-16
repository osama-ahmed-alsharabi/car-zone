import 'package:car_zone/core/helpers/api_result.dart';
import 'package:car_zone/core/model/user_model.dart';
import 'package:car_zone/features/auth/register/data/repo/register_repo.dart';
import 'package:car_zone/features/auth/register/presentation/view_model/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  registerCubit({required UserModel user}) async {
    emit(RegisterLoading());
    ApiResult result = await registerRepo.registerEmailAndPasswordWithFirebase(
      user: user,
    );

    if (result is Success) {
      emit(RegisterSuccessful());
    } else {
      emit(RegisterFailure(errorMessage: (result as Failure).error));
    }
  }
}
