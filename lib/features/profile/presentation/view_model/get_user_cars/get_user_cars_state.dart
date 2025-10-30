import 'package:car_zone/features/home/data/model/car_model.dart';

abstract class GetUserCarsState {}

final class GetUserCarsInitial extends GetUserCarsState {}

final class GetUserCarsSuccess extends GetUserCarsState {
  final CarModel carModel;

  GetUserCarsSuccess({required this.carModel});
}

final class GetUserCarsFauiler extends GetUserCarsState {
  final CarModel carModel;

  GetUserCarsFauiler({required this.carModel});
}

final class GetUserCarsLoading extends GetUserCarsState {}
