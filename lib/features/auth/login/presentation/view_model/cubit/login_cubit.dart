import 'package:car_zone/core/helpers/api_result.dart';
import 'package:car_zone/core/model/user_model.dart';
import 'package:car_zone/features/auth/login/data/repo/login_repo.dart';
import 'package:car_zone/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  loginWithEmailAndPasswordCubit({required UserModel user}) async {
    emit(LoginLoading());
    final result = await loginRepo.loginWithEmailAndPassword(user: user);
    if (result is Success) {
      emit(LoginSuccess());
    } else {
      emit(LoginFaulier(errorMessage: (result as Failure).error));
    }
  }
}
