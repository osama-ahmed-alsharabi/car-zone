import 'package:car_zone/features/home/data/model/images_model.dart';

class CarModel {
  final int? id;
  final String title;
  final String description;
  final dynamic model;
  final String price;
  final String condition;
  final String engineCylinders;
  final String fuelType;
  final dynamic latitude;
  final dynamic longitude;
  final int brandId;
  final int provinceId;
  final int userId;
  final ImagesModel images;

  CarModel({
    this.id,
    required this.title,
    required this.description,
    required this.model,
    required this.price,
    required this.condition,
    required this.engineCylinders,
    required this.fuelType,
    this.latitude,
    this.longitude,
    required this.brandId,
    required this.provinceId,
    required this.userId,
    required this.images,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      model: json['model'],
      price: json['price'],
      condition: json['condition'],
      engineCylinders: json['engine_cylinders'],
      fuelType: json['fuel_type'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      brandId: json['brand_id'],
      provinceId: json['province_id'],
      userId: json['user_id'],
      images: ImagesModel.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'model_car': model,
      'price': price,
      'car_status': condition,
      'engine_number': engineCylinders,
      'fuel_type': fuelType,
      'brand_id': brandId,
      'province_id': provinceId,
      'user_id': userId,
      'images': images.toJson(),
    };
  }
}
