import 'package:car_zone/core/database/app_database.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:car_zone/features/home/data/model/images_model.dart';
import 'package:sqflite/sqflite.dart';

class CarLocalDataSource {
  Future<void> cacheCars(List<CarModel> cars) async {
    final db = await AppDatabase().database;

    await db.delete('cars');

    for (var car in cars) {
      await db.insert(
        'cars',
        {
          'id': car.id,
          'title': car.title,
          'description': car.description,
          'model': car.model.toString(),
          'price': car.price,
          'condition': car.condition,
          'engine_cylinders': car.engineCylinders,
          'fuel_type': car.fuelType,
          'latitude': car.latitude.toString(),
          'longitude': car.longitude.toString(),
          'brand_id': car.brandId,
          'province_id': car.provinceId,
          'user_id': car.userId,
          'main_image': car.images.mainImage,
          'sub_image': car.images.subImage,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<CarModel>> getCachedCars() async {
    final db = await AppDatabase().database;
    final data = await db.query('cars');

    return data.map((e) {
      return CarModel(
        id: e['id'] as int,
        title: e['title'] as String,
        description: e['description'] as String,
        model: e['model'],
        price: e['price'] as String,
        condition: e['condition'] as String,
        engineCylinders: e['engine_cylinders'] as String,
        fuelType: e['fuel_type'] as String,
        latitude: e['latitude'],
        longitude: e['longitude'],
        brandId: e['brand_id'] as int,
        provinceId: e['province_id'] as int,
        userId: e['user_id'] as int,
        images: ImagesModel(
          mainImage: e['main_image']  as String,
          subImage: e['sub_image'] as String,
        ),
      );
    }).toList();
  }
}
