import 'package:car_zone/features/home/data/model/car_model.dart';

abstract class UserCarsState {}

final class UserCarsInitial extends UserCarsState {}

final class UserCarsSuccess extends UserCarsState {
  final List<CarModel> carModel;

  UserCarsSuccess({required this.carModel});
}

final class UserCarsFauiler extends UserCarsState {
  final List<CarModel> carModel;

  UserCarsFauiler({required this.carModel});
}

final class UserCarsLoading extends UserCarsState {}

final class UserCarsDeleted extends UserCarsState {
  final String message;

  UserCarsDeleted({required this.message});
}

final class UserCarsFailedToDelete extends UserCarsState {
  final String errorMessage;

  UserCarsFailedToDelete({required this.errorMessage});
}
