import 'package:car_zone/core/model/user_model.dart';

abstract class UserViewModelState {}

final class UserViewModelInitial extends UserViewModelState {}

final class UserViewModelHasData extends UserViewModelState {
  final UserModel user;

  UserViewModelHasData({required this.user});
}

final class UserViewModelNoData extends UserViewModelState {}
