import 'package:car_zone/core/database/dao/user_dao.dart';
import 'package:car_zone/core/model/user_model.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserViewModelCubit extends Cubit<UserViewModelState> {
  final UserDao userDao;
  UserViewModelCubit(this.userDao) : super(UserViewModelInitial());
  getUserData() async {
    UserModel? user = await userDao.getUser();
    if (user != null) {
      emit(UserViewModelHasData(user: user));
    } else {
      emit(UserViewModelNoData());
    }
  }
}
