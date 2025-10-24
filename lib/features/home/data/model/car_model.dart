class CarModel {
  int id;
  String title;
  String description;
  String modelCar;
  String price;
  String carStatus;
  String engineNumber;
  String fuelType;
  String latitude;
  String longitude;
  int brandId;
  int provinceId;
  DateTime createdAt;
  DateTime updatedAt;
  String mainImageUrl;
  String subImageUrl;

  CarModel({
    required this.id,
    required this.title,
    required this.description,
    required this.modelCar,
    required this.price,
    required this.carStatus,
    required this.engineNumber,
    required this.fuelType,
    required this.latitude,
    required this.longitude,
    required this.brandId,
    required this.provinceId,
    required this.createdAt,
    required this.updatedAt,
    required this.mainImageUrl,
    required this.subImageUrl,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      modelCar: json['model_car'] ?? '',
      price: json['price'] ?? '',
      carStatus: json['car_status'] ?? '',
      engineNumber: json['engine_number'] ?? '',
      fuelType: json['fuel_type'] ?? '',
      latitude: json['latitude']?.toString() ?? '',
      longitude: json['longitude']?.toString() ?? '',
      brandId: json['brand_id'] is int
          ? json['brand_id']
          : int.tryParse(json['brand_id'].toString()) ?? 0,
      provinceId: json['province_id'] is int
          ? json['province_id']
          : int.tryParse(json['province_id'].toString()) ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ??
          DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ??
          DateTime.now(),
      mainImageUrl: json['main_image_url'] ?? '',
      subImageUrl: json['sub_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'model_car': modelCar,
      'price': price,
      'car_status': carStatus,
      'engine_number': engineNumber,
      'fuel_type': fuelType,
      'latitude': latitude,
      'longitude': longitude,
      'brand_id': brandId,
      'province_id': provinceId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'main_image_url': mainImageUrl,
      'sub_image_url': subImageUrl,
    };
  }
}
