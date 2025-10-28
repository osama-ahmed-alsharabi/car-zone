import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';

abstract class GetDataState {}

final class GetDataInitial extends GetDataState {}

final class GetDataSuccess extends GetDataState {
  final List<BrandModel> brands;
  final List<CarModel> cars;

  GetDataSuccess({required this.brands , required this.cars});
}

final class GetDataLoading extends GetDataState {}

final class GetDataFauiler extends GetDataState {
  // final String errorMessage;
  final List<CarModel> cars;
  GetDataFauiler({required this.cars});
}
