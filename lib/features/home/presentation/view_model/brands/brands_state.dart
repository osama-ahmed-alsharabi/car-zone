import 'package:car_zone/features/home/data/model/brand_model.dart';

abstract class BrandsState {}

final class BrandsInitial extends BrandsState {}

final class BrandsSuccess extends BrandsState {
  final List<BrandModel> brands;

  BrandsSuccess({required this.brands});
}

final class BrandsLoading extends BrandsState {}

final class BrandsFauiler extends BrandsState {
  final String errorMessage;

  BrandsFauiler({required this.errorMessage});
}
